import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:mumu_project/ETC/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'line_event.dart';
part 'line_state.dart';

class LineBloc extends Bloc<LineEvent, LineState> {
  final dio = Dio();
  LineBloc() : super(LineState()) {
    on<SaveLine_UI291>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String tokenAuth = prefs.getString('userToken').toString();

      final formData;
      formData = FormData.fromMap({
        "pig_arrival_id": event.get_pig_arrival_id, // PigArrival -> lot_num
        "insensible": event.get_insensible, // การทำสลบ true สลบ , false ไม่สลบ
        "insensible_value": event.get_insensible_value, // จำนวนทำสลบ
        "stab": event.get_stab, // การแทงคอ true ดิ้น, false ไม่ดิ้น
        "stab_value": event.get_stab_value,
        "temperature": event.get_temperature,
        "temperature_value": event.get_temperature_value,
        "remark": null
      });

      try {
        final response = await dio.post(api_url + "add-slaughter-standard",
            options: Options(
              headers: {
                "Authorization": "Bearer $tokenAuth",
              },
            ),
            data: formData);

        print('__________________________');
        print(response.statusCode);
        print(response.data);
      } catch (e) {
        if (e is DioException) {
          print(e);
        } else {
          print('Unexpected error: $e');
        }
      }
    });

    on<FetchHistory_UI292>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String tokenAuth = prefs.getString('userToken').toString();

      try {
        final response = await dio.post(
          api_url + "slaughter-standard-lists",
          options: Options(
            headers: {
              "Authorization": "Bearer $tokenAuth",
            },
          ),
        );

        print('__________________________');
        print(response.statusCode);
        print(response.data);
      } catch (e) {
        if (e is DioException) {
          print(e);
        } else {
          print('Unexpected error: $e');
        }
      }
    });
  }
}
