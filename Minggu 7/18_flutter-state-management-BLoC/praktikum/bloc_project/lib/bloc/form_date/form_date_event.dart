part of 'form_date_bloc.dart';

abstract class FormDateEvent extends Equatable {
  const FormDateEvent();
}

class FormDateSelectedEvent extends FormDateEvent {
  final DateTime? dateValue;

  const FormDateSelectedEvent({
    required this.dateValue
  });

  @override
  List<Object?> get props => [dateValue];
}

class FormDateSetFieldEvent extends FormDateEvent{
  final int index;
  final List<ContactModel> contactList;

  const FormDateSetFieldEvent({
    required this.index,
    required this.contactList
  });

  @override
  List<Object?> get props => [];
}
