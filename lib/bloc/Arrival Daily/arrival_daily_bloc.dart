import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:mumu_project/ETC/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'arrival_daily_event.dart';
part 'arrival_daily_state.dart';

class ArrivalDailyBloc extends Bloc<ArrivalDailyEvent, ArrivalDailyState> {
  final dio = Dio();
  ArrivalDailyBloc()
      : super(ArrivalDailyState(
            lineLot_dropDown: [],
            farmName_dropDown: [],
            coopName_dropDown: [])) {
    on<Fetch_DailyArrival>((event, emit) async {
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

        Set<String> uniqueFarmNames = {};

        if (response.statusCode == 200) {
          for (var elements in response.data['data']) {
            state.lineLot_dropDown.add(elements['lot_num']);
          }

          for (var elements in response.data['data']) {
            state.coopName_dropDown.add(elements['fold_name']);
          }

          for (var element in response.data['data']) {
            String farmName = element['farm']['farm_name'];

            if (!uniqueFarmNames.contains(farmName)) {
              uniqueFarmNames.add(farmName);

              state.farmName_dropDown.add(farmName);
            }
          }
        } else {
          print('error status != 200');
        }
      } on DioException catch (e) {
        print(e.response!.data);
      }
    });
  }
}
