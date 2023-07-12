import 'package:betweener_app/feature/active_sharing/domain/repositorises/repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';

class SetActiveSharingUseCase {
  final RepositoryActiveSharing repositoryActiveSharing;

  SetActiveSharingUseCase({required this.repositoryActiveSharing});
  Future<Either<Failure, Unit>> call() {
    return repositoryActiveSharing.setActive();
  }
}
