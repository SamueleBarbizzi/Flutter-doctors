import 'package:flutter/material.dart';
import 'package:flutter_doctors/database/entities/caloriesentity.dart';
import 'package:flutter_doctors/provider/databaseprovider.dart';
import 'package:provider/provider.dart';

class DatabaseCall {

  static Future<void> saveData(BuildContext context, List<List<dynamic>> arraySumCalories, bool firstDatabaseEntry) async {
    for (int k = 0; k < arraySumCalories.length; k++) {
      if (firstDatabaseEntry == true) {
        await Provider.of<DatabaseProvider>(context, listen: false).insertCalories(CaloriesEntity(null, arraySumCalories[k][0], arraySumCalories[k][1]));
      } else {
        await Provider.of<DatabaseProvider>(context, listen: false).updateCalories(CaloriesEntity(null, arraySumCalories[k][0], arraySumCalories[k][1]));
      }
    }
  }

  static Future<void> deleteAll(BuildContext context) async{ 
    await Provider.of<DatabaseProvider>(context, listen: false).deleteAllCalories();
  }

}