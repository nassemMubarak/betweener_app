import 'package:betweener_app/core/error/failure.dart';
import 'package:betweener_app/core/string/failure.dart';
import 'package:betweener_app/feature/active_sharing/domain/usecases/get_near_users.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../auth/domain/entities/user.dart';

part 'active_sharing_event.dart';
part 'active_sharing_state.dart';

class ActiveSharingBloc extends Bloc<ActiveSharingEvent, ActiveSharingState> {
  GetNearUsersUseCase getNearUsersUseCase;

  ActiveSharingBloc({
    required this.getNearUsersUseCase,
  }) : super(ActiveSharingInitial()) {
    on<ActiveSharingEvent>((event, emit) async {
      if (event is GetNearUsers) {
        print('hi');
        emit(LoadingActiveSharingState());
        final usersOrFailure = await getNearUsersUseCase();
        usersOrFailure.fold(
          (failure) => emit(ErrorActiveSharingState(message: _mapFailureMessage(failure: failure))),
          (users) => emit(SuccessActiveSharingState(users: users)),
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
        return 'Unexpected Error, Please try again later.';
    }
  }
}
