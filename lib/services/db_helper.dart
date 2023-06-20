import 'dart:developer';

import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE note(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      title text,
      desc text,
      createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    )""");
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      "database_note.db",
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  static Future<int> createData(String title, String? desc) async {
    final db = await SQLHelper.db();

    final data = {
      'title': title,
      'desc': desc,
      'createdAt': DateFormat('yyyy-MM-dd kk:mm').format(DateTime.now())
    };
    final id = await db.insert('note', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);

    return id;
  }

  static Future<List<Map<String, dynamic>>> getData() async {
    final db = await SQLHelper.db();
    return db.query('note', orderBy: 'id');
  }

  static Future<List<Map<String, dynamic>>> getSingleData(int id) async {
    final db = await SQLHelper.db();
    return db.query('note', where: "id = ?", whereArgs: [id], limit: 1);
  }

  static Future<int> updateData(int id, String title, String? desc) async {
    final db = await SQLHelper.db();
    final data = {
      'title': title,
      'desc': desc,
      'createdAt': DateTime.now().toUtc().add(Duration(hours: 7))
    };
    final result =
        await db.update('note', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  static Future<void> deleteData(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete('data', where: "id = ?", whereArgs: [id]);
    } catch (e) {
      log("Gagal menghapus data $e");
    }
  }
}
