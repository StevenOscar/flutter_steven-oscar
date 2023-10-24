import 'dart:convert';

import 'choice_model.dart';
import 'usage_model.dart';

GptDataModel gptDataFromJson(String str) => GptDataModel.fromJson(json.decode(str));

String gptDataToJson(GptDataModel data) => json.encode(data.toJson());

class GptDataModel {
  GptDataModel({
    required this.id,
    required this.object,
    required this.created,
    required this.model,
    required this.choices,
    required this.usage,
  });

  String id;
  String object;
  int created;
  String model;
  List<ChoiceModel> choices;
  UsageModel usage;

  factory GptDataModel.fromJson(Map<String, dynamic> json) => GptDataModel(
    id: json["id"],
    object: json["object"],
    created: json["created"],
    model: json["model"],
    choices:
        List<ChoiceModel>.from(json["choices"].map((x) => ChoiceModel.fromJson(x))),
    usage: UsageModel.fromJson(json["usage"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "object": object,
    "created": created,
    "model": model,
    "choices": List<dynamic>.from(choices.map((x) => x.toJson())),
    "usage": usage.toJson(),
  };
}