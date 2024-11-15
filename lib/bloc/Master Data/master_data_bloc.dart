import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:mumu_project/ETC/api.dart';
import 'package:mumu_project/bloc/Master%20Data/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'master_data_event.dart';
part 'master_data_state.dart';

class MasterDataBloc extends Bloc<MasterDataEvent, MasterDataState> {
  final dio = Dio();
  MasterDataBloc()
      : super(MasterDataState(
            farmname_dropdown: [], docs_dropdown: [], abNormals_dropdown: [])) {
    on<Fetch_Farmname>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String tokenAuth = prefs.getString('userToken').toString();

      try {
        final response = await dio.get(
          api_url + "masters/farms?isDropdown=true",
          options: Options(
            headers: {
              "Authorization": "Bearer $tokenAuth",
            },
          ),
        );

        var data = [];
        if (response.statusCode == 200) {
          for (var element in response.data['data']) {
            data.add(FarmName_Data(
              id: element['value'].toString(),
              farm_name: element['label'].toString(),
            ));
          }
          print(data);
          emit(state.copyWith(farmname_dropdown: data));

          print("-------------------->" +
              state.farmname_dropdown.length.toString());
        } else {
          print('fetch master data farm name error status ');
        }
      } on DioException catch (e) {
        print('fetch master data farm name error status != 200');
        print("" + e.response!.data);
      }
    });

    on<Fetch_Docs>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String tokenAuth = prefs.getString('userToken').toString();

      try {
        final response = await dio.get(
          api_url + "masters/document-types",
          options: Options(
            headers: {
              "Authorization": "Bearer $tokenAuth",
            },
          ),
        );

        var data = [];
        if (response.statusCode == 200) {
          for (var element in response.data['data']) {
            state.docs_dropdown.add(element['document_name'].toString());
            // data.add(FarmName_Data(
            //     farm_name: element['farm_name'].toString(),
            //     id: element['id'].toString()));
          }
          emit(state.copyWith(farmname_dropdown: data));
          // print("-------------------->" + state.docs_dropdown.toString());
        } else {
          print('fetch master data docs error status ');
        }
      } on DioException catch (e) {
        print('fetch master data docs error');
        print("" + e.response!.data);
      }
    });

    on<Fetch_Abnormals>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String tokenAuth = prefs.getString('userToken').toString();

      try {
        final response = await dio.get(
          api_url + "masters/abnormals",
          options: Options(
            headers: {
              "Authorization": "Bearer $tokenAuth",
            },
          ),
        );

        // Check response data structure
        print(response.data);

        List<Abnormal_Data> data = [];
        if (response.statusCode == 200) {
          if (response.data['data'] is List) {
            for (var element in response.data['data']) {
              if (element is Map<String, dynamic> &&
                  element.containsKey('id') &&
                  element.containsKey('abnormal_name')) {
                data.add(Abnormal_Data(
                  abnormal_name: element['abnormal_name'].toString(),
                  id: element['id'].toString(),
                ));
              }
            }
          }

          emit(state.copyWith(abNormals_dropdown: data));
        } else {
          print('fetch master data docs error status');
        }
      } on DioException catch (e) {
        print('fetch master data docs error');
        if (e.response != null) {
          print(e.response!.data);
        }
      }
    });
  }
}