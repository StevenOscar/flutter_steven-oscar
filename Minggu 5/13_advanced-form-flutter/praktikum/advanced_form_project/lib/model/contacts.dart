import 'package:file_picker/file_picker.dart';
import 'dart:ui';

class Contacts {
  String name;
  String number;
  PlatformFile? profilePicture;
  DateTime birthDate;
  Color profileColor;

  Contacts ({
    required this.name,
    required this.number,
    required this.profilePicture,
    required this.birthDate,
    required this.profileColor,
  });
}