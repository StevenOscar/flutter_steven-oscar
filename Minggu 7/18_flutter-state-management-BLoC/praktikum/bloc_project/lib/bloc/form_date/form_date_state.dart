part of 'form_date_bloc.dart';

sealed class FormDateState extends Equatable {
  final DateTime pickedDateValue;

  const FormDateState({
    required this.pickedDateValue,
  });

  @override
  List<Object?> get props => [pickedDateValue];
}

class FormDateInitialState extends FormDateState {
  FormDateInitialState() : super(pickedDateValue: DateTime.now());
}

class FormDatePickedState extends FormDateState {
  const FormDatePickedState({
    required super.pickedDateValue,
  });
}

class FormDateClearFieldEvent extends FormDateEvent {
  @override
  List<Object?> get props => [];
}