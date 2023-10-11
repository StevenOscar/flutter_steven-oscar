// form_number_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../models/contact_model.dart';

part 'form_number_event.dart';
part 'form_number_state.dart';

class FormNumberBloc extends Bloc<FormNumberEvent, FormNumberState> {
  FormNumberBloc() : super(FormNumberInitialState()) {
    on<FormInputNumberEvent>((event, emit) {
      String? errorTextNumber;
      bool isNumberValid = state.isNumberValid;
      String? numberValue = event.numberValue;
      TextEditingController numberController = state.numberController;

      if (numberValue.isEmpty) {
        errorTextNumber = "Nomor telepon harus diisi";
        isNumberValid = false;
      } else if (RegExp(r'[^\d]+$').hasMatch(numberValue)) {
        errorTextNumber = "Nomor telepon harus terdiri dari angka saja";
        isNumberValid = false;
      } else if (int.parse(numberValue[0]) != 0) {
        errorTextNumber = "Nomor telepon harus diawali angka 0";
        isNumberValid = false;
      } else if ((numberValue.length < 8 || numberValue.length > 15)) {
        errorTextNumber = "Nomor telepon harus terdiri dari 8-15 digit";
        isNumberValid = false;
      } else if (RegExp(r'^0[0-9]{6,14}$').hasMatch(numberValue)) {
        errorTextNumber = null;
        isNumberValid = true;
      }
      return emit(
        FormNumberValidatingState(
          errorTextNumber: errorTextNumber,
          numberValue: numberValue,
          isNumberValid: isNumberValid,
          numberController: numberController,
        ),
      );
    });

    on<FormNumberClearFieldEvent>((event, emit) {
      return emit(
        FormNumberInitialState()
      );
    });

    on<FormNumberSetFieldEvent>((event, emit) {
      return emit(
        FormNumberValidatingState(
          errorTextNumber: null,
          isNumberValid: true,
          numberController: TextEditingController(text: event.contactList[event.index].number),
          numberValue: event.contactList[event.index].number,
        )
      );
    });
  }
}
