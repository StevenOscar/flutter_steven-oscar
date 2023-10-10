import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:open_file/open_file.dart';

import '../../models/contact_model.dart';

part 'form_file_event.dart';
part 'form_file_state.dart';

class FormFileBloc extends Bloc<FormFileEvent, FormFileState> {
  FormFileBloc() : super(FormFileInitialState()) {
    on<FormFileSelectEvent>((event, emit) async {
      PlatformFile? pickedFileValue = state.pickedFileValue;
      File? showPickedFile = state.showPickedFile;
      bool isFilePicked = state.isFilePicked;
      final result = await FilePicker.platform.pickFiles(type: FileType.image);
      if (result != null){
        PlatformFile pictureFile = result.files.first;
        showPickedFile = File(pictureFile.path.toString());
        pickedFileValue = pictureFile;
        isFilePicked = true;
      } else {
        isFilePicked = false;
      }
      return emit (
        FormFilePickedState(
          pickedFileValue: pickedFileValue,
          showPickedFile: showPickedFile,
          isFilePicked: isFilePicked
        )
      );
    });

    on<FormOpenFileEvent>((event, emit) {
      if(state.showPickedFile != null){
        OpenFile.open(state.showPickedFile?.path);
      }
    });

    on<FormRemoveFileEvent>((event, emit) {
      return emit (
        FormFilePickedState(
          pickedFileValue: null,
          showPickedFile: File(''),
          isFilePicked: false
        )
      );
    });

    on<FormFileClearFieldEvent>((event, emit) {
      return emit(
        FormFileInitialState()
      );
    });

    on<FormFileSetFieldEvent>((event, emit) {
      PlatformFile? pickedFileValue = event.contactList[event.index].profilePicture;
      File showPickedFile = File("");
      bool isFilePicked = false;
      if(pickedFileValue != null) {
        showPickedFile = File(pickedFileValue.path.toString());
        isFilePicked = true;
      } else {
        isFilePicked = false;
      }
      return emit(
        FormFilePickedState(
          pickedFileValue: pickedFileValue,
          showPickedFile: showPickedFile,
          isFilePicked: isFilePicked
        )
      );
    });
  }
}
