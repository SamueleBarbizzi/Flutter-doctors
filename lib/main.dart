import 'package:flutter/material.dart';
import 'package:flutter_doctors/models/favorites.dart';
import 'package:flutter_doctors/models/mealchoice.dart';
import 'package:flutter_doctors/screens/loginpage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
} //main

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //Here we are injecting an instance of Favorites through the widget tree. As such, the instance will be shared through the application.
    //Moreover, everyone will be able to perform action over this instance. 
  return MultiProvider(
    providers: [
    Provider<Favorites>(create: (context) => Favorites()),
    Provider<MealChoiche>(create: (_) => MealChoiche()),
  ],
      child: MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        appBarTheme: const AppBarTheme(color: Color.fromARGB(255, 14, 75, 16),),
      ),
      home: const LoginPage(),)
    );
  } //build
}//MyApp