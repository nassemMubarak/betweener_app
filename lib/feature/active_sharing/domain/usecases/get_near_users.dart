import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../auth/domain/entities/user.dart';
import '../repositorises/repository.dart';

class GetNearUsersUseCase {
  final RepositoryActiveSharing repositoryActiveSharing;

  GetNearUsersUseCase({required this.repositoryActiveSharing});

  Future<Either<Failure, List<User>>> call() async {
    return await repositoryActiveSharing.getNearUser();
  }
}
