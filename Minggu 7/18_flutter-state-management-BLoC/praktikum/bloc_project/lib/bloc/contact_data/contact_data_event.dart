part of 'contact_data_bloc.dart';

abstract class ContactDataEvent extends Equatable {
  const ContactDataEvent();
}

class ContactDataAddedEvent extends ContactDataEvent {
  final String nameValue;
  final String numberValue;
  final Color colorValue;
  final DateTime dateValue;
  final PlatformFile? fileValue;

  const ContactDataAddedEvent({
    required this.nameValue,
    required this.numberValue,
    required this.colorValue,
    required this.dateValue,
    required this.fileValue,
  });

  @override
  List<Object?> get props => [nameValue, numberValue, colorValue, dateValue, fileValue];
}

class ContactDataDeletedEvent extends ContactDataEvent {
  final int index;

  const ContactDataDeletedEvent({
    required this.index
  });

  @override
  List<Object?> get props => [index];
}

class ContactDataEditedEvent extends ContactDataEvent {
  final int index;
  final String nameValue;
  final String numberValue;
  final Color colorValue;
  final DateTime dateValue;
  final PlatformFile? fileValue;

  const ContactDataEditedEvent({
    required this.index,
    required this.nameValue,
    required this.numberValue,
    required this.colorValue,
    required this.dateValue,
    required this.fileValue,
  });

  @override
  List<Object?> get props => [index, nameValue, numberValue, colorValue, dateValue, fileValue];
}