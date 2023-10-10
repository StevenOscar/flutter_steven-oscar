// form_number_state.dart
part of 'form_number_bloc.dart';

abstract class FormNumberState extends Equatable {
  final String numberValue;
  final String? errorTextNumber;
  final bool isNumberValid;
  final TextEditingController numberController;

  const FormNumberState({
    required this.numberValue,
    required this.errorTextNumber,
    required this.isNumberValid,
    required this.numberController,
  });

  @override
  List<Object?> get props => [numberValue, errorTextNumber, isNumberValid, numberController];
}

class FormNumberInitialState extends FormNumberState {
  FormNumberInitialState() : super(
    numberValue: "",
    errorTextNumber: null,
    isNumberValid: false,
    numberController: TextEditingController(),
  );

  @override
  List<Object?> get props => [numberValue, errorTextNumber, isNumberValid, numberController];
}

class FormNumberValidatingState extends FormNumberState {
  const FormNumberValidatingState({
    required String numberValue,
    required String? errorTextNumber,
    required bool isNumberValid,
    required TextEditingController numberController,
  }) : super(
        numberValue: numberValue,
        errorTextNumber: errorTextNumber,
        isNumberValid: isNumberValid,
        numberController: numberController,
      );

  @override
  List<Object?> get props => [numberValue, errorTextNumber, isNumberValid, numberController];
}
