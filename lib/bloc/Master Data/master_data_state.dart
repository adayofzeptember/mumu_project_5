// ignore_for_file: must_be_immutable

part of 'master_data_bloc.dart';

//! เเพิ่ม type
class MasterDataState extends Equatable {
  List farmname_dropdown;
  List estimateType_dropdown;
  List<Abnormal_Data> abNormals_dropdown;
  List<String> docs_dropdown;
  List balance_id_device_dropdown;
  MasterDataState(
      {required this.farmname_dropdown,
      required this.abNormals_dropdown,
      required this.estimateType_dropdown,
      required this.balance_id_device_dropdown,
      required this.docs_dropdown});

  MasterDataState copyWith(
      {List? farmname_dropdown,
      List? estimateType_dropdown,
      List<String>? docs_dropdown,
      List<Abnormal_Data>? abNormals_dropdown,
      List? balance_id_device_dropdown}) {
    return MasterDataState(
        balance_id_device_dropdown:
            balance_id_device_dropdown ?? this.balance_id_device_dropdown,
        farmname_dropdown: farmname_dropdown ?? this.farmname_dropdown,
        estimateType_dropdown:
            estimateType_dropdown ?? this.estimateType_dropdown,
        abNormals_dropdown: abNormals_dropdown ?? this.abNormals_dropdown,
        docs_dropdown: docs_dropdown ?? this.docs_dropdown);
  }

  @override
  List<Object> get props => [
        farmname_dropdown,
        estimateType_dropdown,
        docs_dropdown,
        abNormals_dropdown,
        balance_id_device_dropdown
      ];
}
