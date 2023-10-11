part of 'form_file_bloc.dart';

sealed class FormFileState extends Equatable {
  final PlatformFile? pickedFileValue;
  final File? showPickedFile;
  final bool isFilePicked;

  const FormFileState ({
    required this.pickedFileValue,
    required this.showPickedFile,
    required this.isFilePicked
  });

  @override
  List<Object?> get props => [pickedFileValue, showPickedFile, isFilePicked];
}

class FormFileInitialState extends FormFileState {
  FormFileInitialState () : super (
    pickedFileValue : null,
    showPickedFile : File(""),
    isFilePicked : false
  );
}

class FormFilePickedState extends FormFileState {
  const FormFilePickedState ({
    required super.pickedFileValue,
    required super.showPickedFile,
    required super.isFilePicked
  });
}

class FormFileClearFieldEvent extends FormFileEvent {
  @override
  List<Object?> get props => [];
}