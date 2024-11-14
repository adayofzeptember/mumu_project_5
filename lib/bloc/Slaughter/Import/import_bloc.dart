import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:mumu_project/ETC/api.dart';
import 'package:mumu_project/ETC/dialog.dart';
import 'package:mumu_project/ETC/double_converter.dart';
import 'package:mumu_project/bloc/Slaughter/Import/Model.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'import_event.dart';
part 'import_state.dart';

class ImportBloc extends Bloc<ImportEvent, ImportState> {
  final dio = Dio();
  ImportBloc()
      : super(ImportState(
            weight_history_list: [],
            last_weight: '',
            deadPigs: 0,
            isLoading: false,
            abnormalPigsListCount: 0,
            abnormalPigsList: [],
            lsq_lot_num: '',
            balance_num: '')) {
    on<AbnormalPigs_Add>((event, emit) async {
      emit(state.copyWith(
          abnormalPigsListCount: state.abnormalPigsListCount + 1));
    });
    on<DeadPigs_Plus>((event, emit) async {
      emit(state.copyWith(deadPigs: state.deadPigs + 1));
    });

    on<DeadPigs_Minus>((event, emit) async {
      if (state.deadPigs <= 0) {
        emit(state.copyWith(deadPigs: 0));
      } else {
        emit(state.copyWith(deadPigs: state.deadPigs - 1));
      }
    });
    //?!------------------------------------------------------------------------------------------------

    on<Weight_SendUI2_3>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      SharedPreferences prefs = await SharedPreferences.getInstance();
      String tokenAuth = prefs.getString('userToken').toString();
      //* ---------------------------------รูป-------------------
      List<MultipartFile> multipleImages = [];

      for (final imageFiles in event.picsFiles!) {
        String fileName = imageFiles.path.split('/').last;

        MultipartFile file =
            await MultipartFile.fromFile(imageFiles.path, filename: fileName);
        multipleImages.add(file);
      }

      final formDataPics = FormData.fromMap(
          {'type[images]': 'image', 'files[images][]': multipleImages});

      try {
        final responseUpload = await dio.post(api_url + "upload-files",
            options: Options(
              headers: {
                "Authorization": "Bearer $tokenAuth",
              },
            ),
            data: formDataPics);
        //* ---------------------------------รูป---------------------------------
        if (responseUpload.statusCode == 200) {
          final formData;
          formData = FormData.fromMap({
            "balance_id": event.balance_id,
            "weight": event.getWeight,
            "pig_type": event.getPig_type,
            "weight_type": event.getWeight_type,
            "files": responseUpload.data['data']
          });
          final responseSendPost =
              await dio.post(api_url + "add-pig-arrival-list",
                  options: Options(
                    headers: {
                      "Authorization": "Bearer $tokenAuth",
                    },
                  ),
                  data: formData);
          if (responseSendPost.statusCode == 200) {
            emit(state.copyWith(isLoading: false));

            print(
                '-------------------success post weight import-------------------');

            print(responseSendPost.data['data']);

            SuccessMessage_Dialog(
              event.context,
              'เพิ่มข้อมูลเสร็จสิ้น',
            );
          } else {
            emit(state.copyWith(isLoading: false));

            print('-------------------failed post-------------------');
            print(responseSendPost.data['data']);
          }
        } else {
          emit(state.copyWith(isLoading: false));

          print('-------------------failed upload-------------------');
          print(responseUpload.data['data']);
        }

        add(Fetch_Weight_History());
        add(Fetch_LastedWeight());
      } on DioException catch (e) {
        emit(state.copyWith(isLoading: false));

        print(e.response!.data);
      }
    });

    //?!------------------------------------------------------------------------------------------------

    on<Fetch_Weight_History>((event, emit) async {
      //? ดึงประวัติการชั่งหน้านำเข้่า

      print('do fetch weight History (import)');
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String tokenAuth = prefs.getString('userToken').toString();

      try {
        final response = await dio.get(
          api_url + "pig-arrival-lists",
          options: Options(
            headers: {
              "Authorization": "Bearer $tokenAuth",
            },
          ),
        );

        var data = [];
        if (response.statusCode == 200) {
          for (var elements in response.data['data']['pig_arrival_lists']) {
            data.add(Weight_History(
              id: await elements['id'].toString(),
              order: await elements['order'].toString(),
              weight: await convertToDouble(elements['weight'].toString()),
              pig_type: await elements['pig_type'].toString(),
              weight_type: await elements['weight_type'].toString(),
              pig_discount: await elements['pig_discount'].toString(),
            ));
          }

          emit(state.copyWith(
              weight_history_list: data,
              lsq_lot_num: response.data['data']['lot_num'],
              balance_num: response.data['data']['balance_num']));
        } else {
          print('fetch weight history import failed');
        }
      } on DioException catch (e) {
        print('fetch weight history import failed');

        print(e.response!.data);
      }
    });

    on<Fetch_LastedWeight>((event, emit) async {
      //? ดึงล่าสุด
      
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String tokenAuth = prefs.getString('userToken').toString();

      try {
        final response = await dio.get(
          api_url + "last-pig-arrival-list",
          options: Options(
            headers: {
              "Authorization": "Bearer $tokenAuth",
            },
          ),
        );

        dynamic data = '';
        dynamic nestedData = response.data['data'];
        if (response.statusCode == 200) {
          print('do fetched lasted weight');
          data = Weight_History(
            order: await nestedData['order'].toString(),
            id: await nestedData['id'].toString(),
            weight:
                await convertToDouble(await nestedData['weight'].toString()),
            pig_type: await nestedData['pig_type'].toString(),
            weight_type: await nestedData['weight_type'].toString(),
            pig_discount: '',
          );
          emit(state.copyWith(last_weight: data));
        } else {
          print('fetched lasted body failed');
        }
      } on DioException catch (e) {
        print(e.response!.data);
      }
    });
  }
}
