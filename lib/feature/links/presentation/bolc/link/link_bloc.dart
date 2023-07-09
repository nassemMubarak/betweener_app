import 'package:betweener_app/core/error/failure.dart';
import 'package:betweener_app/core/string/failure.dart';
import 'package:betweener_app/feature/links/data/models/link_model.dart';
import 'package:betweener_app/feature/links/domain/entities/link.dart';
import 'package:betweener_app/feature/links/domain/usecases/add_link_usecase.dart';
import 'package:betweener_app/feature/links/domain/usecases/delete_link_usecase.dart';
import 'package:betweener_app/feature/links/domain/usecases/edit_link_usecase.dart';
import 'package:betweener_app/feature/links/domain/usecases/get_my_links_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/string/messages.dart';

part 'link_event.dart';
part 'link_state.dart';

class LinkBloc extends Bloc<LinkEvent, LinkState> {
  final GetMyLinksUseCase getMyLinksUseCase;
  final AddLinkUseCase addLinkUseCase;
  final EditLinkUseCase editLinkUseCase;
  final RemoveLinkUseCase removeLinkUseCase;

  LinkBloc({
    required this.getMyLinksUseCase,
    required this.addLinkUseCase,
    required this.removeLinkUseCase,
    required this.editLinkUseCase,
  }) : super(LinkInitial()) {
    on<LinkEvent>((event, emit) async {
      if (event is GetMyLinksEvent) {
        emit(LinkLoadingState());
        final failureOrLinks = await getMyLinksUseCase();
        failureOrLinks.fold(
          (failure) {
            emit(LinkErrorState(message: _mapFailureMessage(failure: failure)));
          },
          (links) {
            emit(
              LinkSuccessState(
                links: links.map<LinkModel>((link) => LinkModel(name: link.name, url: link.url, id: link.id)).toList(),
              ),
            );
          },
        );
      } else if (event is AddLinkEvent) {
        emit(LinkLoadingState());
        emit(await _editAddRemove(() => addLinkUseCase(link: event.link)));
      } else if (event is EditLinkEvent) {
        emit(LinkLoadingState());
        emit(await _editAddRemove(() => editLinkUseCase(link: event.link)));
      } else if (event is RemoveLinkEvent) {
        emit(LinkLoadingState());
        emit(await _editAddRemove(() => removeLinkUseCase(linkId: event.linkId)));
      }
    });
  }

  Future<LinkState> _editAddRemove(Future<Either<Failure, Unit>> Function() callBack) async {
    final failureOrLinks = await callBack();
    return failureOrLinks.fold((failure) {
      return LinkErrorState(message: _mapFailureMessage(failure: failure));
    }, (_) {
      return const LinkSuccessState(message: THE_PROCESS_IS_SUCCESSFUL);
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
