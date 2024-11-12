// ignore_for_file: must_be_immutable

part of 'login_bloc.dart';

class LoginState extends Equatable {
  bool loading;
  dynamic greetingBoard_info;
  LoginState({required this.loading, required this.greetingBoard_info});

  LoginState copyWith({bool? loading, dynamic greetingBoard_info}) {
    return LoginState(
      greetingBoard_info: greetingBoard_info ?? this.greetingBoard_info,
      loading: loading ?? this.loading,
    );
  }

  @override
  List<Object> get props => [loading, greetingBoard_info];
}
