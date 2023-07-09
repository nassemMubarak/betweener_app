part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}
class AuthLoadedUserState extends AuthState{
  final User user;

  AuthLoadedUserState({required this.user});
  @override
  List<Object> get props => [user];
}
class AuthLoadingState extends AuthState{}

class AuthMessageSuccessState extends AuthState{
  final String message;

  AuthMessageSuccessState({required this.message});

  @override
  List<Object> get props => [message];
}
class AuthMessageErrorState extends AuthState{
  final String message;

  AuthMessageErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
