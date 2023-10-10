part of 'form_color_bloc.dart';

abstract class FormColorState extends Equatable {
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

  @override
  List<Object?> get props => [pickedColorValue];
}

class FormColorPickedState extends FormColorState {
  const FormColorPickedState({
    required Color pickedColorValue,
  }) : super(
    pickedColorValue: pickedColorValue
  );

  @override
  List<Object?> get props => [pickedColorValue];
}