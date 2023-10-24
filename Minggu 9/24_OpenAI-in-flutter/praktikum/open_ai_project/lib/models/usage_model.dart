class UsageModel {
  UsageModel({
    required this.promptTokens,
    required this.completionTokens,
    required this.totalTokens,
  });

  int promptTokens;
  int completionTokens;
  int totalTokens;

  factory UsageModel.fromJson(Map<String, dynamic> json) => UsageModel(
        promptTokens: json["prompt_tokens"],
        completionTokens: json["completion_tokens"],
        totalTokens: json["total_tokens"],
      );

  Map<String, dynamic> toJson() => {
        "prompt_tokens": promptTokens,
        "completion_tokens": completionTokens,
        "total_tokens": totalTokens,
      };
}
