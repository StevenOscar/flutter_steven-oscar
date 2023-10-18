part of 'contact_bloc.dart';

sealed class ContactEvent extends Equatable {
  const ContactEvent();
}

class PostContactEvent extends ContactEvent {
  final ContactModel contactItem;

  const PostContactEvent({
    required this.contactItem
  });

  @override
  List<Object> get props => [contactItem];
}

class GetContactEvent extends ContactEvent {
  const GetContactEvent();

  @override
  List<Object> get props => [];
}