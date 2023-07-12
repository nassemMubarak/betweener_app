part of 'link_update_bloc.dart';

@immutable
abstract class LinkUpdateEvent {}

class RemoveLinkUpdateEvent extends LinkUpdateEvent {
  final String linkId;
  final int indexInList;
  final BuildContext context;

  RemoveLinkUpdateEvent({
    required this.linkId,
    required this.indexInList,
    required this.context,
  });
}

class EditLinkUpdateEvent extends LinkUpdateEvent {
  final BuildContext context;
  final Link link;
  final int index;

  EditLinkUpdateEvent({
    required this.context,
    required this.link,
    required this.index,
  });
}

class AddLinkUpdateEvent extends LinkUpdateEvent {
  final BuildContext context;
  final Link link;

  AddLinkUpdateEvent({required this.context, required this.link});
}

class BackToInitStateLinkUpdateEvent extends LinkUpdateEvent {
  BackToInitStateLinkUpdateEvent();
}
