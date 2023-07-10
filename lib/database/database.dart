//Imports that are necessary to the code generator of floor
// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'package:floor/floor.dart';
import 'package:flutter_doctors/database/typeconverters/datetimeconverter.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

//Here, we are importing the entities and the daos of the database
import 'daos/caloriesdaos.dart';
import 'entities/caloriesentity.dart';

//The generated code will be in database.g.dart
part 'database.g.dart';

//Here we are saying that this is the first version of the Database and it has just 1 entity, i.e., CaloriesEntity
@TypeConverters([DateTimeConverter])
@Database(version: 1, entities: [CaloriesEntity])
abstract class AppDatabase extends FloorDatabase {
  //Add all the daos as getters here
  CaloriesDao get caloriesDao;

  /* Future<void> deleteDatabase(String path) async {
   await sqflite.deleteDatabase(path);
  } */
}
