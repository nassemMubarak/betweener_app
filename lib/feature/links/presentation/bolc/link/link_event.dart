part of 'link_bloc.dart';

abstract class LinkEvent extends Equatable {
  const LinkEvent();

  @override
  List<Object?> get props => [];
}

class GetMyLinksEvent extends LinkEvent {
  const GetMyLinksEvent();
}

class UpdateMyLinksEvent extends LinkEvent {
  bool isUpdate;
  final Link link;
  UpdateMyLinksEvent({required this.link, this.isUpdate = true});
}
