
import 'package:betweener_app/feature/auth/domain/repositorises/auth_repositorys.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';

class LogoutUseCase{
  final AuthRepository repository;

  LogoutUseCase({required this.repository});

  Future<Either<Failure,Unit>> call()async{
    return await repository.logout();
  }
}