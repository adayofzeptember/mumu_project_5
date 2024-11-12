import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:mumu_project/ETC/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'import_event.dart';
part 'import_state.dart';

class ImportBloc extends Bloc<ImportEvent, ImportState> {
  final dio = Dio();
  ImportBloc()
      : super(ImportState(
            deadPigs: 0, abnormalPigsListCount: 0, abnormalPigsList: [])) {
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
    //?
    on<Weight_SendUI2_3>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String tokenAuth = prefs.getString('userToken').toString();

      final formData;
      formData = FormData.fromMap({
        "balance_id": event.get_master_id,
        "weight": event.getWeight,
        "pig_abnormal": event.getPig_abnormal,
        "weight_type": event.getWeight_type
      });

      try {
        final response = await dio.post(api_url + "add-pig-arrival-list",
            options: Options(
              headers: {
                "Authorization": "Bearer $tokenAuth",
              },
            ),
            data: formData);

        print('__________________________');
        print(response.statusCode);
        print(response.data);

        // if (response.statusCode == 200) {
        // } else {}
      } catch (e) {
        if (e is DioException) {
          print(e);
        } else {
          print('Unexpected error: $e');
        }
      }
    });

    on<Weight_HistoryUI2_4>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String tokenAuth = prefs.getString('userToken').toString();

      try {
        final response = await dio.post(
          api_url + "pig-arrival-lists",
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
