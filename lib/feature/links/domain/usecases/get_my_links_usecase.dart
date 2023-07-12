import 'package:betweener_app/feature/links/domain/entities/link.dart';
import 'package:betweener_app/feature/links/domain/repositories/repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';

class GetMyLinksUseCase {
  final Repository repository;

  GetMyLinksUseCase({required this.repository});

  Future<Either<Failure, List<Link>>> call() async {
    return await repository.getMyLinks();
  }
}
