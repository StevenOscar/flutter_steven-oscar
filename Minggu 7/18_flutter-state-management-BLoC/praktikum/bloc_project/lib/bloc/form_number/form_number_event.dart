part of 'form_number_bloc.dart';

abstract class FormNumberEvent extends Equatable {
  const FormNumberEvent();
}

class FormInputNumberEvent extends FormNumberEvent {
  final String numberValue;

  const FormInputNumberEvent({
    required this.numberValue
  });

  @override
  List<Object> get props => [numberValue];
}

class FormNumberClearFieldEvent extends FormNumberEvent {
  @override
  List<Object?> get props => [];
}

class FormNumberSetFieldEvent extends FormNumberEvent{
  final int index;
  final List<ContactModel> contactList;

  const FormNumberSetFieldEvent({
    required this.index,
    required this.contactList
  });

  @override
  List<Object?> get props => [];
}