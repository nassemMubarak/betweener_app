import 'package:betweener_app/core/error/failure.dart';
import 'package:betweener_app/core/network/network_info.dart';
import 'package:betweener_app/feature/auth/data/models/user_model.dart';
import 'package:betweener_app/feature/auth/domain/entities/user.dart';
import 'package:betweener_app/feature/share/data/datasourses/share_local_data_source.dart';
import 'package:betweener_app/feature/share/data/datasourses/share_remote_data_soursce.dart';
import 'package:betweener_app/feature/share/data/models/share_model.dart';
import 'package:betweener_app/feature/share/domain/entities/share.dart';
import 'package:betweener_app/feature/share/domain/repositorises/share_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/exception.dart';

class ShareRepositoryImpl implements ShareRepository {
  final NetworkInfo networkInfo;
  final ShareLocalDataSource localDataSource;
  final ShareRemoteDataSource remoteDataSource;

  ShareRepositoryImpl({
    required this.networkInfo,
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, Unit>> addShare({required Share share}) async {
    if (await networkInfo.isConnected) {
      try {
        ShareModel shareModel = ShareModel(id: share.id, name: share.name, link: share.link);
        await remoteDataSource.addShare(shareModel: shareModel);
        await localDataSource.cacheShare(shareModel: [shareModel]);
        return const Right(unit);
      } on InvalidDataException {
        return Left(InvalidDataFailure());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, List<Share>>> getAlShare() async{
    if (await networkInfo.isConnected) {
      try {
       final listShare = await remoteDataSource.getAllShare();
       await localDataSource.cacheShare(shareModel: listShare);
        return Right(listShare);
      } on InvalidDataException {
        return Left(InvalidDataFailure());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, User>> scanAccount({required Map scanData}) async{
    if (await networkInfo.isConnected) {
      try {
        final userModel = await remoteDataSource.scanAccount(scanData: scanData);
        return Right(userModel);
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
