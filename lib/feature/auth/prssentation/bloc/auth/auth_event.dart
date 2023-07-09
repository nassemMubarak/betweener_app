part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class LoginUserEvent extends AuthEvent {
  final Map authData;

  LoginUserEvent({required this.authData});

  @override
  List<Object?> get props => [authData];
}

class RegisterUserEvent extends AuthEvent {
  final Map authData;

  RegisterUserEvent({required this.authData});

  @override
  List<Object?> get props => [authData];
}

class GetCurrentUserEvent extends AuthEvent {}

class LoginWithGoogleUserEvent extends AuthEvent {
  final Map authData;

  LoginWithGoogleUserEvent({required this.authData});

  @override
  List<Object?> get props => [authData];
}

class LogoutEvent extends AuthEvent {}
