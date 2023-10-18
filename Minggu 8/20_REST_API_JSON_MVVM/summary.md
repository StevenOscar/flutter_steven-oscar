# Summary/Resume Minggu 8 (REST API JSON & MVVM Architecture)

## Poin Pertama

Materi pada Minggu 8 pertemuan 1 membahas tentang REST API JSON Serialization & Deserialization. REST API (Representational State Transfer Application Programming Interface) merupakan arsitektur komunikasi antar program yang dapat memisahkan tampilan dengan proses bisnis. Bagian tampilan yang dimiliki oleh Client dan proses Bisnis yang dimiliki oleh Server dapat saling mengirim data melalui HTTP Request dengan berbagai Method (Umumnya GET, POST, PUT, DELETE).

### HTTP (Hypertext Transfer Protocol)

HTTP merupakan Protokol komunikasi yang paling banyak digunakan untuk mengirim data melalui internet/World Wide Web.

Pola Komunikasi HTTP dimulai dengan Client yang mengirim sebuah request, lalu Server menerima,mengolah, dan membalas request tersebut dengan memberikan Response.

#### Struktur Request HTTP

Struktur Request HTTP terdiri dari :

- URL (Uniform Resource Locator)

  Merupakan Alamat dari Resource yang ingin diakses. URL terdiri dari beberapa elemen, yaitu protokol (seperti http:// atau https://), nama domain server, dan path resource di server. Contoh : `https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts/2`
- Method

  Method merupakan Aksi/operasi yang ingin dilakukan pada resource yang sudah ditunjuk oleh URL. Contoh Method : GET, POST, PUT, DELETE
- Header

  Header HTTP merupakan informasi tambahan terkait request, seperti tipe konten yang dikirim, informasi Client/Server, dan lain-lain. Header biasanya berbentuk Map
- Body

  Body adalah bagian data yang disertakan pada request HTTP, terutama pada method seperti POST dan PUT. Isi dari body bisa berupa text, JSON, XML, dan format lainnnya.

#### Struktur Response HTTP

Struktur Response HTTP terdiri dari :

- Status Code

  Status Code merupakan informasi tentang Request yang dikirim oleh Client. Status code berfungsi untuk memberi tahu apakah Request berhasil, gagal, membutuhkan langkah lain, dsb. Kategori Status Code terdiri dari :

  - Informational responses (100 – 199)
  - Successful responses (200 – 299)
  - Redirection messages (300 – 399)
  - Client error responses (400 – 499)
  - Server error responses (500 – 599)
- Header
  Sama seperti pada struktur reqest, Header HTTP merupakan informasi tambahan terkait response, seperti tipe konten yang dikirim, informasi Client/Server, dan lain-lain.
- Body
  Body pada HTTP Response merupakan data yang dikirim oleh Server sebagai response terhadap permintaan Client. Sama seperti pada request, isi dari body bisa berupa text, JSON, XML, dan format lainnnya.

#### HTTP Methods

HTTP Method yang umum digunakan :

- GET

  Merupakan Method yang digunakan untuk mengambil/fetch data dari Server.
- POST

  Merupakan Method yang digunakan untuk mengirim data ke Server. Method ini digunakan untuk membuat resource baru di server.
- PUT

  Merupakan Method yang digunakan untuk memperbaharui/mengedit data yang sudah ada di server. PUT juga bisa digunakan untuk membuat resource baru apabila data yang ingin diedit belum ada.
- DELETE

  Merupakan Method yang digunakan untuk menghapus resource yang ada di server.

## Poin Kedua

### dio

Dio adalah sebuah package dari flutter yang digunakan untuk melakukan REST API sebagai HTTP Client. Dio menyediakan Method-method HTTP yang bisa digunakan dalam pembuatan aplikasi.

Contoh dio :

```dart
import 'package:dio/dio.dart';

//GET dio
void fetchData() async {
  try {
    Response response = await dio().get('https://api.example.com/data');
    print('GET Response data: ${response.data}');
  } catch (e) {
    print('GET Error: $e');
  }
}

//POST dio
void sendData() async {
  try {
    Response response = await dio().post(
      'https://api.example.com/create',
      data: {'name': 'John Doe', 'age': 30},
    );
    print('POST Response data: ${response.data}');
  } catch (e) {
    print('POST Error: $e');
  }
}

//PUT dio
void updateData() async {
  try {
    Response response = await dio().put(
      'https://api.example.com/update/123',
      data: {'name': 'Updated Name', 'age': 35},
    );
    print('PUT Response data: ${response.data}');
  } catch (e) {
    print('PUT Error: $e');
  }
}

//DELETE dio
void deleteData() async {
  try {
    Response response = await dio().delete('https://api.example.com/delete/123');
    print('DELETE Response data: ${response.data}');
  } catch (e) {
    print('DELETE Error: $e');
  }
}
```

#### Cara Menggunakan dio

1. Menambahkan Package dio di pubspec.yaml pada bagian dependencies, setelah itu lakukan `flutter pub get`

    ```yaml
    dependencies:
      flutter:
        sdk: flutter
      cupertino_icons: ^1.0.2
      dio: ^5.3.3
    ```

2. Mengimport Package dio pada semua file yang akan menggunakan dio

    ```dart
    import 'package:dio/dio.dart';
    ```

3. Mendefinisikan fungsi-fungsi yang akan digunakan untuk melakukan HTTP Request (Contoh fungsi-fungsinya ada pada penjelasan bagian sebelumnya)

4. Memanggil fungsi tersebut pada bagian aplikasi yang membutuhkannya (Contoh : memanggil fungsi ketika button ditekan)

    ```dart
    ElevatedButton(
      onPressed: () {
        fetchData();
      },
      child: Text('Fetch Data'),
    ),
    ```

### Serialisasi JSON

Serialisasi JSON merupakan cara mengubah data dari bentuk Map/list menjadi bentuk JSON. Hal ini dimaksudkan agar dapat mengirimkan data tersebut ke API melalui request body. Serialisasi JSON dapat digunakan dengan memasukkan map sebagai parameter fungsi jsonEncode.

```dart
import 'dart:convert';

void main() {
  Map<String, dynamic> user = {
    'id': 1,
    'name': 'John Doe',
    'email': 'john.doe@example.com',
  };

  String jsonUser = jsonEncode(user);

  print('Encoded JSON:');
  print(jsonUser);
}
```

### Deserialisasi JSON

Deserialisasi JSON merupakan cara untuk mengubah data dari bentuk JSON menjadi bentuk Map/List. Deserialisasi JSON ini umumnya digunakan ketika mendapatkan response data dari server. Deserialisasi JSON dapat digunakan dengan memasukkan data JSON sebagai parameter fungsi jsonDecode.

```dart
import 'dart:convert';

void main() {
  String jsonString = '{"id":1,"name":"John Doe","email":"john.doe@example.com"}';

  Map<String, dynamic> decodedUser = jsonDecode(jsonString);

  print('Decoded User:');
  print('ID: ${decodedUser['id']}');
  print('Name: ${decodedUser['name']}');
  print('Email: ${decodedUser['email']}');
}
```

## Poin Ketiga

### MVVM Architecture (Model - View - ViewModel)

Materi pada Minggu 8 pertemuan 2 membahas tentang MVVM Architecture. MVVM Architecture adalah cara untuk mengatur directory aplikasi dan susunan code agar lebih terstruktur. MVVM dilakukan dengan memisahkan logic aplikasi dengan tampilannya(view) ke dalam ViewModel.

#### Keuntungan menggunakan MVVM

1. Reusability

   Hal ini dikarenakan bila ada tampilan/view yang memerlukan alur logic yang sama, maka mereka juga bisa menggunakan ViewModel yang sama.

2. Maintainability

   Dengan menggunakan MVVM, maka aplikasi lebih mudah untuk dirawat karena code untuk tampilan, tidak tertumpuk bersama logicnya.

3. Testability

   Aplikasi menjadi lebih mudah di test karena pengujian logic dan pengujian tampilan dapat dipisahkan sehingga dapat meningkatkan produktivitas.

#### Cara Mengimplementasikan MVVM

1. Mengatur Struktur Directory

    ```cmd
    lib/
    |-- models/
    |   |-- api/
    |   |   |-- user_api.dart
    |   |-- user_model.dart
    |-- screen/
    |   |-- user/
    |   |   |-- user_screen.dart
    |___|___|-- user_view_model.dart
    ```

2. Membuat Model dan Model API

    ```dart
    // user_model.dart
    class UserModel {
      final int id;
      final String name;
      final String email;

      UserModel({
        required this.id, required this.name, required this.email
      });

      factory UserModel.fromJson(Map<String, dynamic> json) {
        return UserModel(
          id: json['id'],
          name: json['name'],
          email: json['email'],
        );
      }
    }

    // user_api.dart
    import 'dart:convert';
    import 'package:dio/dio.dart';

    class UserApi {
      static Future<List<Map<String, dynamic>>> getUsers() async {
        final response = await dio().get('https://api.example.com/users');

        if (response.statusCode == 200) {
          List<dynamic> data = jsonDecode(response.body);
          return data.cast<Map<String, dynamic>>();
        } else {
          throw Exception('Failed to load users');
        }
      }
    }

    ```

3. Membuat ViewModel (bisa menggunakan state management)

    ```dart
    // user_view_model.dart
    // contoh menggunakan Provider (Bagian dari menggunakan provider lainnya di skip karena sudah dijelaskan pada summary minggu sebelumnya)
    import 'package:flutter/material.dart';
    import 'package:your_app/models/user_model.dart';
    import 'package:your_app/models/user_api.dart';

    class UserViewModel extends ChangeNotifier {
      List<UserModel> _users = [];
      List<UserModel> get users => _users;

      Future<void> fetchUsers() async {
        try {
          List<Map<String, dynamic>> userData = await UserApi.getUsers();
          _users = userData.map((user) => UserModel.fromJson(user)).toList();
          notifyListeners();
        } catch (e) {
          print('Error fetching users: $e');
        }
      }
    }
    ```

4. Membuat View dan menampilkan data yang sudah diproses pada ViewModel

    ```dart
    // user_screen.dart
    import 'package:flutter/material.dart';
    import 'package:provider/provider.dart';
    import 'package:your_app/viewmodels/user_viewmodel.dart';

    class UserView extends StatelessWidget {
      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text('User List'),
          ),
          body: Consumer<UserViewModel>(
            builder: (context, model, child) {
              if (model.users.isEmpty) {
                return Center(child: CircularProgressIndicator());
              } else {
                return ListView.builder(
                  itemCount: model.users.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(model.users[index].name),
                      subtitle: Text(model.users[index].email),
                    );
                  },
                );
              }
            },
          ),
        );
      }
    }
    ```
