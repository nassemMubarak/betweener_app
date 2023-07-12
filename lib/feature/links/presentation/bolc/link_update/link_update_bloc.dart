import 'package:betweener_app/core/error/failure.dart';
import 'package:betweener_app/core/string/failure.dart';
import 'package:betweener_app/core/string/messages.dart';
import 'package:betweener_app/feature/links/domain/entities/link.dart';
import 'package:betweener_app/feature/links/domain/usecases/add_link_usecase.dart';
import 'package:betweener_app/feature/links/domain/usecases/delete_link_usecase.dart';
import 'package:betweener_app/feature/links/domain/usecases/edit_link_usecase.dart';
import 'package:betweener_app/feature/links/presentation/bolc/link/link_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'link_update_event.dart';
part 'link_update_state.dart';

class LinkUpdateBloc extends Bloc<LinkUpdateEvent, LinkUpdateState> {
  final AddLinkUseCase addLinkUseCase;
  final EditLinkUseCase editLinkUseCase;
  final RemoveLinkUseCase removeLinkUseCase;

  LinkUpdateBloc({
    required this.addLinkUseCase,
    required this.editLinkUseCase,
    required this.removeLinkUseCase,
  }) : super(LinkUpdateInitial()) {
    on<LinkUpdateEvent>((event, emit) async {
      if (event is EditLinkUpdateEvent) {
        BlocProvider.of<LinkBloc>(event.context).add(UpdateMyLinksEvent(link: event.link));
        emit(LinkUpdateLoadingState());
        emit(await _editAddRemove(() async => await editLinkUseCase(link: event.link)));
      } else if (event is RemoveLinkUpdateEvent) {
        emit(LinkUpdateLoadingState());
        emit(await _editAddRemove(() => removeLinkUseCase(linkId: event.linkId)));
      } else if (event is AddLinkUpdateEvent) {
        BlocProvider.of<LinkBloc>(event.context).add(UpdateMyLinksEvent(link: event.link, isUpdate: false));
        emit(LinkUpdateLoadingState());
        emit(await _editAddRemove(() => addLinkUseCase(link: event.link)));
      }
    });
  }
  Future<LinkUpdateState> _editAddRemove(Future<Either<Failure, Unit>> Function() callBack) async {
    final failureOrLinks = await callBack();
    return failureOrLinks.fold((failure) {
      return LinkUpdateErrorState(message: _mapFailureMessage(failure: failure));
    }, (_) {
      return LinkUpdateSuccessState(message: THE_PROCESS_IS_SUCCESSFUL);
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
