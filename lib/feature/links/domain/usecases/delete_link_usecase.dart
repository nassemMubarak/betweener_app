import 'package:betweener_app/core/error/failure.dart';
import 'package:betweener_app/feature/links/domain/repositories/repository.dart';
import 'package:dartz/dartz.dart';

class RemoveLinkUseCase {
  final Repository repository;

  RemoveLinkUseCase({required this.repository});

  Future<Either<Failure, Unit>> call({required String linkId}) async {
    return await repository.removeLink(linkId: linkId);
  }
}
