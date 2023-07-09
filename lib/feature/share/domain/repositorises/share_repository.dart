
import 'package:betweener_app/core/error/failure.dart';
import 'package:betweener_app/feature/share/domain/entities/share.dart';
import 'package:dartz/dartz.dart';

abstract class ShareRepository{
  Future<Either<Failure,Share>> scanAccount({required Map scanData});
  Future<Either<Failure,List<Share>>> getAlShare();
  Future<Either<Failure,List<Share>>> addShare({required Share share});

}