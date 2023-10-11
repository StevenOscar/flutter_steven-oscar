part of 'form_file_bloc.dart';

sealed class FormFileEvent extends Equatable {
  const FormFileEvent();
}

class FormFileSelectEvent extends FormFileEvent {
  @override
  List<Object?> get props => [];
}

class FormRemoveFileEvent extends FormFileEvent {
  final File? fileValue;

  const FormRemoveFileEvent ({
    required this.fileValue
  });

  @override
  List<Object?> get props => [fileValue];
}

class FormOpenFileEvent extends FormFileEvent {
  final File? fileValue;

  const FormOpenFileEvent ({
    required this.fileValue
  });

  @override
  List<Object?> get props => [fileValue];
}

class FormFileSetFieldEvent extends FormFileEvent{
  final int index;
  final List<ContactModel> contactList;

  const FormFileSetFieldEvent({
    required this.index,
    required this.contactList
  });

  @override
  List<Object?> get props => [index, contactList];
}