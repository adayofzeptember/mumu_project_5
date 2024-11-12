part of 'import_bloc.dart';

// ignore: must_be_immutable
class ImportState extends Equatable {
  int deadPigs;
  int abnormalPigsListCount;
  List? abnormalPigsList;
  ImportState(
      {required this.deadPigs,
      required this.abnormalPigsListCount,
      this.abnormalPigsList});

  ImportState copyWith(
      {int? deadPigs, abnormalPigsListCount, List? abnormalPigsList}) {
    return ImportState(
        deadPigs: deadPigs ?? this.deadPigs,
        abnormalPigsList: abnormalPigsList ?? this.abnormalPigsList,
        abnormalPigsListCount:
            abnormalPigsListCount ?? this.abnormalPigsListCount);
  }

  @override
  List<Object> get props =>
      [deadPigs, abnormalPigsListCount, abnormalPigsList!];
}
