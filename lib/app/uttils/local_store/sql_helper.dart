// ignore_for_file: depend_on_referenced_packages
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqflite.dart';

import '../../core/constant.dart';
import '../../core/string.dart';

class DbHelper {
  static const dbVersion = 1;
  static Database? _database;

/*----------> For avoid the multiple class instance and this lines of
            code gives you a single private instance for global use <---------*/

  DbHelper._privateConstructor();

  static final DbHelper instance = DbHelper._privateConstructor();

/*-----------------------> For check the database availability <--------------*/

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await initDataBase();
    return _database;
  }

/*----> For database is not available then get db path and create table <-----*/

  initDataBase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, Constants.dbname);
    return await openDatabase(path, version: dbVersion, onCreate: _onCreate);
  }

/*----------------------> SQL Create Table Function <-------------------------*/

  Future _onCreate(Database db, int version) async {
    await db.execute('''  
      CREATE TABLE ${SqlTableString.profileData} (
      ${SqlTableString.dbId} INTEGER PRIMARY KEY AUTOINCREMENT,
      ${SqlTableString.dbCreatedAt} TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
      ${SqlTableString.logo} TEXT,
      ${SqlTableString.profileType} TEXT,
      ${SqlTableString.name} TEXT,
      ${SqlTableString.mobile} TEXT,
      ${SqlTableString.email} TEXT,
      ${SqlTableString.address} TEXT
      )  
      ''');

    await db.execute('''  
      CREATE TABLE ${SqlTableString.downloadedImages} (
      ${SqlTableString.dbId} INTEGER PRIMARY KEY AUTOINCREMENT,
      ${SqlTableString.dbCreatedAt} TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
      ${SqlTableString.images} TEXT
      )  
      ''');

    await db.execute('''  
      CREATE TABLE ${SqlTableString.likedImages} (
      ${SqlTableString.dbId} INTEGER PRIMARY KEY AUTOINCREMENT,
      ${SqlTableString.dbCreatedAt} TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
      ${SqlTableString.images} TEXT,
      ${SqlTableString.isPremium} TEXT
      )  
      ''');
  }

  Future<int?> insert(String tableName, Map<String, dynamic> row) async {
    Database? db = await instance.database;
    return await db?.insert(
      tableName,
      row,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  Future<int?> update({
    required String tableName,
    dynamic id,
    required Map<String, dynamic> row,
    String? columnName,
  }) async {
    Database? db = await instance.database;
    var res = await db
        ?.update(tableName, row, where: "$columnName = ?", whereArgs: [id]);
    return res;
  }

  Future<List<Map<String, dynamic>>?> queryAll(String tableName) async {
    Database? db = await instance.database;
    return await db?.query(
      tableName,
    );
  }

  Future<int?> deleteQuery(
    String tableName,
    dynamic id,
    String columnName,
  ) async {
    Database? db = await instance.database;
    try {
      var res = await db?.delete(
        tableName,
        where: "$columnName = ?",
        whereArgs: [id],
      );
      return res;
    } catch (err) {
      print(err);
      return null;
    }
  }

  Future<List<Map<String, dynamic>>?> queryAllWithOrderBy(
    String tableName,
    String columnName,
  ) async {
    Database? db = await instance.database;
    return await db?.query(tableName, orderBy: " $columnName DESC");
  }

  Future<List<Map<String, dynamic>>?> querySpecific(
    String tableName,
    dynamic id, {
    String? columnName,
  }) async {
    try {
      Database? db = await instance.database;
      var res =
          await db?.query(tableName, where: "$columnName = ?", whereArgs: [id]);
      return res;
    } catch (err) {
      print(err);
      return null;
    }
  }
}
