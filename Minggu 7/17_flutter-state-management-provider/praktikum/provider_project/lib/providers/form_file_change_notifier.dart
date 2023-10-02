import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import '../models/contact_model.dart';

class FormFileChangeNotifier with ChangeNotifier {
  PlatformFile? _pickedPictureFile;
  PlatformFile? get pickedPictureFile => _pickedPictureFile;

  bool _isFilePicked = false;
  bool get isFilePicked => _isFilePicked;

  File? _showPickedFile = File("");
  File? get showPickedFile => _showPickedFile;

  void setField({
    required int index,
    required List<ContactModel> contactList
  }) {
    _pickedPictureFile = contactList[index].profilePicture;
    _showPickedFile = File("");
    if(_pickedPictureFile != null) {
      _showPickedFile = File(_pickedPictureFile!.path.toString());
      _isFilePicked = true;
    } else {
      _isFilePicked = false;
    }
  }


  void pickFile() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null){
      PlatformFile pictureFile = result.files.first;
      _showPickedFile = File(pictureFile.path.toString());
      _pickedPictureFile = pictureFile;
      _isFilePicked = true;
      notifyListeners();
    } else {
      _isFilePicked = false;
    }
  }

  void openFile(File? showPickedFile){
    if(showPickedFile != null){
      OpenFile.open(showPickedFile.path);
    }
  }

  void removeFile(File? pickedFile){
    _showPickedFile = File("");
    _pickedPictureFile = null;
    _isFilePicked = false;
    notifyListeners();
  }

  void clearField(){
    _pickedPictureFile = null;
    _isFilePicked = false;
    notifyListeners();
  }
}