// ignore_for_file: prefer_const_constructors_in_immutables, avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  InfoPage({Key? key}) : super(key: key);

  static const routename = 'Infopage';

  @override
  Widget build(BuildContext context) {
    print('${InfoPage.routename} built');
    return Scaffold(
      appBar: AppBar(
        title: const Text(InfoPage.routename),
        leading: BackButton(
            onPressed: () => Navigator.pop(context),
          ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
        padding: EdgeInsets.all(30.0),
       
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          SizedBox(height: 16.0),
            Text(
              'About FoodFitFinder',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            
          SizedBox(height: 8.0),
            Text("We excitedly present FoodFitFinder, the innovative application that is committed to combating food waste and promoting a healthy lifestyle. By taking advantage of our large collection of healthy and balanced recipes, you will be able to discover delicious dishes that satisfy your palate without compromising your health. From nutritious breakfasts to light meals, you'll always have healthy and tasty options available at any time of day. Additionally, FoodFitFinder offers you the ability to track your daily calorie consumption with our handy food diary. Record what you eat and receive detailed information on the calorie intake of your meals, allowing you to make more informed decisions and improve your eating habits over time. "),
             
              SizedBox(height: 8.0),
              Text(
              'App version',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),

               SizedBox(height: 8.0),
               Text('1.0.0'),
            
            SizedBox(height: 16.0),
            Text(
              'Developers',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 8.0),
            Text('Name: Lorenzo Capetta'),
            Text('Email: lorenzo.capetta@studenti.unipd.it'),

            SizedBox(height: 8.0),
            Text('Name: Matteo Rinaldi'),
            Text('Email: matteo.rinaldi.2@studenti.unipd.it'),
          
            SizedBox(height: 8.0),
            Text('Name: Samuele Barbizzi'),
            Text('Email: samuele.barbizzi@studenti.unipd.it'),

           SizedBox(height: 16.0),
            Text(
              'Legal information',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text('Terms of Service'),
            Text('Privacy Policy'),
          ],
        ),
        ),
      ),
      
    );
  } //build

} //InfoPage