import 'package:betweener_app/core/error/failure.dart';
import 'package:betweener_app/feature/links/domain/repositories/repository.dart';
import 'package:dartz/dartz.dart';

class RemoveLink {
  final Repository repository;

  RemoveLink({required this.repository});

  Future<Either<Failure, Unit>> call() async {
    return await repository.editLink();
  }
}
