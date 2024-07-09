import 'package:cor/data/model/dixaniya_model.dart';
import 'package:cor/data/model/network_response.dart';
import 'package:path/path.dart';
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabase {
  static final databaseInstance = LocalDatabase._();

  LocalDatabase._();

  factory LocalDatabase() {
    return databaseInstance;
  }

  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _init("notification.db");
      return _database!;
    }
  }

  Future<Database> _init(String databaseName) async {
    String internalPath = await getDatabasesPath();
    String path = join(internalPath, databaseName);
    return await openDatabase(
      path,
      version: 2,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';

    await db.execute('''
      CREATE TABLE ${DixaniyaConstants.tableName} (
        ${DixaniyaConstants.id} $idType,
        ${DixaniyaConstants.title} $textType,
        ${DixaniyaConstants.createdAt} $textType
      )
    ''');
  }

  static Future<DixaniyaModel> insertDixaniyaResultat(
      DixaniyaModel notificationModel) async {
    try {
      final db = await databaseInstance.database;
      int savedTaskId = await db.insert(
          DixaniyaConstants.tableName, notificationModel.toJson());
      debugPrint("saved id:$savedTaskId");
      return notificationModel.copyWith(id: savedTaskId);
    } catch (error) {
      debugPrint("Error inserting notification: $error");
      rethrow; // Optionally, handle the error or rethrow it
    }
  }

  static Future<NetworkResponse> getAllDixaniyaResultat() async {
    NetworkResponse networkResponse = NetworkResponse();

    try {
      final db = await databaseInstance.database;
      String orderBy = "${DixaniyaConstants.id} DESC";
      List<Map<String, dynamic>> json = await db
          .query(DixaniyaConstants.tableName, orderBy: orderBy);
      networkResponse.data =
          json.map((e) => DixaniyaModel.fromJson(e)).toList();
    } catch (error) {
      networkResponse.errorText = error.toString();
    }
    return networkResponse;
  }


  static Future<int> deleteNotification(int id) async {
    final db = await databaseInstance.database;
    int deletedId = await db.delete(
      DixaniyaConstants.tableName,
      where: "${DixaniyaConstants.id} = ?",
      whereArgs: [id],
    );
    return deletedId;
  }
}

class DixaniyaConstants {
  static const String tableName = 'resultat_dixaniya';
  static const String title = 'title';
  static const String createdAt = 'createdAt';
  static const String id = '_id';
}
