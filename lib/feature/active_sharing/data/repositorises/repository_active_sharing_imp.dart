import 'package:betweener_app/core/error/exception.dart';
import 'package:betweener_app/core/error/failure.dart';
import 'package:betweener_app/core/network/network_info.dart';
import 'package:betweener_app/feature/active_sharing/data/datasources/sharing_active_remote_datasource.dart';
import 'package:betweener_app/feature/active_sharing/domain/repositorises/repository.dart';
import 'package:betweener_app/feature/auth/domain/entities/user.dart';
import 'package:dartz/dartz.dart';

class RepositoryActiveSharingImp implements RepositoryActiveSharing {
  ActiveSharingRemoteDataSource remoteDataSource;
  NetworkInfo networkInfo;

  RepositoryActiveSharingImp({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Unit>> deleteActive() async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.deleteActive();
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, List<User>>> getNearUser() async {
    if (await networkInfo.isConnected) {
      try {
        List<User> users = await remoteDataSource.getNearUser();
        return Right(users);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> setActive() async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.setActive();
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
