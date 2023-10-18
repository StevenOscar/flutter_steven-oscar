part of 'text_bloc.dart';

sealed class TextEvent extends Equatable {
  const TextEvent();

  @override
  List<Object> get props => [];
}

class PutTextEvent extends TextEvent {
  final TextModel textItem;

  const PutTextEvent({
    required this.textItem
  });

  @override
  List<Object> get props => [textItem];
}