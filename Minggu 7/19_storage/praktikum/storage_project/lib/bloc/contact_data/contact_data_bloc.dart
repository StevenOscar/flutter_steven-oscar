import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/contact_model.dart';
import '../../utils/db_helper/database_helper.dart';

part 'contact_data_event.dart';
part 'contact_data_state.dart';

class ContactDataBloc extends Bloc<ContactDataEvent, ContactDataState> {
  ContactDataBloc() : super(ContactDataListInitialState()) {
    late DatabaseHelper dbHelper = DatabaseHelper();

    on<ContactDataAddedEvent>((event, emit) async {
      int highestId = await dbHelper.getHighestId();

      await dbHelper.addContact(
        contactModel: ContactModel(
          id : highestId + 1,
          name: event.nameValue,
          number:  event.numberValue,
          profilePicture:  event.fileValue,
          birthDate:  event.dateValue,
          profileBorderColor:  event.colorValue
        )
      );

      List<ContactModel> newContactList = await dbHelper.getContact();

      return emit(
        ContactDataListFilledState(
          contactList: newContactList
        )
      );
    });

    on<ContactDataDeletedEvent>((event, emit) async {
      await dbHelper.deleteContact(id : state.contactList[event.index].id);

      List<ContactModel> newContactList = await dbHelper.getContact();

      return emit(
        ContactDataListFilledState(
          contactList: newContactList
        )
      );
    });

    on<ContactDataEditedEvent>((event, emit) async {
      await dbHelper.updateContact(
        contactModel:  ContactModel(
          id: state.contactList[event.index].id,
          name: event.nameValue,
          number: event.numberValue,
          profilePicture: event.fileValue,
          birthDate: event.dateValue,
          profileBorderColor: event.colorValue
        ),
        id : state.contactList[event.index].id
      );

      List<ContactModel> newContactList = await dbHelper.getContact();

      return emit(
        ContactDataListFilledState(
          contactList: newContactList
        )
      );
    });

    on<ContactDataFetchDatabaseEvent>((event, emit) async {
      List<ContactModel> contactList = await dbHelper.getContact();

      return emit(
        ContactDataListFilledState(
          contactList: contactList
        )
      );
    });
  }
}
