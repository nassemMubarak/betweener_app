import 'package:betweener_app/core/error/exception.dart';
import 'package:betweener_app/core/error/failure.dart';
import 'package:betweener_app/core/network/network_info.dart';
import 'package:betweener_app/feature/auth/data/models/user_model.dart';
import 'package:betweener_app/feature/auth/domain/entities/user.dart';
import 'package:betweener_app/feature/auth/domain/repositorises/auth_repositorys.dart';
import 'package:dartz/dartz.dart';

import '../datasources/auth_local_data_source.dart';
import '../datasources/auth_remote_data_source.dart';

typedef LoginOrRegister = Future<UserModel> Function();

class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDataSource localDataSource;
  final AuthRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, User>> getCurrentUser() async {
    try {
      final userModel = await localDataSource.getCurrentUser();
      return Right(userModel);
    } on EmptyCacheException {
      return Left(EmptyCacheFailure());
    }
  }

  @override
  Future<Either<Failure, User>> logInUser({required Map authData}) {
    return _getMessageLoginOrRegisterUser(() => remoteDataSource.loginUser(authData: authData));
  }

  @override
  Future<Either<Failure, User>> registerUser({required Map authData}) {
    return _getMessageLoginOrRegisterUser(() => remoteDataSource.registerUser(authData: authData));
  }

  @override
  Future<Either<Failure, User>> loginWithGoogleUser({required Map authData}) {
    return _getMessageLoginOrRegisterUser(() => remoteDataSource.registerUser(authData: authData));
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    await localDataSource.logout();
    return const Right(unit);
  }

  Future<Either<Failure, User>> _getMessageLoginOrRegisterUser(LoginOrRegister loginOrRegister) async {
    if (await networkInfo.isConnected) {
      try {
        final user = await loginOrRegister();
        await localDataSource.saveUser(userModel: user);
        return Right(user);
      } on InvalidDataException {
        return Left(InvalidDataFailure());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
