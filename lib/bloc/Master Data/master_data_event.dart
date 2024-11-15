part of 'master_data_bloc.dart';

class MasterDataEvent extends Equatable {
  const MasterDataEvent();

  @override
  List<Object> get props => [];
}

class Fetch_Farmname extends MasterDataEvent {}

class Fetch_BalanceID extends MasterDataEvent {
  Fetch_BalanceID();
}

class Fetch_EstimateType extends MasterDataEvent {}

class Fetch_Docs extends MasterDataEvent {
  Fetch_Docs();
}

class Fetch_Abnormals extends MasterDataEvent {
  Fetch_Abnormals();
}
