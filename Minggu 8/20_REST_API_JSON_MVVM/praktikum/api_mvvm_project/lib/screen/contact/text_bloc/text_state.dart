part of 'text_bloc.dart';

sealed class TextState extends Equatable {
  const TextState();

  @override
  List<Object> get props => [];
}

final class TextInitial extends TextState {}

final class TextDataLoading extends TextState {}

final class TextDataFailed extends TextState {
  final String errorMessage;

  const TextDataFailed({
    required this.errorMessage
  });

  @override
  List<Object> get props => [errorMessage];
}

//Text PUT state
final class TextPutSuccess extends TextState {
  final TextModel textData;

  const TextPutSuccess({
    required this.textData
  });

  @override
  List<Object> get props => [textData];
}