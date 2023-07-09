
import 'package:betweener_app/feature/auth/domain/repositorises/auth_repositorys.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/user.dart';

class GetCurrentUserUseCase{
  final AuthRepository repository;

  GetCurrentUserUseCase({required this.repository});

  Future<Either<Failure,User>> call()async{
    return await repository.getCurrentUser();
  }
}