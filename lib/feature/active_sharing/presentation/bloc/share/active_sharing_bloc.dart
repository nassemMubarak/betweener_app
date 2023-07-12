import 'package:betweener_app/core/error/failure.dart';
import 'package:betweener_app/core/string/failure.dart';
import 'package:betweener_app/feature/active_sharing/domain/usecases/delete_active_sharing.dart';
import 'package:betweener_app/feature/active_sharing/domain/usecases/get_near_users.dart';
import 'package:betweener_app/feature/active_sharing/domain/usecases/set_active_sharing.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../auth/domain/entities/user.dart';

part 'active_sharing_event.dart';
part 'active_sharing_state.dart';

class ActiveSharingBloc extends Bloc<ActiveSharingEvent, ActiveSharingState> {
  GetNearUsersUseCase getNearUsersUseCase;
  SetActiveSharingUseCase setActiveSharingUseCase;
  DeleteActiveSharingUseCase deleteActiveSharingUseCase;

  ActiveSharingBloc({
    required this.getNearUsersUseCase,
    required this.setActiveSharingUseCase,
    required this.deleteActiveSharingUseCase,
  }) : super(ActiveSharingInitial()) {
    on<ActiveSharingEvent>((event, emit) async {
      if (event is GetNearUsers) {
        await setActiveSharingUseCase();
        emit(LoadingActiveSharingState());
        final usersOrFailure = await getNearUsersUseCase();
        usersOrFailure.fold(
          (failure) => emit(ErrorActiveSharingState(message: _mapFailureMessage(failure: failure))),
          (users) => emit(SuccessActiveSharingState(users: users)),
        );
      } else if (event is DeleteActive) {
        await deleteActiveSharingUseCase();
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
        return 'Unexpected Error, Please try again later.';
    }
  }
}
