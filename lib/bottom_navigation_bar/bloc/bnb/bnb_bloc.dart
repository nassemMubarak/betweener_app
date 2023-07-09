import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bnb_event.dart';
part 'bnb_state.dart';

class BnbBloc extends Bloc<BnbEvent, BnbState> {
  BnbBloc() : super(const BnbInitial(0)) {
    on<BnbEvent>((event, emit) {
      if (event is ChangeBnbEvent) {
        emit(BnbChangingState());
        emit(BnbInitial(event.index));
      }
    });
  }
}
