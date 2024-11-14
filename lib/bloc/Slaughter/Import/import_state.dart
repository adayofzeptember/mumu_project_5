part of 'import_bloc.dart';

// ignore: must_be_immutable
class ImportState extends Equatable {
  int deadPigs;
  int abnormalPigsListCount;
  List? abnormalPigsList;
  List weight_history_list;
  String lsq_lot_num;
  String balance_num;
  bool isLoading;
  dynamic last_weight;
  ImportState(
      {required this.deadPigs,
      required this.lsq_lot_num,
      required this.isLoading,
      required this.last_weight,
      required this.balance_num,
      required this.weight_history_list,
      required this.abnormalPigsListCount,
      this.abnormalPigsList});

  ImportState copyWith(
      {int? deadPigs,
      String? lsq_lot_num,
      String? balance_num,
      dynamic last_weight,
      bool? isLoading,
      abnormalPigsListCount,
      List? abnormalPigsList,
      List? weight_history_list}) {
    return ImportState(
        last_weight: last_weight ?? this.last_weight,
        isLoading: isLoading ?? this.isLoading,
        balance_num: balance_num ?? this.balance_num,
        lsq_lot_num: lsq_lot_num ?? this.lsq_lot_num,
        weight_history_list: weight_history_list ?? this.weight_history_list,
        deadPigs: deadPigs ?? this.deadPigs,
        abnormalPigsList: abnormalPigsList ?? this.abnormalPigsList,
        abnormalPigsListCount:
            abnormalPigsListCount ?? this.abnormalPigsListCount);
  }

  @override
  List<Object> get props => [
        deadPigs,
        abnormalPigsListCount,

        last_weight,
        abnormalPigsList!,
        isLoading,
        weight_history_list,
        balance_num,
        lsq_lot_num
      ];
}
