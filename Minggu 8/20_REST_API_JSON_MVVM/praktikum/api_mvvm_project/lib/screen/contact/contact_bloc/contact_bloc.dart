import 'package:api_mvvm_project/model/api/contact_api.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/contact_model.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc() : super(ContactInitial()) {
    on<PostContactEvent>((event, emit) async{
      try {
        emit(ContactDataLoading());
        final postData = await ContactApi().postContact(event.contactItem);
        emit(
          ContactPostSuccess(
            contactData: postData
          )
        );
        print("POST data berhasil");
      } catch (e) {
        emit(
          const ContactDataFailed(
            errorMessage: "Gagal melakukan POST"
          )
        );
      }
    });

    on<GetContactEvent>((event, emit) async{
      try {
        emit(ContactDataLoading());
        final getData = await ContactApi().getContact();
        emit(
          ContactGetSuccess(
            contactData: getData
          )
        );
        print("GET data berhasil");
      } catch (e) {
        emit(
          const ContactDataFailed(
            errorMessage: "Gagal melakukan GET"
          )
        );
      }
    });
  }
}
