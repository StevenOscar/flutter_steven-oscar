part of 'dicebear_bloc.dart';

sealed class DicebearEvent extends Equatable {
  const DicebearEvent();

  @override
  List<Object> get props => [];
}

class GenerateButtonPressedEvent extends DicebearEvent{
  final String artStyle;
  final String query;

  const GenerateButtonPressedEvent({
    required this.artStyle,
    required this.query
  });

  @override
  List<Object> get props => [artStyle,query];
}

class PageChangedDicebearEvent extends DicebearEvent{
  const PageChangedDicebearEvent();

  @override
  List<Object> get props => [];
}