part of 'share_bloc.dart';

abstract class ShareState extends Equatable {
  const ShareState();
  @override
  List<Object> get props => [];
}
class ShareInitial extends ShareState {
  @override
  List<Object> get props => [];
}
class ShareLoadedSharedState extends ShareState{
  final List<Share> share;
  ShareLoadedSharedState({required this.share});
  @override
  List<Object> get props => [share];
}
class ShareLoadedUserState extends ShareState{
  final User user;
  ShareLoadedUserState({required this.user});
  @override
  List<Object> get props => [user];
}
class ShareLoadingState extends ShareState{}

class ShareMessageSuccessState extends ShareState{
  final String message;

  ShareMessageSuccessState({required this.message});

  @override
  List<Object> get props => [message];
}
class ShareMessageErrorState extends ShareState{
  final String message;

  ShareMessageErrorState({required this.message});

  @override
  List<Object> get props => [message];
}