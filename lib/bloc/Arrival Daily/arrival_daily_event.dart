part of 'arrival_daily_bloc.dart';

sealed class ArrivalDailyEvent extends Equatable {
  const ArrivalDailyEvent();

  @override
  List<Object> get props => [];
}

class Fetch_DailyArrival extends ArrivalDailyEvent {
  Fetch_DailyArrival();
}
