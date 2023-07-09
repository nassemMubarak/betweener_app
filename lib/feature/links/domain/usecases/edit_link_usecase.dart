import 'package:betweener_app/feature/links/domain/entities/link.dart';
import 'package:betweener_app/feature/links/domain/repositories/repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';

class EditLinkUseCase {
  final Repository repository;

  EditLinkUseCase({required this.repository});
  Future<Either<Failure, Unit>> call({required Link link}) async {
    return await repository.editLink(link: link);
  }
}
