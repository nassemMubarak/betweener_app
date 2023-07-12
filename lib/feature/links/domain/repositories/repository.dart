import 'package:betweener_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';

import '../entities/link.dart';

abstract class Repository {
  Future<Either<Failure, List<Link>>> getMyLinks(String token);
  Future<Either<Failure, Unit>> editLink({required Link link});
  Future<Either<Failure, Unit>> removeLink({required String linkId});
  Future<Either<Failure, Unit>> addLink({required Link link});
}
