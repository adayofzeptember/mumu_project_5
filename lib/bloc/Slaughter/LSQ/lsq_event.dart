// ignore_for_file: camel_case_types, must_be_immutable

part of 'lsq_bloc.dart';

class LsqEvent extends Equatable {
  const LsqEvent();

  @override
  List<Object> get props => [];
}

class SaveLSQ_UI281 extends LsqEvent {
  int get_pig_arrival_id, get_balanceId;

  double get_weight, getBF3, getBF4, getB;

  bool get_tailPart;

  List get_Result;

  SaveLSQ_UI281({
    required this.get_pig_arrival_id,
    required this.getB,
    required this.getBF3,
    required this.get_Result,
    required this.getBF4,
    required this.get_balanceId,
    required this.get_tailPart,
    required this.get_weight,
  });
}
