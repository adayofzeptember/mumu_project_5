// ignore_for_file: must_be_immutable

part of 'login_bloc.dart';

class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class Login_Casual extends LoginEvent {
  var context;
  String getUsername, getPassword;
  Login_Casual(
      {required this.getUsername,
      required this.getPassword,
      required this.context});
}

class Load_GreetingBoard extends LoginEvent {
  var context;
  Load_GreetingBoard({required this.context});
}
