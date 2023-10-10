part of 'form_date_bloc.dart';

abstract class FormDateState extends Equatable {
  final DateTime pickedDateValue;

  const FormDateState({
    required this.pickedDateValue,
  });

  @override
  List<Object?> get props => [pickedDateValue];
}

class FormDateInitialState extends FormDateState {
  FormDateInitialState() : super(pickedDateValue: DateTime.now());

  @override
  List<Object?> get props => [pickedDateValue];
}

class FormDatePickedState extends FormDateState {
  const FormDatePickedState({
    required DateTime pickedDateValue,
  }) : super(
    pickedDateValue: pickedDateValue
  );

  @override
  List<Object?> get props => [pickedDateValue];
}

class FormDateClearFieldEvent extends FormDateEvent {
  @override
  List<Object?> get props => [];
}