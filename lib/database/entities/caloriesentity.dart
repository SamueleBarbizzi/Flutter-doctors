import 'package:floor/floor.dart';

@entity
class CaloriesEntity {
  @PrimaryKey(autoGenerate: true)
  final int? id; 

  final DateTime dateTime; 

  final double sumCalories;

  CaloriesEntity(this.id, this.dateTime, this.sumCalories);
  
}