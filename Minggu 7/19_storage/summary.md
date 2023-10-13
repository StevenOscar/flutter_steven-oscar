# Summary/Resume Minggu 7 (Storage)

## Poin Pertama

Materi pada Minggu 7 pertemuan 3 membahas tentang Storage. Secara umum, Storage merupakan tempat penyimpanan data. Dengan menggunakan storage, maka data yang sudah diinput pada aplikasi tidak akan hilang ketika aplikasi tersebut di restart.

Pada materi ini, dijelaskan mengenai penggunaan local storage, yaitu storage yang terletak pada device itu sendiri.
Local storage lebih baik digunakan dibanding remote storage ketika pada saat ingin meningkatkan efisiensi penggunaan data internet dan juga karena lebih mudah di setup.

Dalam Flutter, local storage yang biasa digunakan adalah :

- Shared Preferences
- Local Database SQLite

## Poin Kedua

### Shared Preferences

Shared Preferences merupakan penyimpanan data lokal di Flutter untuk menyimpan dan mengambil data yang sederhana dalam bentuk map (menggunakan key-value). Shared Preferences dapat menyimpan data dalam bentuk String, double, dan boolean.

Shared Preferences biasanya hanya digunakan untuk menyimpan data preferensi user, history user, data login, token,dsb.

### Cara Menggunakan Shared Preferences

1. Menambahkan Package shared_preferences di pubspec.yaml pada bagian dependencies, setelah itu lakukan `flutter pub get`

    ```yaml
    dependencies:
      flutter:
        sdk: flutter
      shared_preferences: ^2.2.2
    ```

2. Mengimport Package shared_preferences pada semua file yang akan menggunakan Shared Preference

    ```dart
    import 'package:provider/provider.dart';
    ```

3. Inisialisasi shared_preferences dengan cara memanggil fungsi SharedPreferences.getInstace pada fungsi async (dilakukan pada setiap fungsi yang membutuhkan shared_preferences)

    ```dart
    SharedPreferences prefs = await SharedPreferences.getInstance();
    ```

4. Gunakan Shared Preference sesuai kebutuhan (get untuk menambil nilai, set untuk menyimpan nilai, dan remove untuk menghapus nilai)

    ```dart
    //Contoh set
    Future<void> saveUserCredential ({required String tokenValue, required String usernameValue}) async {
      SharedPreferences sharedPref = await SharedPreferences.getInstance();
      sharedPref.setString("token", tokenValue);
      sharedPref.setString("username", usernameValue);
    }

    //Contoh remove
    Future<void> removeUserCredential () async {
      SharedPreferences sharedPref = await SharedPreferences.getInstance();
      sharedPref.remove("token");
      sharedPref.remove("username");
    }

    //Contoh get
    Future<Map<String, String>> getUserCredential () async {
      SharedPreferences sharedPref = await SharedPreferences.getInstance();
      Map<String, String> userCredentialMap = {};

      userCredentialMap["token"] = sharedPref.getString("token") ?? "";
      userCredentialMap["username"] =sharedPref.getString("username") ?? "";

      return userCredentialMap;
    }

    // Fungsi tersebut dapat dipanggil pada halaman yang membutuhkan data shared_preferences tersebut
    ```

## Poin Ketiga

### Local Database SQLite

SQLite adalah database relasional yang dapat menyimpan dan mengambil data dalam jumlah besar pada local device. SQLite menggunakan bahasa SQL yang dapat mendukung CREATE, INSERT, UPDATE, dan DELETE data. SQLite bersifat private dan dapat digunakan dengan mengimport package `sqflite`.

#### Cara Menggunakan SQLite

1. Menambahkan Package sqlite di pubspec.yaml pada bagian dependencies, setelah itu lakukan `flutter pub get`

    ```yaml
    dependencies:
      flutter:
        sdk: flutter
      sqflite: ^2.3.0
    ```

