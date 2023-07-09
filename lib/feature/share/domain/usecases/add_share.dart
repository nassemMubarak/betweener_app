
import 'package:betweener_app/feature/share/domain/repositorises/share_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/share.dart';

class AddShareRepository{
  final ShareRepository repository;

  AddShareRepository({required this.repository});

  Future<Either<Failure,Unit>> call({required Share share})async{
    return await repository.addShare(share: share);
  }
}