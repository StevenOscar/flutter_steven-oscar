import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../models/contact_model.dart';
import '../../themes/theme_colors.dart';

part 'form_color_event.dart';
part 'form_color_state.dart';

class FormColorBloc extends Bloc<FormColorEvent, FormColorState> {
  FormColorBloc() : super(FormColorInitialState()) {
    on<FormColorChangedEvent>((event, emit) {
      return emit(
        FormColorPickedState(
          pickedColorValue: event.colorValue
        )
      );
    });

    on<FormColorClearFieldEvent>((event, emit) {
      return emit(
        FormColorInitialState()
      );
    });

    on<FormColorSetFieldEvent>((event, emit) {
      return emit(
        FormColorPickedState(
          pickedColorValue: event.contactList[event.index].profileBorderColor
        )
      );
    });
  }
}
