part of 'share_bloc.dart';

abstract class ShareEvent extends Equatable {
  const ShareEvent();
  @override
  List<Object?> get props => [];
}
class ScanAccountEvent extends ShareEvent{
  final Map scanData;

  ScanAccountEvent({required this.scanData});

  @override
  List<Object?> get props => [scanData];
}
class GetAllShareEvent extends ShareEvent{}

class AddShareEvent extends ShareEvent{
  final Share share;

  AddShareEvent({required this.share});

  @override
  List<Object?> get props => [share];
}
