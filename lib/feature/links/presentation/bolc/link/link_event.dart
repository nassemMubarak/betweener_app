part of 'link_bloc.dart';

abstract class LinkEvent extends Equatable {
  const LinkEvent();

  @override
  List<Object?> get props => [];
}

class GetMyLinksEvent extends LinkEvent {
  const GetMyLinksEvent();
}

class RemoveLinkEvent extends LinkEvent {
  final String linkId;

  const RemoveLinkEvent({required this.linkId});
}

class EditLinkEvent extends LinkEvent {
  final Link link;

  const EditLinkEvent({required this.link});
}

class AddLinkEvent extends LinkEvent {
  final Link link;

  const AddLinkEvent({required this.link});
}
