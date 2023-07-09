import 'package:betweener_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';

import '../entities/link.dart';

abstract class Repository {
  Future<Either<Failure, List<Link>>> getMyLinks();
  Future<Either<Failure, Unit>> editLink();
  Future<Either<Failure, Unit>> removeLink();
  Future<Either<Failure, Unit>> addLink();
}
