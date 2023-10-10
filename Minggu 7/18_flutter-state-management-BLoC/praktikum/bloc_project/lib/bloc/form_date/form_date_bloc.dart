import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/contact_model.dart';

part 'form_date_event.dart';
part 'form_date_state.dart';

class FormDateBloc extends Bloc<FormDateEvent, FormDateState> {
  FormDateBloc() : super(FormDateInitialState()) {
    on<FormDateSelectedEvent>((event, emit) {
      DateTime pickedDateValue = event.dateValue ?? state.pickedDateValue;
      return emit(
        FormDatePickedState(
          pickedDateValue: pickedDateValue
        )
      );
    });

    on<FormDateClearFieldEvent>((event, emit) {
      return emit(
        FormDateInitialState()
      );
    });

    on<FormDateSetFieldEvent>((event, emit) {
      return emit(
        FormDatePickedState(
          pickedDateValue: event.contactList[event.index].birthDate
        )
      );
    });
  }
}
