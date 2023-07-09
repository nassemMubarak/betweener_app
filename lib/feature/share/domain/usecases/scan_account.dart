

import 'package:betweener_app/feature/share/domain/repositorises/share_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../auth/domain/entities/user.dart';

class ScanAccountUseCase{
  final ShareRepository repository;

  ScanAccountUseCase({required this.repository});

  Future<Either<Failure,User>> call({required Map scanData})async{
    return await repository.scanAccount(scanData: scanData);
  }
}