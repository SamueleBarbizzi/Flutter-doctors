import 'package:flutter/material.dart';
import 'package:flutter_doctors/screens/loginpage.dart';

void main() {
  runApp(const MyApp());
} //main

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        appBarTheme: AppBarTheme(color: Color.fromARGB(255, 14, 75, 16),),
      ),
      home: LoginPage(),
    );
  } //build
}//MyApp