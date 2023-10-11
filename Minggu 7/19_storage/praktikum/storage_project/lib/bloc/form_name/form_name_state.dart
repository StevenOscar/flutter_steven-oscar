part of 'form_name_bloc.dart';

sealed class FormNameState extends Equatable {
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
}

class FormNameValidatingState extends FormNameState {
  const FormNameValidatingState({
    required super.errorTextName,
    required super.isNameValid,
    required super.nameController,
    required super.nameValue
  });
}

