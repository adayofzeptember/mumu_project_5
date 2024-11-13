// ignore_for_file: must_be_immutable

part of 'lsq_bloc.dart';

class LsqState extends Equatable {
  dynamic last_body;
  bool isLoading;
  List carcass_history;
  List lsq_history;
  String lsq_lot_num;
  String balance_num;

  LsqState(
      {required this.isLoading,
      required this.last_body,
      required this.balance_num,
      required this.lsq_lot_num,
      required this.carcass_history,
      required this.lsq_history});

  LsqState copyWith(
      {bool? isLoading,
      List? carcass_history,
      List? lsq_history,
      dynamic last_body,
      String? lsq_lot_num,
      String? balance_num}) {
    return LsqState(
      last_body: last_body ?? this.last_body,
      lsq_lot_num: lsq_lot_num ?? this.lsq_lot_num,
      balance_num: balance_num ?? this.balance_num,
      lsq_history: lsq_history ?? this.lsq_history,
      carcass_history: carcass_history ?? this.carcass_history,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object> get props => [
        isLoading,
        lsq_history,
        carcass_history,
        balance_num,
        lsq_lot_num,
        last_body
      ];
}
