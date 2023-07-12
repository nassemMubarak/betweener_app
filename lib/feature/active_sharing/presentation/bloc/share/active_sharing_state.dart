part of 'active_sharing_bloc.dart';

abstract class ActiveSharingState extends Equatable {
  const ActiveSharingState();
}

class ActiveSharingInitial extends ActiveSharingState {
  @override
  List<Object> get props => [];
}

class LoadingActiveSharingState extends ActiveSharingState {
  @override
  List<Object> get props => [];
}

class SuccessActiveSharingState extends ActiveSharingState {
  final List<User> users;

  const SuccessActiveSharingState({required this.users});

  @override
  List<Object> get props => [users];
}

class ErrorActiveSharingState extends ActiveSharingState {
  final String message;

  const ErrorActiveSharingState({required this.message});

  @override
  List<Object> get props => [message];
}
