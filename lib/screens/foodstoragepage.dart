// ignore_for_file: prefer_const_constructors_in_immutables, avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';

class FoodStoragePage extends StatelessWidget {
  FoodStoragePage({Key? key}) : super(key: key);

  static const routename = 'Food Storage';

  @override
  Widget build(BuildContext context) {
    print('${FoodStoragePage.routename} built');
    return Scaffold(
      appBar: AppBar(
        title: const Text(FoodStoragePage.routename),
      ),
      body: const Center(
          child: Text('Storage Page'),
        ),
    );
  } //build

} //FoodStorage