import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

import '../constants/open_ai.dart';
import '../models/gpt_data_model.dart';
import '../models/usage_model.dart';

class RecommendationService {
  static Future<GptDataModel> getRecommendations({
    required String budget,
    required String storage,
    required String camera
  }) async {
    late GptDataModel gptData = GptDataModel(
      id: "",
      object: "",
      created: 0,
      model: "",
      choices: [],
      usage: UsageModel(completionTokens: 0, promptTokens: 0, totalTokens: 0),
    );

    try {
      Map<String, String> headers = {
        'Content-Type': 'application/json;charset=UTF-8',
        'Charset': 'utf-8',
        'Authorization': 'Bearer $apiKey'
      };

      final formatCurrency = NumberFormat.currency(
        locale: 'id_ID',
        symbol: 'IDR ',
        decimalDigits: 0,
      );

      String phoneBudget = formatCurrency.format(int.parse(budget));

      String promptData =
        "You are a smartphone expert. Please give me top 3 smartphone recommendation with specification $camera MP or above Camera, equals or more than $storage GB Storage that can be afforded in Indonesia with budget less than $phoneBudget and please give a short reason why you recommend them (specification, features, etc)";

      final data = jsonEncode({
        "model": "text-davinci-003",
        "prompt": promptData,
        "temperature": 0.4,
        "max_tokens": 1024,
        "top_p": 1,
        "frequency_penalty": 0,
        "presence_penalty": 0
      });

      var response = await Dio().post(
        'https://api.openai.com/v1/completions',
        options: Options(
          headers: headers
        ),
        data: data
      );

      if (response.statusCode == 200) {
        gptData = GptDataModel.fromJson(response.data);
      }
    } catch (e) {
      throw Exception('Error occured when sending request.');
    }

    return gptData;
  }
}
