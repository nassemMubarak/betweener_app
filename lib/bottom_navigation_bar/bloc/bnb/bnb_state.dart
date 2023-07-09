part of 'bnb_bloc.dart';

abstract class BnbState extends Equatable {
  const BnbState();
}

class BnbInitial extends BnbState {
  final int pageIndex;
  @override
  List<Object> get props => [];

  const BnbInitial(this.pageIndex);
}

class BnbChangingState extends BnbState {
  @override
  List<Object> get props => [];
}
