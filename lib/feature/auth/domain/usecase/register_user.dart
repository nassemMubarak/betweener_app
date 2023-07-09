
import 'package:betweener_app/feature/auth/domain/repositorises/auth_repositorys.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/user.dart';

class RegisterUserUseCase{
  final AuthRepository repository;

  RegisterUserUseCase({required this.repository});
  Future<Either<Failure,User>> call({required Map authData})async{
    return await repository.registerUser(authData: authData);
  }
}