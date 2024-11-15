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

class Import_Check extends ImportEvent {
  String? arrival_date;
  String? car_plate;
  int? farm_id;
  String? fold_name;
  bool? is_omega;
  String? arrival_time;
  String? start_time;
  String? end_time;
  int? duration;
  int? total_pigs;
  double? total_weight;
  double? avg_weight;
  int? male_pig;
  int? female_pig;
  String? rest_time;
  String? end_rest_time;
  int? rest_duration;
  String? killing_start;
  String? killing_stop;
  int? killing_duration;
  int? rest_dead;
  List? docs;
  int? arrival_marks;
  int? pigpen_marks;
  List<File>? picsFiles;
  List? abnormals;
  var context;

  Import_Check({
    this.arrival_date,
    this.car_plate,
    this.farm_id,
    this.fold_name,
    this.is_omega,
    this.arrival_time,
    this.start_time,
    this.end_time,
    this.duration,
    this.total_pigs,
    this.abnormals,
    this.total_weight,
    this.avg_weight,
    this.male_pig,
    this.female_pig,
    this.rest_time,
    this.end_rest_time,
    this.rest_duration,
    this.killing_start,
    this.killing_stop,
    this.killing_duration,
    this.rest_dead,
    this.docs,
    this.arrival_marks,
    this.pigpen_marks,
    this.picsFiles,
    this.context,
  });
}

class Weight_SendUI2_3 extends ImportEvent {
  String getWeight, getPig_type, getWeight_type;
  List<File>? picsFiles;
  var context;
  String? getEstimateType;
  String balance_id;

  Weight_SendUI2_3(
      {required this.balance_id,
      required this.getWeight,
      this.picsFiles,
      this.getEstimateType,
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

class Fetched_Lot_UI2_3 extends ImportEvent {}

class DeadPigs_Plus extends ImportEvent {}

class DeadPigs_Minus extends ImportEvent {}

class AbnormalPigs_Add extends ImportEvent {}

class Fetch_LastedWeight extends ImportEvent {}
