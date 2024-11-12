import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:mumu_project/ETC/api.dart';
import 'package:mumu_project/ETC/dialog.dart';
import 'package:mumu_project/bloc/Slaughter/Line%20Slaughter/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'line_event.dart';
part 'line_state.dart';

class LineBloc extends Bloc<LineEvent, LineState> {
  final dio = Dio();
  LineBloc()
      : super(LineState(
            isLoading: false,
            lineHistory: [],
            lotNumHistory: '',
            farmName_dropDown: [],
            lineLot_dropDown: [])) {
    //!
    on<SaveLine_UI291>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String tokenAuth = prefs.getString('userToken').toString();

      final formData = {
        "pig_arrival_id": event.get_pig_arrival_id,
        "insensible": event.get_insensible,
        "insensible_value": event.get_insensible_value,
        "stab": event.get_stab,
        "stab_value": event.get_stab_value,
        "temperature": event.get_temperature,
        "temperature_value": event.get_temperature_value,
        "remark": event.get_remark
      };

      try {
        final response = await dio.post(api_url + "add-slaughter-standard",
            options: Options(
              headers: {
                "Authorization": "Bearer $tokenAuth",
              },
            ),
            data: formData);

        print('___________post status_______________' +
            response.statusCode.toString());

        if (response.statusCode == 200) {
          emit(state.copyWith(isLoading: false));
          SuccessMessage_Dialog(event.context, 'เพิ่มรายการเสร็จสิ้น');
        } else {
          emit(state.copyWith(isLoading: false));
        }
      } on DioException catch (e) {
        print(e.response!.data);
        emit(state.copyWith(isLoading: false));
      }
    });

    on<FetchHistory_UI292>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String tokenAuth = prefs.getString('userToken').toString();

      try {
        final response = await dio.get(
          api_url + "slaughter-standard-lists",
          options: Options(
            headers: {
              "Authorization": "Bearer $tokenAuth",
            },
          ),
        );
        var data = [];
        if (response.statusCode == 200) {
          for (var elements in response.data['data']['slaughter_standards']) {
            data.add(LineHistory_Model(
              id: await elements['id'],
              order: await elements['order'],
              remark: await elements['remark'] ?? '-',
              date: await elements['recorded_at']['dateShort'],
            ));
          }

          emit(state.copyWith(
              lineHistory: data,
              lotNumHistory: response.data['data']['lot_num'].toString()));
        } else {
          print('error status != 200');
        }
      } on DioException catch (e) {
        print(e.response!.data);
      }
    });

    on<FetchLine_Lot>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String tokenAuth = prefs.getString('userToken').toString();

      try {
        final response = await dio.get(
          api_url + "pig-arrival?toDay=true",
          options: Options(
            headers: {
              "Authorization": "Bearer $tokenAuth",
            },
          ),
        );

        if (response.statusCode == 200) {
          for (var elements in response.data['data']) {
            state.lineLot_dropDown.add(elements['lot_num']);
          }
          // for (var elements in response.data['data']) {
          // print(elements['farm']['farm_name']);

          // }

          Set<String> uniqueFarmNames = {};

          for (var element in response.data['data']) {
            String farmName = element['farm']['farm_name'];

            // Check if the farmName has already been printed
            if (!uniqueFarmNames.contains(farmName)) {
              uniqueFarmNames.add(farmName);

              state.farmName_dropDown.add(farmName);
            }
          }
          print(state.farmName_dropDown.length);
        } else {
          print('error status != 200');
        }
      } on DioException catch (e) {
        print(e.response!.data);
      }
    });
  }
}
