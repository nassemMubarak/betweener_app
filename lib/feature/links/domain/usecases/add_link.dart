import 'package:betweener_app/feature/links/domain/repositories/repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';

class AddLink {
  final Repository repository;

  AddLink({required this.repository});

  Future<Either<Failure, Unit>> call() async {
    return repository.addLink();
  }
}
