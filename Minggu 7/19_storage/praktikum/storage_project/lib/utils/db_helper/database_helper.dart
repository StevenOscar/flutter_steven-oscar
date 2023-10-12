import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../models/contact_model.dart';

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

  Future<void> addContact ({required ContactModel contactModel}) async {
    final Database db = await database;
    await db.insert(_tableName, contactModel.toMap());
  }

  Future<List<ContactModel>> getContact () async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.query(_tableName);

    return results.map((e) => ContactModel.fromMap(e)).toList();
  }

  Future<void> updateContact({required ContactModel contactModel, required int id}) async {
    final db = await database;
    await db.update(_tableName,
      contactModel.toMap(),
      where: 'id = ?',
      whereArgs: [id]
    );
  }

  Future<void> deleteContact({required int id}) async {
    final db = await database;
    await db.delete(_tableName,
      where: 'id = ?',
      whereArgs: [id]
    );
  }

  Future<int> getHighestId() async {
    final db = await database;
    List<Map<String, dynamic>> result = await db.rawQuery(
      'SELECT MAX(id) as maxId FROM $_tableName;'
    );

    int highestId = result.isNotEmpty ? result.first['maxId'] ?? 0 : 0;
    return highestId;
  }

}