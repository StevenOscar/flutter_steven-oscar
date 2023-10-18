part of 'contact_bloc.dart';

sealed class ContactState extends Equatable {
  const ContactState();

  @override
  List<Object> get props => [];
}

final class ContactInitial extends ContactState {}

final class ContactDataLoading extends ContactState {}

final class ContactDataFailed extends ContactState {
  final String errorMessage;

  const ContactDataFailed({
    required this.errorMessage
  });

  @override
  List<Object> get props => [errorMessage];
}

//Contact POST state
final class ContactPostSuccess extends ContactState {
  final ContactModel contactData;

  const ContactPostSuccess({
    required this.contactData
  });

  @override
  List<Object> get props => [contactData];
}

//Contact GET state
final class ContactGetSuccess extends ContactState {
  final List<ContactModel> contactData;

  const ContactGetSuccess({
    required this.contactData
  });

  @override
  List<Object> get props => [contactData];
}