// Model untuk Soal Prioritas 2
class TextModel {
  int id;
  String title;
  String body;
  int userId;

  TextModel({
    required this.id,
    required this.title,
    required this.body,
    required this.userId,
  });

    //Mengubah JSON menjadi object PutModel
  factory TextModel.fromJson(Map<String, dynamic> json) => TextModel(
    id: json["id"],
    title: json["title"],
    body: json["body"],
    userId: json["userId"]
  );

  //Mengubah Map menjadi JSON
  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "body": body,
    "userId": userId
  };
}
