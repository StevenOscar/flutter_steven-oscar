part of 'dicebear_bloc.dart';

sealed class DicebearState extends Equatable {
  const DicebearState();

  @override
  List<Object> get props => [];
}

final class DicebearInitial extends DicebearState {}

final class DicebearDataLoading extends DicebearState {}

final class DicebearDataFailed extends DicebearState {
  final String errorMessage;

  const DicebearDataFailed({
    required this.errorMessage
  });

  @override
  List<Object> get props => [errorMessage];
}

//Dicebear GET state
final class DicebearGetSuccess extends DicebearState {
  final String imageData;

  const DicebearGetSuccess({
    required this.imageData
  });

  @override
  List<Object> get props => [imageData];
}