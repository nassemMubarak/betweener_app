import 'dart:async';

import 'package:betweener_app/core/string/messages.dart';
import 'package:betweener_app/feature/auth/domain/entities/user.dart';
import 'package:betweener_app/feature/auth/domain/usecase/get_current_user.dart';
import 'package:betweener_app/feature/auth/domain/usecase/login_user.dart';
import 'package:betweener_app/feature/auth/domain/usecase/login_with_google.dart';
import 'package:betweener_app/feature/auth/domain/usecase/logout.dart';
import 'package:betweener_app/feature/auth/domain/usecase/register_user.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/string/failure.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUserUseCase loginUserUseCase;
  final RegisterUserUseCase registerUserUseCase;
  final GetCurrentUserUseCase getCurrentUserUseCase;
  final LoginWithGoogleUserUseCase loginWithGoogleUserUseCase;
  final LogoutUseCase logoutUseCase;

  AuthBloc(
      {
   required this.loginUserUseCase,
   required this.registerUserUseCase,
   required this.getCurrentUserUseCase,
   required this.loginWithGoogleUserUseCase,
   required this.logoutUseCase,
  }) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async{
      if(event is LoginUserEvent){
        emit(AuthLoadingState());
        final failureOrUser = await loginUserUseCase(authData: event.authData);
        emit(_eitherFailureOrUser(failureOrUser));
      }else if(event is RegisterUserEvent){
        emit(AuthLoadingState());
        final failureOrUser = await registerUserUseCase(authData: event.authData);
        emit(_eitherFailureOrUser(failureOrUser));
      }else if(event is LoginWithGoogleUserEvent){
        emit(AuthLoadingState());
        final failureOrUser = await loginWithGoogleUserUseCase(authData: event.authData);
        emit(_eitherFailureOrUser(failureOrUser));
      }else if(event is GetCurrentUserEvent){
        emit(AuthLoadingState());
        final failureOrUser = await getCurrentUserUseCase();
        emit(failureOrUser.fold((_) => AuthInitial(), (user) => AuthLoadedUserState(user: user)));
      }else if(event is LogoutEvent){
        emit(AuthLoadingState());
        final failureOrUser = await logoutUseCase();
        failureOrUser.fold(
              (failure) =>
              AuthMessageErrorState(message: _mapFailureMessage(failure: failure)),
              (success) => AuthMessageSuccessState(message: LOGOUT_MESSAGE),
        );
      }
    });
  }
 AuthState _eitherFailureOrUser(Either<Failure,User> either){
    return either.fold(
          (failure) =>
          AuthMessageErrorState(message: _mapFailureMessage(failure: failure)),
          (user) => AuthLoadedUserState(user: user),
    );
  }
  String _mapFailureMessage({required Failure failure}) {
    switch (failure.runtimeType) {
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;
      case EmptyCacheFailure:
        return CACHE_FAILURE_MESSAGE;
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case InvalidDataFailure:
        return INVALID_DATA_FAILURE_MESSAGE;
      default:
        return 'Unexpected Error, Please try again later .';
    }
  }
}
