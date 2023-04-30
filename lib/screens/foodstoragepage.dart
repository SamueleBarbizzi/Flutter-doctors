// ignore_for_file: prefer_const_constructors_in_immutables, avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_doctors/screens/infopage.dart';

class FoodStoragePage extends StatelessWidget {
  FoodStoragePage({Key? key}) : super(key: key);

  static const routename = 'Food Storage';

  @override
  Widget build(BuildContext context) {
    print('${FoodStoragePage.routename} built');
    return Scaffold(
      appBar: AppBar(
        title: const Text(FoodStoragePage.routename),
        actions: [
          IconButton(
            icon: const Icon(Icons.info),
            tooltip: 'Info',
            onPressed: () => _toInfoPage(context),
          ),
        ],
      ),
      body: const Center(
          child: Text('Storage Page'),
        ),
    );
  } //build

  void _toInfoPage(BuildContext context){
    //Then pop the FoodStoragePage
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => InfoPage()));
  }//_toInfoPage

} //FoodStorage