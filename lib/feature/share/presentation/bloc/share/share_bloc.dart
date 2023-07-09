import 'dart:async';

import 'package:betweener_app/core/string/messages.dart';
import 'package:betweener_app/feature/share/domain/usecases/scan_account.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/string/failure.dart';
import '../../../../auth/domain/entities/user.dart';
import '../../../domain/entities/share.dart';
import '../../../domain/usecases/add_share.dart';
import '../../../domain/usecases/get_al_share.dart';

part 'share_event.dart';

part 'share_state.dart';

class ShareBloc extends Bloc<ShareEvent, ShareState> {
  final AddShareRepository addShareRepository;
  final GetAllSHareUseCase getAllSHareUseCase;
  final ScanAccountUseCase scanAccountUseCase;

  ShareBloc({
    required this.addShareRepository,
    required this.getAllSHareUseCase,
    required this.scanAccountUseCase,
  }) : super(ShareInitial()) {
    on<ShareEvent>((event, emit) async {
      if (event is AddShareEvent) {
        emit(ShareLoadingState());
        final failureOrUnit = await addShareRepository(share: event.share);
        emit(failureOrUnit.fold((failure) =>
            ShareMessageErrorState(
                message: _mapFailureMessage(failure: failure)), (_) =>
            ShareMessageSuccessState(message: ADD_SHARE_SUCCESSFUL))
        );
      } else if (event is GetAllShareEvent) {
        emit(ShareLoadingState());
        final failureOrUnit = await getAllSHareUseCase();
        emit(failureOrUnit.fold((failure) =>
            ShareMessageErrorState(
                message: _mapFailureMessage(failure: failure)), (shar) =>
            ShareLoadedSharedState(share: shar))
        );
      }
      else if (event is ScanAccountEvent) {
        emit(ShareLoadingState());
        final failureOrUnit = await scanAccountUseCase(
            scanData: event.scanData);
        emit(failureOrUnit.fold((failure) =>
            ShareMessageErrorState(
                message: _mapFailureMessage(failure: failure)), (user) =>
            ShareLoadedUserState(user: user))
        );
      }
    });
  }

  String _mapFailureMessage({required Failure failure}) {
    switch (failure.runtimeType) {
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;
      case EmptyCacheFailure:
        return CACHE_FAILURE_MESSAGE;
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case InvalidDataFailure:
        return INVALID_DATA_FAILURE_MESSAGE;
      default:
        return 'Unexpected Error, Please try again later .';
    }
  }
}
