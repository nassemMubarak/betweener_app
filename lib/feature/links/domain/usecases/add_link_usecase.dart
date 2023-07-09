import 'package:betweener_app/core/error/failure.dart';
import 'package:betweener_app/feature/links/domain/entities/link.dart';
import 'package:betweener_app/feature/links/domain/repositories/repository.dart';
import 'package:dartz/dartz.dart';

class AddLinkUseCase {
  final Repository repository;

  AddLinkUseCase({required this.repository});

  Future<Either<Failure, Unit>> call({required Link link}) async {
    return repository.addLink(link: link);
  }
}
