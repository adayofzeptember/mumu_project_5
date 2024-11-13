import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:mumu_project/ETC/api.dart';
import 'package:mumu_project/ETC/dialog.dart';
import 'package:mumu_project/ETC/double_converter.dart';
import 'package:mumu_project/bloc/Slaughter/LSQ/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'lsq_event.dart';
part 'lsq_state.dart';

class LsqBloc extends Bloc<LsqEvent, LsqState> {
  final dio = Dio();
  LsqBloc()
      : super(LsqState(
            isLoading: false,
            last_body: '',
            carcass_history: [],
            lsq_history: [],
            lsq_lot_num: '',
            balance_num: '')) {
    on<SaveLSQ_UI281>((event, emit) async {
      //? บันทึกซีกร้อน
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String tokenAuth = prefs.getString('userToken').toString();
      emit(state.copyWith(isLoading: true));

      final formData = {
        "pig_arrival_id": 1,
        "balance_id": 2,
        "weight": event.get_weight,
        "result": event.get_Result,
        "tail_part": event.get_tailPart,
        "bf3": event.getBF3,
        "bf4": event.getBF4,
        "b": event.getB,
        "remark": null
      };

      try {
        final response = await dio.post(api_url + "add-hot-body",
            options: Options(
              headers: {
                "Authorization": "Bearer $tokenAuth",
              },
            ),
            data: formData);

        print('___________post LSQ HOTPARTs status_______________' +
            response.statusCode.toString());

        if (response.statusCode == 200) {
          emit(state.copyWith(isLoading: false));
          SuccessMessage_Dialog(event.context, 'เพิ่มรายการเสร็จสิ้น');
          //* ดึงใหม่เมื่อเพิ่มข้อมูลเสร็จ
          add(Fetch_LastedBody());
          add(Fetch_LSQHistory());
          add(Fetch_CarcassHistory());

          //*
        } else {
          emit(state.copyWith(isLoading: false));
        }
      } on DioException catch (e) {
        print(e.response!.data);
        emit(state.copyWith(isLoading: false));
      }
    });

    on<Fetch_LSQHistory>((event, emit) async {
      //? ดึงประวัติการชั่ง

      print('do fetch LSQ History');
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String tokenAuth = prefs.getString('userToken').toString();

      try {
        final response = await dio.get(
          api_url + "hot-body-lists",
          options: Options(
            headers: {
              "Authorization": "Bearer $tokenAuth",
            },
          ),
        );

        var data = [];
        if (response.statusCode == 200) {
          for (var elements in response.data['data']['hot_bodies']) {
            data.add(LSQ_HistoryModel(
                id: await elements['id'],
                order: await elements['order'],
                b: await elements['b'],
                bf3: await elements['bf3'],
                lsq: await elements['lsq'],
                weight: await elements['weight'],
                bf4: await elements['bf4']));
          }

          emit(state.copyWith(
              lsq_history: data,
              lsq_lot_num: response.data['data']['lot_num'],
              balance_num: response.data['data']['balance_num']));
        } else {
          print('fetc lsq history failed');
        }
      } on DioException catch (e) {
        print(e.response!.data);
      }
    });

    on<Fetch_CarcassHistory>((event, emit) async {
      //? ดึงรายงานตรวจซาก

      print('do fetch carcass');
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String tokenAuth = prefs.getString('userToken').toString();

      try {
        final response = await dio.get(
          api_url + "report-hot-body",
          options: Options(
            headers: {
              "Authorization": "Bearer $tokenAuth",
            },
          ),
        );

        var data = [];
        if (response.statusCode == 200) {
          for (var elements in response.data['data']['reports']) {
            data.add(Carcass_HistoryModel(
                orders: await List.from(elements['orders']),
                result: await elements['result'].toString(),
                total: await elements['total'].toString()));
          }

          emit(state.copyWith(
            carcass_history: data,
          ));
        } else {
          print('fetc carcass failed');
        }
      } on DioException catch (e) {
        print(e.response!.data);
      }
    });

    on<Fetch_LastedBody>((event, emit) async {
      //? ดึงล่าสุด

      print('do fetch carcass');
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String tokenAuth = prefs.getString('userToken').toString();

      try {
        final response = await dio.get(
          api_url + "last-hot-body",
          options: Options(
            headers: {
              "Authorization": "Bearer $tokenAuth",
            },
          ),
        );

        dynamic data = '';
        dynamic nestedData = response.data['data'];
        if (response.statusCode == 200) {
          data = LSQ_HistoryModel(
              bf4: await convertToDouble(nestedData['bf4']),
              id: await nestedData['id'],
              lsq: await convertToDouble(nestedData['lsq']),
              bf3: await convertToDouble(nestedData['bf3']),
              weight: await convertToDouble(nestedData['weight']),
              order: await nestedData['order'],
              b: await convertToDouble(nestedData['b']));
          emit(state.copyWith(last_body: data));
        } else {
          print('fetc lasted body failed');
        }
      } on DioException catch (e) {
        print(e.response!.data);
      }
    });
//!
  }
}
