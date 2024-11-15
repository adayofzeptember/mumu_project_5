part of 'master_data_bloc.dart';

class MasterDataState extends Equatable {
  List farmname_dropdown;
  List<Abnormal_Data> abNormals_dropdown;
  List<String> docs_dropdown;
  MasterDataState(
      {required this.farmname_dropdown,
      required this.abNormals_dropdown,
      required this.docs_dropdown});

  MasterDataState copyWith(
      {List? farmname_dropdown, List<Abnormal_Data>? abNormals_dropdown, List<String>? docs_dropdown}) {
    return MasterDataState(
        farmname_dropdown: farmname_dropdown ?? this.farmname_dropdown,
        abNormals_dropdown: abNormals_dropdown ?? this.abNormals_dropdown,
        docs_dropdown: docs_dropdown ?? this.docs_dropdown);
  }

  @override
  List<Object> get props => [farmname_dropdown, docs_dropdown, abNormals_dropdown];
}
