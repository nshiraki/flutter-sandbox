import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'note.dart';

/// DBのヘルパークラス
class DatabaseHelper {
  // DBのファイル名
  static const String _databaseFileName = 'notepad.db';
  // テーブル名
  static const String _table = 'notes';
  // DBのバージョン
  static const int _version = 1;

  /// DBを取得する
  static Future<sqflite.Database> _getWritableDatabase() async {
    // DBのpathを取得
    final path = join(await sqflite.getDatabasesPath(), _databaseFileName);

    return sqflite.openDatabase(
      path,
      version: _version,
      onCreate: (sqflite.Database db, int version) async {
        await db.execute(
          'CREATE TABLE IF NOT EXISTS notes ('
          '  id INTEGER PRIMARY KEY AUTOINCREMENT,'
          '  title TEXT,'
          '  text TEXT'
          ')',
        );
      },
    );
  }

  /// データを全件取得する
  static Future<List<Note>> getItems() async {
    final db = await DatabaseHelper._getWritableDatabase();

    final List<Map<String, dynamic>> maps = await db.query(_table);

    // List<Note>に変換して返却
    return List.generate(maps.length, (i) {
      return Note(
        id: maps[i]['id'],
        title: maps[i]['title'],
        text: maps[i]['text'],
      );
    });
  }

  /// idと一致するデータを1件取得する
  static Future<List<Note>> getItem(int id) async {
    final db = await DatabaseHelper._getWritableDatabase();

    final List<Map<String, dynamic>> maps = await db.query(
      _table,
      where: "id = ?",
      whereArgs: [id], // "?"に代入する値
      limit: 1, // 取得件数
    );

    // List<Note>に変換して返却
    return List.generate(maps.length, (i) {
      return Note(
        id: maps[i]['id'],
        title: maps[i]['title'],
        text: maps[i]['text'],
      );
    });
  }

  /// データを追加する
  static Future<int> insertItem(String title, String? text) async {
    final db = await DatabaseHelper._getWritableDatabase();

    final item = {'title': title, 'text': text};
    final id = await db.insert(_table, item,
        conflictAlgorithm: sqflite.ConflictAlgorithm.replace);
    return id;
  }

  /// idと一致するデータを更新する
  static Future<int> updateItem(int id, String title, String? text) async {
    final db = await DatabaseHelper._getWritableDatabase();

    final data = {'title': title, 'text': text};
    final result = await db.update(
      _table,
      data,
      where: "id = ?",
      whereArgs: [id], // "?"に代入する値
    );
    return result;
  }

  /// idと一致するデータを削除する
  static Future<void> deleteItem(int id) async {
    final db = await DatabaseHelper._getWritableDatabase();

    await db.delete(
      _table,
      where: "id = ?",
      whereArgs: [id], // "?"に代入する値
    );
  }
}
