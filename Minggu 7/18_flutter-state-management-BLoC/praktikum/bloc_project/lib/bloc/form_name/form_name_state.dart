part of 'form_name_bloc.dart';

abstract class FormNameState extends Equatable {
  final String nameValue;
  final String? errorTextName;
  final bool isNameValid;
  final TextEditingController nameController;

  const FormNameState({
    required this.nameValue,
    required this.errorTextName,
    required this.isNameValid,
    required this.nameController,
  });

  @override
  List<Object?> get props => [nameValue, errorTextName, isNameValid, nameController];
}

class FormNameInitialState extends FormNameState {
  FormNameInitialState() : super(
    nameValue: "",
    errorTextName: null,
    isNameValid: false,
    nameController: TextEditingController(),
  );

  @override
  List<Object?> get props => [nameValue, errorTextName, isNameValid, nameController];
}

class FormNameValidatingState extends FormNameState {
  const FormNameValidatingState({
    required String nameValue,
    required String? errorTextName,
    required bool isNameValid,
    required TextEditingController nameController,
  }) : super(
    nameValue: nameValue,
    errorTextName: errorTextName,
    isNameValid: isNameValid,
    nameController: nameController,
  );

  @override
  List<Object?> get props => [nameValue, errorTextName, isNameValid, nameController];
}

