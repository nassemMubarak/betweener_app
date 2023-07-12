part of 'link_bloc.dart';

abstract class LinkState extends Equatable {
  const LinkState();
}

class LinkInitial extends LinkState {
  @override
  List<Object> get props => [];
}

class LinkLoadingState extends LinkState {
  @override
  List<Object?> get props => [];
}

class LinkErrorState extends LinkState {
  final String message;

  const LinkErrorState({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}

class LinkSuccessState extends LinkState {
  final List<LinkModel>? links;

  const LinkSuccessState({required this.links});

  @override
  // TODO: implement props
  List<Object?> get props => [links];
}
