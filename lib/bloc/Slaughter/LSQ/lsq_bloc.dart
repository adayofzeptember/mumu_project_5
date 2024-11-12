import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'lsq_event.dart';
part 'lsq_state.dart';

class LsqBloc extends Bloc<LsqEvent, LsqState> {
  LsqBloc() : super(LsqState()) {
    on<LsqEvent>((event, emit) {
      
    });
  }
}
