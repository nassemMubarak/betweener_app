
import 'package:betweener_app/core/error/failure.dart';
import 'package:betweener_app/core/network/network_info.dart';
import 'package:betweener_app/feature/auth/domain/entities/user.dart';
import 'package:betweener_app/feature/share/data/datasourses/share_local_data_source.dart';
import 'package:betweener_app/feature/share/data/datasourses/share_remote_data_soursce.dart';
import 'package:betweener_app/feature/share/domain/entities/share.dart';
import 'package:betweener_app/feature/share/domain/repositorises/share_repository.dart';
import 'package:dartz/dartz.dart';

class ShareRepositoryImpl implements ShareRepository{
  final NetworkInfo networkInfo;
  final ShareLocalDataSource localDataSource;
  final ShareRemoteDataSource remoteDataSource;

  ShareRepositoryImpl(
      {
   required this.networkInfo,
   required this.localDataSource,
   required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, Unit>> addShare({required Share share}) {
    // TODO: implement addShare
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Share>>> getAlShare() {
    // TODO: implement getAlShare
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, User>> scanAccount({required Map scanData}) {
    // TODO: implement scanAccount
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> removeShare({required Share share}) {
    // TODO: implement removeShare
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> updateShare({required Share share}) {
    // TODO: implement updateShare
    throw UnimplementedError();
  }

}