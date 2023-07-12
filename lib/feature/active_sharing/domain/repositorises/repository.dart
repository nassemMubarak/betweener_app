import 'package:betweener_app/core/error/failure.dart';
import 'package:betweener_app/feature/auth/domain/entities/user.dart';
import 'package:dartz/dartz.dart';

abstract class RepositoryActiveSharing {
  Future<Either<Failure, List<User>>> getNearUser();
  Future<Either<Failure, Unit>> deleteActive();
  Future<Either<Failure, Unit>> setActive();
}
