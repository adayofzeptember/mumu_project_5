// ignore_for_file: must_be_immutable

part of 'line_bloc.dart';

class LineState extends Equatable {
  bool isLoading;
  List lineHistory;
  List lineLot_dropDown;
  List farmName_dropDown;
  String lotNumHistory;

  LineState(
      {required this.isLoading,
      required this.lineLot_dropDown,
      required this.lineHistory,
      required this.farmName_dropDown,
      required this.lotNumHistory});

  LineState copyWith(
      {bool? isLoading,
      List? lineHistory,
      String? lotNumHistory,
      List? farmName_dropDown,
      List? lineLot_dropDown}) {
    return LineState(
      lineLot_dropDown: lineLot_dropDown ?? this.lineLot_dropDown,
      lotNumHistory: lotNumHistory ?? this.lotNumHistory,
      lineHistory: lineHistory ?? this.lineHistory,
      isLoading: isLoading ?? this.isLoading,
      farmName_dropDown: farmName_dropDown ?? this.farmName_dropDown,
    );
  }

  @override
  List<Object> get props =>
      [isLoading, lineHistory, lotNumHistory, lineLot_dropDown, farmName_dropDown,];
}
