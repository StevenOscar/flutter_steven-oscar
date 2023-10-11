part of 'form_color_bloc.dart';

sealed class FormColorEvent extends Equatable {
  const FormColorEvent();
}

class FormColorChangedEvent extends FormColorEvent {
  final Color colorValue;

  const FormColorChangedEvent({
    required this.colorValue
  });

  @override
  List<Object> get props => [colorValue];
}

class FormColorClearFieldEvent extends FormColorEvent {
  @override
  List<Object?> get props => [];
}

class FormColorSetFieldEvent extends FormColorEvent{
  final int index;
  final List<ContactModel> contactList;

  const FormColorSetFieldEvent({
    required this.index,
    required this.contactList
  });

  @override
  List<Object?> get props => [index, contactList];
}
