import 'package:betweener_app/feature/share/domain/repositorises/share_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/share.dart';

class GetAllSHareUseCase{
  final ShareRepository repository;

  GetAllSHareUseCase({required this.repository});

  Future<Either<Failure,List<Share>>> call()async{
    return await repository.getAlShare();
  }
}