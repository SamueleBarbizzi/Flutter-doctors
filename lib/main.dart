import 'package:flutter/material.dart';
import 'package:flutter_doctors/database/database.dart';
import 'package:flutter_doctors/models/cookbook.dart';
import 'package:flutter_doctors/models/mealchoice.dart';
import 'package:flutter_doctors/models/personalmeals.dart';
import 'package:flutter_doctors/models/groups.dart';
import 'package:flutter_doctors/provider/databaseprovider.dart';
import 'package:flutter_doctors/screens/loginpage.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final AppDatabase database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  runApp(
    MultiProvider(
      providers: [
        ListenableProvider<MealChoiche>(create: (_) => MealChoiche()),
        ListenableProvider<PersonalMeals>(create: (_) => PersonalMeals()),
        ListenableProvider<CookBook>(create: (_) => CookBook()),
        ListenableProvider<Groups>(create: (_) => Groups()),
        ChangeNotifierProvider<DatabaseProvider>(
          create: (context) => DatabaseProvider(database: database),
        ),
      ],
      child: const MyApp(),
    ),
  );
} //main

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //Here we are injecting an instance of Favorites through the widget tree. As such, the instance will be shared through the application.
    //Moreover, everyone will be able to perform action over this instance.
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        appBarTheme: const AppBarTheme(
          color: Color(0xFF00916E),
        ),
      ),
      home: const LoginPage(),
    );
  } //build
} //MyApp
