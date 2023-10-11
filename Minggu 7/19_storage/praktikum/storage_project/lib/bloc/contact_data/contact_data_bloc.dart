import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/contact_model.dart';

part 'contact_data_event.dart';
part 'contact_data_state.dart';

class ContactDataBloc extends Bloc<ContactDataEvent, ContactDataState> {
  ContactDataBloc() : super(ContactDataListInitialState()) {
    on<ContactDataAddedEvent>((event, emit) {
      ContactModel contactItem = ContactModel(
        name: event.nameValue,
        number:  event.numberValue,
        profilePicture:  event.fileValue,
        birthDate:  event.dateValue,
        profileBorderColor:  event.colorValue
      );
      List<ContactModel> newContactList = List.from(state.contactList)..add(contactItem);

      return emit(
        ContactDataListFilledState(
          contactList: newContactList
        )
      );
    });

    on<ContactDataDeletedEvent>((event, emit) {
      List<ContactModel> newContactList =  List.from(state.contactList)..removeAt(event.index);
      return emit(
        ContactDataListFilledState(
          contactList: newContactList
        )
      );
    });

    on<ContactDataEditedEvent>((event, emit) {
      List<ContactModel> newContactList =  List.from(state.contactList);
      newContactList[event.index] = ContactModel(
        name: event.nameValue,
        number:  event.numberValue,
        profilePicture:  event.fileValue,
        birthDate:  event.dateValue,
        profileBorderColor:  event.colorValue
      );

      return emit(
        ContactDataListFilledState(
          contactList: newContactList
        )
      );
    });
  }
}
