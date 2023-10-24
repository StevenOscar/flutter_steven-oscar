class ChoiceModel {
  ChoiceModel({
    required this.text,
    required this.index,
    this.logprobs,
    required this.finishReason,
  });

  String text;
  int index;
  dynamic logprobs;
  String finishReason;

  factory ChoiceModel.fromJson(Map<String, dynamic> json) => ChoiceModel(
    text: json["text"],
    index: json["index"],
    logprobs: json["logprobs"],
    finishReason: json["finish_reason"],
  );

  Map<String, dynamic> toJson() => {
    "text": text,
    "index": index,
    "logprobs": logprobs,
    "finish_reason": finishReason,
  };
}