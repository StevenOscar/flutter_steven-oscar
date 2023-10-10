import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../models/contact_model.dart';

part 'form_name_event.dart';
part 'form_name_state.dart';

class FormNameBloc extends Bloc<FormNameEvent, FormNameState> {
  FormNameBloc() : super(FormNameInitialState()) {
    on<FormInputNameEvent>((event, emit) {
      String? errorTextName;
      bool isNameValid = state.isNameValid;
      String nameValue = event.nameValue;
      TextEditingController nameController = state.nameController;

      if (nameValue.isEmpty == true) {
        errorTextName = "Nama harus diisi";
        isNameValid = false;
      } else if (!(nameValue.contains(" "))) {
        errorTextName = "Nama minimal terdiri dari 2 kata";
        isNameValid = false;
      } else if (RegExp(r'[0-9!@#$%^&*()_+{}\[\]:;<>,.?/~\\-]').hasMatch(nameValue)) {
        errorTextName = "Nama harus terdiri dari huruf";
        isNameValid = false;
      } else if (RegExp(r'\b[a-z][a-z]*\b').hasMatch(nameValue)) {
        errorTextName = "Setiap kata harus diawali dengan huruf kapital";
        isNameValid = false;
      } else if (RegExp(r'^[A-Z][a-zA-Z]*(\s[A-Z][a-zA-Z]*)+$').hasMatch(nameValue)) {
        errorTextName = null;
        isNameValid = true;
      } else {
        // kondisi bila user menginput nama dengan 2 kata, tapi menghapus kata kedua dan menyisakan spasinya saja
        errorTextName = "Nama minimal terdiri dari 2 kata";
        isNameValid = false;
      }
      return emit(
        FormNameValidatingState(
          errorTextName: errorTextName,
          nameValue: nameValue,
          isNameValid: isNameValid,
          nameController: nameController
        )
      );
    });

    on<FormNameClearFieldEvent>((event, emit) {
      return emit(
        FormNameInitialState()
      );
    });

    on<FormNameSetFieldEvent>((event, emit) {
      return emit(
        FormNameValidatingState(
          errorTextName: null,
          isNameValid: true,
          nameController: TextEditingController(text: event.contactList[event.index].name),
          nameValue: event.contactList[event.index].name,
        )
      );
    });
  }
}
