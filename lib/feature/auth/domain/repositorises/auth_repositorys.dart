import 'package:betweener_app/feature/auth/domain/entities/user.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
abstract class AuthRepository{
  Future<Either<Failure,User>> logInUser({required Map authData});
  Future<Either<Failure,User>> registerUser({required Map authData});
  Future<Either<Failure,User>> getCurrentUser();
  Future<Either<Failure,User>> loginWithGoogleUser({required Map authData});
  Future<Either<Failure,Unit>> logout();

}