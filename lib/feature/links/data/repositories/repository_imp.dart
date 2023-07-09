import 'package:betweener_app/core/error/exception.dart';
import 'package:betweener_app/core/error/failure.dart';
import 'package:betweener_app/feature/links/data/datasources/local_datasource.dart';
import 'package:betweener_app/feature/links/data/datasources/remote_datasource.dart';
import 'package:betweener_app/feature/links/data/models/link_model.dart';
import 'package:betweener_app/feature/links/domain/entities/link.dart';
import 'package:betweener_app/feature/links/domain/repositories/repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/network/network_info.dart';

class RepositoryImp implements Repository {
  LocalDataSource localDataSource;
  RemoteDataSource remoteDataSource;
  NetworkInfo networkInfo;

  RepositoryImp({
    required this.localDataSource,
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Link>>> getMyLinks() async {
    if (await networkInfo.isConnected) {
      try {
        List<LinkModel> links = await remoteDataSource.getMyLinks();
        localDataSource.cacheMyLinks(links);
        return Right(links);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        List<Link> links = await localDataSource.getMyLinks();
        return Right(links);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> addLink({required Link link}) async {
    return await _addEditRemoveRepo(() async {
      final LinkModel linkModel = LinkModel(name: link.name, url: link.url, id: link.id);
      await remoteDataSource.addLink(linkModel: linkModel);
    });
  }

  @override
  Future<Either<Failure, Unit>> editLink({required Link link}) async {
    return await _addEditRemoveRepo(() async {
      final LinkModel linkModel = LinkModel(name: link.name, url: link.url, id: link.id);
      await remoteDataSource.editLink(linkModel: linkModel);
    });
  }

  @override
  Future<Either<Failure, Unit>> removeLink({required String linkId}) async {
    return await _addEditRemoveRepo(() async {
      await remoteDataSource.removeLink(linkId: linkId);
    });
  }

  Future<Either<Failure, Unit>> _addEditRemoveRepo(Future<void> Function() callBack) async {
    if (await networkInfo.isConnected) {
      try {
        await callBack();
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
    return Left(OfflineFailure());
  }
}
