import 'package:betweener_app/feature/active_sharing/domain/repositorises/repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';

class DeleteActiveSharingUseCase {
  final RepositoryActiveSharing repositoryActiveSharing;

  DeleteActiveSharingUseCase({required this.repositoryActiveSharing});

  Future<Either<Failure, Unit>> call() {
    return repositoryActiveSharing.deleteActive();
  }
}
