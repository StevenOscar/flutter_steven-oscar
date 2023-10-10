part of 'form_file_bloc.dart';

abstract class FormFileState extends Equatable {
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

  @override
  List<Object?> get props => [pickedFileValue, showPickedFile, isFilePicked];
}

class FormFilePickedState extends FormFileState {
  const FormFilePickedState ({
    required PlatformFile? pickedFileValue,
    required File? showPickedFile,
    required bool isFilePicked
  }) : super(
    isFilePicked: isFilePicked,
    pickedFileValue: pickedFileValue,
    showPickedFile: showPickedFile
  );

  @override
  List<Object?> get props => [pickedFileValue,showPickedFile,isFilePicked];
}

class FormFileClearFieldEvent extends FormFileEvent {
  @override
  List<Object?> get props => [];
}