part of 'form_color_bloc.dart';

sealed class FormColorState extends Equatable {
  final Color pickedColorValue;

  const FormColorState({
    required this.pickedColorValue,
  });

  @override
  List<Object?> get props => [pickedColorValue];
}

class FormColorInitialState extends FormColorState {
  FormColorInitialState() : super(
    pickedColorValue: ThemeColors().m3SysLightOnPrimaryContainer
  );
}

class FormColorPickedState extends FormColorState {
  const FormColorPickedState({
    required super.pickedColorValue,
  });
}