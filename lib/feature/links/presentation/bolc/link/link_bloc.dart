import 'package:betweener_app/core/api/api_controller.dart';
import 'package:betweener_app/core/error/failure.dart';
import 'package:betweener_app/core/string/failure.dart';
import 'package:betweener_app/feature/links/data/models/link_model.dart';
import 'package:betweener_app/feature/links/domain/entities/link.dart';
import 'package:betweener_app/feature/links/domain/usecases/get_my_links_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'link_event.dart';
part 'link_state.dart';

class LinkBloc extends Bloc<LinkEvent, LinkState> {
  final GetMyLinksUseCase getMyLinksUseCase;

  LinkBloc({
    required this.getMyLinksUseCase,
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
                links: links
                    .map<LinkModel>(
                      (link) => LinkModel.fromLink(link: link),
                    )
                    .toList(),
              ),
            );
          },
        );
      } else if (event is UpdateMyLinksEvent) {
        emit(LinkLoadingState());
        final failureOrLinks = await getMyLinksUseCase();
        failureOrLinks.fold(
          (failure) {
            emit(LinkErrorState(message: _mapFailureMessage(failure: failure)));
          },
          (links) {
            List<LinkModel> listOfLinks = links.map<LinkModel>((link) {
              if (event.link != null && link.id == event.link!.id && event.isUpdate) {
                ApiController().updateLinkFromCache(event.index!, event.link!);
                return LinkModel.fromLink(link: event.link!);
              }
              return LinkModel.fromLink(link: link);
            }).toList();
            if (!event.isUpdate && event.link != null) {
              listOfLinks.add(LinkModel.fromLink(link: event.link!));
              ApiController().addLinkFromCache(event.link!);
            } else if (event.link == null) {
              listOfLinks.removeAt(event.index!);
              ApiController().removeLinkFromCache(event.index!);
            }
            emit(
              LinkSuccessState(links: listOfLinks),
            );
          },
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
