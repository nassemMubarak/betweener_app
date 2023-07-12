part of 'link_update_bloc.dart';

@immutable
abstract class LinkUpdateEvent {}

class RemoveLinkUpdateEvent extends LinkUpdateEvent {
  final String linkId;

  RemoveLinkUpdateEvent({required this.linkId});
}

class EditLinkUpdateEvent extends LinkUpdateEvent {
  final BuildContext context;
  final Link link;

  EditLinkUpdateEvent({required this.context, required this.link});
}

class AddLinkUpdateEvent extends LinkUpdateEvent {
  final Link link;

  AddLinkUpdateEvent({required this.link});
}
