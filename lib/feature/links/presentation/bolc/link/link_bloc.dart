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
                      (link) => linkToLinkModel(link: link),
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
              if (link.id == event.link.id && event.isUpdate) {
                return linkToLinkModel(link: event.link);
              }
              return linkToLinkModel(link: link);
            }).toList();
            if (!event.isUpdate) {
              listOfLinks.add(linkToLinkModel(link: event.link));
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

  LinkModel linkToLinkModel({required Link link}) {
    return LinkModel(
      username: link.username,
      link: link.link,
      id: link.id,
      isActive: link.isActive,
      title: link.title,
      createdAt: link.createdAt,
      userId: link.userId,
      updatedAt: link.updatedAt,
    );
  }
}
