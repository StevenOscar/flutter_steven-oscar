part of 'form_name_bloc.dart';

abstract class FormNameEvent extends Equatable {
  const FormNameEvent();
}

class FormInputNameEvent extends FormNameEvent {
  final String nameValue;

  const FormInputNameEvent({
    required this.nameValue
  });

  @override
  List<Object> get props => [nameValue];
}

class FormNameClearFieldEvent extends FormNameEvent {
  @override
  List<Object?> get props => [];
}

class FormNameSetFieldEvent extends FormNameEvent{
  final int index;
  final List<ContactModel> contactList;

  const FormNameSetFieldEvent({
    required this.index,
    required this.contactList
  });

  @override
  List<Object?> get props => [];
}