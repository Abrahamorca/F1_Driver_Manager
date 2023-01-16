import 'dart:io';
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../models/driver_model.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database?> get database async {
    // If database exists, return database
    if (_database != null) return _database;

    // If database don't exists, create one
    _database = await initDB();

    return _database;
  }

  // Create the database and the Driver table
  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'driver.db');

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE Driver('
          'name TEXT,'
          'age TEXT,'
          'wins TEXT,'
          'id TEXT'
          ')');
    });
  }

  // Insert Driver on database
  createEmployee(Driver newDriver) async {
    await deleteAllEmployees();
    final db = await database;
    final res = await db?.insert('Driver', newDriver.toJson());

    return res;
  }

  // Delete all Drivers
  Future<int?> deleteAllEmployees() async {
    final db = await database;
    final res = await db?.rawDelete('DELETE FROM Driver');

    return res;
  }

  Future<List<Driver?>> getAllDrivers() async {
    final db = await database;
    final res = await db?.rawQuery("SELECT * FROM Driver");

    List<Driver> list = res!.isNotEmpty ? res.map((c) => Driver.fromJson(c)).toList() : [];

    return list;
  }
}
