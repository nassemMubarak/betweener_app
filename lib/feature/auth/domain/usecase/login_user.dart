
import 'package:betweener_app/feature/auth/domain/repositorises/auth_repositorys.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/user.dart';

class LoginUserUseCase{
  final AuthRepository repository;

  LoginUserUseCase({required this.repository});

  Future<Either<Failure,User>> call({required Map authData})async{
    return await repository.logInUser(authData: authData);
  }
}