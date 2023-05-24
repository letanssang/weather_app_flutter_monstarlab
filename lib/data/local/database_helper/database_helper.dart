import 'package:sqflite/sqflite.dart';

import '../../../domain/entities/city.dart';

abstract class DatabaseHelper {
  Future<Database> get database;
  Future<List<City>> getCitiesFromSearch(String query);
}
