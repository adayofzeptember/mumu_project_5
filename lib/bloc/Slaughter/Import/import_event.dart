// ignore_for_file: must_be_immutable

part of 'import_bloc.dart';

class ImportEvent extends Equatable {
  const ImportEvent();

  @override
  List<Object> get props => [];
}

class Fetch_Weight_History extends ImportEvent {}

class CheckBeforeKillI2_2 extends ImportEvent {
  String get_master_id, getWeight, getPig_abnormal, getWeight_type;

  CheckBeforeKillI2_2(
      {required this.get_master_id,
      required this.getWeight,
      required this.getWeight_type,
      required this.getPig_abnormal});
}

class Weight_SendUI2_3 extends ImportEvent {
  String balance_id, getWeight, getPig_type, getWeight_type;
  List<File>? picsFiles;
  var context;

  Weight_SendUI2_3(
      {required this.balance_id,
      required this.getWeight,
      this.picsFiles,
      required this.context,
      required this.getWeight_type,
      required this.getPig_type});
}

class Upload_Pics extends ImportEvent {
  List<File> picsFiles;

  Upload_Pics({
    required this.picsFiles,
  });
}

class Weight_HistoryUI2_4 extends ImportEvent {}

class DeadPigs_Plus extends ImportEvent {}

class DeadPigs_Minus extends ImportEvent {}

class AbnormalPigs_Add extends ImportEvent {}

class Fetch_LastedWeight extends ImportEvent {
  Fetch_LastedWeight();
}
