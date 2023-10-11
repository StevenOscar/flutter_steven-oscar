part of 'contact_data_bloc.dart';

sealed class ContactDataState extends Equatable {
  final List<ContactModel> contactList;

  const ContactDataState({
    required this.contactList
  });

  @override
  List<Object> get props => [contactList];
}

class ContactDataListInitialState extends ContactDataState {
  ContactDataListInitialState() : super (contactList: []);
}

class ContactDataListFilledState extends ContactDataState {
  const ContactDataListFilledState({
    required super.contactList
  });
}