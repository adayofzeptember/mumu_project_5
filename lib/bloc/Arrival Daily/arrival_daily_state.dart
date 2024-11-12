part of 'arrival_daily_bloc.dart';

// ignore: must_be_immutable
class ArrivalDailyState extends Equatable {
  List lineLot_dropDown;
  List farmName_dropDown;
  List coopName_dropDown;
  ArrivalDailyState(
      {required this.farmName_dropDown,
      required this.lineLot_dropDown,
      required this.coopName_dropDown});

  ArrivalDailyState copyWith(
      {bool? isLoading,
      List? lineHistory,
      String? lotNumHistory,
      List? farmName_dropDown,
      List? coopName_dropDown,
      List? lineLot_dropDown}) {
    return ArrivalDailyState(
      coopName_dropDown: coopName_dropDown ?? this.coopName_dropDown,
      lineLot_dropDown: lineLot_dropDown ?? this.lineLot_dropDown,
      farmName_dropDown: farmName_dropDown ?? this.farmName_dropDown,
    );
  }

  @override
  List<Object> get props =>
      [farmName_dropDown, lineLot_dropDown, coopName_dropDown];
}
