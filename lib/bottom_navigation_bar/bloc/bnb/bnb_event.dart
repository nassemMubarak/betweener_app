part of 'bnb_bloc.dart';

abstract class BnbEvent extends Equatable {
  const BnbEvent();
}

class ChangeBnbEvent extends BnbEvent {
  final int index;
  @override
  List<Object?> get props => [index];

  const ChangeBnbEvent(this.index);
}
