import 'dart:convert';

import 'package:dio/dio.dart';
import '../text_model.dart';

class TextApi {
  //PUT data
  Future<TextModel> putText(TextModel textData) async {
    String textModelJson = jsonEncode(textData.toJson());

    final response = await Dio().put(
      'https://jsonplaceholder.typicode.com/posts/1',
      data: textModelJson
    );

     //Untuk menampilkan data POST berhasil dikirim dan difetch kembali (soal prioritas 1 nomor 1)
    print("Response Status Code : ${response.statusCode}");
    print("Response Data : ${response.data}");

    TextModel textItem = TextModel.fromJson(response.data);
    print("Text Item dari PUT API : id = ${textItem.id}, title = ${textItem.title}, body = ${textItem.body}, UserId = ${textItem.userId}");

    return textItem;
  }
}