2. Membuat Helper Database untuk menghubungkan aplikasi dengan database

    ```dart
    class DatabaseHelper {
      static DatabaseHelper? _databaseHelper;
      final String _tableName = "Contact";
      static late Database _database;

      DatabaseHelper._internal(){
        _databaseHelper = this;
      }

      factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._internal();

      Future<Database> get database async {
        _database = await _initializeDb();
        return _database;
      }

      Future<Database> _initializeDb() async {
        var db = openDatabase(
          join(await getDatabasesPath(), 'contact_db.db'),
          onCreate: (db,version) async {
            return db.execute(
              ''' CREATE TABLE $_tableName(
                id INTEGER PRIMARY KEY,
                name TEXT,
                number TEXT,
                file_name TEXT,
                file_path TEXT,
                file_size INTEGER,
                birth_date TEXT,
                profile_border_color INTEGER
              )
              '''
            );
          },
          version: 1
        );
        return db;
      }
    }
    ```

3. Membuat Model untuk menampung data dari database

    ```dart
    import 'package:file_picker/file_picker.dart';
    import 'dart:ui';

    class ContactModel {
      late int id;
      late String name;
      late String number;
      late PlatformFile? profilePicture;
      late DateTime birthDate;
      late Color profileBorderColor;

      ContactModel ({
        required this.id,
        required this.name,
        required this.number,
        required this.profilePicture,
        required this.birthDate,
        required this.profileBorderColor,
      });

      Map<String, dynamic> toMap(){
        return {
          'id' : id,
          'name' : name,
          'number' : number,
          'file_name' : profilePicture?.name,
          'file_path' : profilePicture?.path,
          'file_size' : profilePicture?.size,
          'birth_date' : birthDate.toString(),
          'profile_border_color' : profileBorderColor.value
        };
      }

      factory ContactModel.fromMap(Map<String,dynamic> map){
        return ContactModel(
          id : map['id'],
          name : map['name'],
          number : map['number'],
          profilePicture : map['file_name'] != null ?
            PlatformFile(
              name: 'file_name',
              path: map['file_path'],
              size: map['file_size'],
            ) : null,
          birthDate : DateTime.parse(map['birth_date']),
          profileBorderColor : Color(map['profile_border_color'])
        );
      }
    }
    ```

4. Pada database helper, definisikan aksi-aksi yang bisa dilakukan sebagai fungsi (Create, Read, Update, Delete)

    ```dart
    //create
    Future<void> addContact ({required ContactModel contactModel}) async {
      final Database db = await database;
      await db.insert(_tableName, contactModel.toMap());
    }

    //read
    Future<List<ContactModel>> getContact () async {
      final Database db = await database;
      List<Map<String, dynamic>> results = await db.query(_tableName);

      return results.map((e) => ContactModel.fromMap(e)).toList();
    }

    //update
    Future<void> updateContact({required ContactModel contactModel, required int id}) async {
      final db = await database;
      await db.update(_tableName,
        contactModel.toMap(),
        where: 'id = ?',
        whereArgs: [id]
      );
    }

    //delete
    Future<void> deleteContact({required int id}) async {
      final db = await database;
      await db.delete(_tableName,
        where: 'id = ?',
        whereArgs: [id]
      );
    }
    ```

5. Menggunakan fungsi tersebut pada page yang diinginkan

    ```dart
    //Contoh menggunakan fungsi addContact pada bloc
    on<ContactDataAddedEvent>((event, emit) async {
      int highestId = await dbHelper.getHighestId();

      await dbHelper.addContact(
        contactModel: ContactModel(
          id : highestId + 1,
          name: event.nameValue,
          number:  event.numberValue,
          profilePicture:  event.fileValue,
          birthDate:  event.dateValue,
          profileBorderColor:  event.colorValue
        )
      );

      List<ContactModel> newContactList = await dbHelper.getContact();

      return emit(
        ContactDataListFilledState(
          contactList: newContactList
        )
      );
    });
    ```
