import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mumu_project/ETC/api.dart';
import 'package:mumu_project/ETC/colors_palette.dart';
import 'package:mumu_project/bloc/Login_Greetings/greeting_board_model.dart';
import 'package:mumu_project/screens/Slaughter%20Department/main_slaughter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final dio = Dio();
  LoginBloc() : super(LoginState(loading: false, greetingBoard_info: '')) {
    on<Login_Casual>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.getString('userToken');
      emit(state.copyWith(loading: true));

      try {
        final response = await dio.post(api_url + "login",
            options: Options(
              headers: {
                'Accept': 'application/json',
              },
            ),
            data: json.encode({
              "username": event.getUsername,
              "password": event.getPassword,
            }));

        print(response.statusCode);
        prefs.setString(
            'userToken', response.data['data']['accessToken'].toString());
        if (response.statusCode == 200) {
          Navigator.pushReplacement(
            event.context,
            PageTransition(
                duration: Duration(milliseconds: 500),
                type: PageTransitionType.rightToLeft,
                child: Main_Slaughter()),
          );
        }
      } on DioException catch (e) {
        print(e);
        emit(state.copyWith(loading: false));

        Fluttertoast.showToast(
            msg: "ชื่อผู้่ใช้หรือรหัสผ่านไม่ถูกต้อง",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.SNACKBAR,
            timeInSecForIosWeb: 2,
            backgroundColor: Color.fromARGB(255, 224, 224, 224),
            textColor: Palette.mainRed,
            fontSize: 30);
      }
    });

    on<Load_GreetingBoard>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.getString('userToken');

      try {
        final response_board = await dio.get(
          api_url + "greeting",
          options: Options(headers: {
            "Authorization": "Bearer ${prefs.getString('userToken')}",
          }),
        );

        if (response_board.statusCode == 200) {
          dynamic nestedData = response_board.data['data'];
          dynamic fetchedDataInfo =
              (state.greetingBoard_info != '') ? state.greetingBoard_info : '';

          fetchedDataInfo = Greetings_Board(
              date: nestedData['date'], notice: nestedData['notice']);

          emit(state.copyWith(
              loading: false, greetingBoard_info: fetchedDataInfo));
          print(
              'greetings board fetced' + response_board.statusCode.toString());
        } else {
          emit(state.copyWith(loading: false));
        }
      } on DioException catch (e) {
        print(e);
        emit(state.copyWith(loading: false));
      }
    });
  }
}
