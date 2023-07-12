part of 'link_update_bloc.dart';

@immutable
abstract class LinkUpdateState {}

class LinkUpdateInitial extends LinkUpdateState {}

class LinkUpdateLoadingState extends LinkUpdateState {
  @override
  List<Object?> get props => [];
}

class LinkUpdateErrorState extends LinkUpdateState {
  final String message;

  LinkUpdateErrorState({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}

class LinkUpdateSuccessState extends LinkUpdateState {
  final String message;

  LinkUpdateSuccessState({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
