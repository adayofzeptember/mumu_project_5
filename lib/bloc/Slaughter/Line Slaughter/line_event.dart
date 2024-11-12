// ignore_for_file: must_be_immutable

part of 'line_bloc.dart';

sealed class LineEvent extends Equatable {
  const LineEvent();

  @override
  List<Object> get props => [];
}

class SaveLine_UI291 extends LineEvent {
  int get_pig_arrival_id, get_insensible_value, get_stab_value;

  double get_temperature_value;

  bool get_insensible, get_stab, get_temperature;
  String get_remark;

  SaveLine_UI291({
    required this.get_pig_arrival_id,
    required this.get_insensible,
    required this.get_insensible_value,
    required this.get_stab,
    required this.get_stab_value,
    required this.get_temperature,
    required this.get_temperature_value,
    required this.get_remark,
  });
}

class FetchHistory_UI292 extends LineEvent {
  FetchHistory_UI292();
}
