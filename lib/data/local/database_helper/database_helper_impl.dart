import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:weather_app_flutter_monstarlab/domain/entities/city.dart';

import 'database_helper.dart';

class DatabaseHelperImpl implements DatabaseHelper {
  static final DatabaseHelperImpl _instance = DatabaseHelperImpl.internal();

  factory DatabaseHelperImpl() => _instance;
  static Database? _database;

  @override
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDb();
    return _database!;
  }

  DatabaseHelperImpl.internal();

  Future<Database> _initDb() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'weather.db');
    ByteData data = await rootBundle.load('assets/database/weather.db');
    List<int> bytes =
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    await File(path).writeAsBytes(bytes);
    var db = await openDatabase(path);
    return db;
  }

  @override
  Future<List<City>> getCitiesFromSearch(String query) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.rawQuery(
      "SELECT * FROM cities WHERE city_name LIKE ? || '%' AND city_id IS NOT NULL AND country_full IS NOT NULL LIMIT 10",
      [query],
    );

    return List.generate(maps.length, (index) {
      return City(
        maps[index]['city_id'] as int,
        maps[index]['city_name'] as String,
        maps[index]['country_full'] as String,
      );
    });
  }
}
