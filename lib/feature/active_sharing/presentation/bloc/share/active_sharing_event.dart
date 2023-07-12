part of 'active_sharing_bloc.dart';

abstract class ActiveSharingEvent {
  const ActiveSharingEvent();
}

class GetNearUsers implements ActiveSharingEvent {}

class DeleteActive implements ActiveSharingEvent {}

class SetActive implements ActiveSharingEvent {}
