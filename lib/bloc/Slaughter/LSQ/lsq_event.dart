// ignore_for_file: camel_case_types, must_be_immutable

part of 'lsq_bloc.dart';

class LsqEvent extends Equatable {
  const LsqEvent();

  @override
  List<Object> get props => [];
}

class SaveLSQ_UI281 extends LsqEvent {
  int get_pig_arrival_id, get_balanceId;

  String get_weight, getBF3, getBF4, getB, getRemark;

  bool get_tailPart;

  List get_Result;
  var context;

  SaveLSQ_UI281({
    required this.get_pig_arrival_id,
    required this.getB,
    required this.getBF3,
    required this.getRemark,
    required this.context,
    required this.get_Result,
    required this.getBF4,
    required this.get_balanceId,
    required this.get_tailPart,
    required this.get_weight,
  });
}

class Fetch_CarcassHistory extends LsqEvent {
  Fetch_CarcassHistory();
}

class Fetch_LSQHistory extends LsqEvent {
  Fetch_LSQHistory();
}

class Fetch_LastedBody extends LsqEvent {
  Fetch_LastedBody();
}
