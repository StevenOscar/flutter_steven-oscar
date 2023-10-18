class ContactModel {
  int id;
  String name;
  String phone;

  ContactModel({
    required this.id,
    required this.name,
    required this.phone,
  });

  //Mengubah JSON menjadi object ContactModel
  factory ContactModel.fromJson(Map<String, dynamic> json) => ContactModel(
    id: json["id"],
    name: json["name"],
    phone: json["phone"],
  );

  //Mengubah Map menjadi JSON
  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "phone": phone,
  };
}
