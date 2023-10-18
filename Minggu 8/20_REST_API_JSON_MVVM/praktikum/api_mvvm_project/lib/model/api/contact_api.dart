import 'dart:convert';

import 'package:dio/dio.dart';
import '../contact_model.dart';

class ContactApi {
  //GET Contact
  Future<List<ContactModel>> getContact() async {
    List<ContactModel> contactList = [];
    final response = await Dio().get(
      'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts/2',
    );

    //Untuk jawaban soal prioritas 1 nomor 2    (Cuma ada 1 isi karena link endpointnya cuma untuk yang id 2)
    print("Response Status Code : ${response.statusCode}");
    print("Response Data : ${response.data}");
    if(response.data is List) {
      for (var element in response.data) {
        contactList.add(ContactModel.fromJson(element));
      }
    } else {
      contactList.add(ContactModel.fromJson(response.data));
    }
    for(int i = 0; i<contactList.length;i++){
      print("Contact List dari GET API : id = ${contactList[i].id}, name = ${contactList[i].name}, phone = ${contactList[i].phone}");
    }

    return contactList;
  }

  //POST Contact
  Future<ContactModel> postContact(ContactModel contactData) async {
    String contactModelJson = jsonEncode(contactData.toJson());

    final response = await Dio().post(
      'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts',
      data: contactModelJson
    );

    //Untuk menampilkan data POST berhasil dikirim dan difetch kembali (soal prioritas 1 nomor 1)
    print("Response Code : ${response.statusCode}");
    print("Response Data : ${response.data}");

    ContactModel contactItem = ContactModel.fromJson(response.data);
    print("Contact Item dari POST API : id = ${contactItem.id}, name = ${contactItem.name}, phone = ${contactItem.phone}");

    return contactItem;
  }
}