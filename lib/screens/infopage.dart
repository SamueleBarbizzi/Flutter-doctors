// ignore_for_file: prefer_const_constructors_in_immutables, avoid_print, prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InfoPage extends StatelessWidget {
  InfoPage({Key? key}) : super(key: key);

  static const routename = 'About app';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(InfoPage.routename, style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: BackButton(
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Color(0xFF5AAA95).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Color(0xFF5AAA95).withOpacity(0.2), width: 1),
                    ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/logo_icon.svg',
                              height: 40,
                              width: 40,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'FoodFitFinder',
                              style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Text(
                          "We excitedly present FoodFitFinder, the innovative application that is committed to combating food waste and promoting a healthy lifestyle. By taking advantage of our large collection of healthy and balanced recipes, you will be able to discover delicious dishes that satisfy your palate without compromising your health. From nutritious breakfasts to light meals, you'll always have healthy and tasty options available at any time of day. Additionally, FoodFitFinder offers you the ability to track your daily calorie consumption with our handy food diary. Record what you eat and receive detailed information on the calorie intake of your meals, allowing you to make more informed decisions and improve your eating habits over time. ",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Color(0xFF5AAA95).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Color(0xFF5AAA95).withOpacity(0.2), width: 1),
                    ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/version_icon.svg',
                              height: 40,
                              width: 40,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'App version',
                              style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Text(
                          "1.0.0",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Color(0xFF5AAA95).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Color(0xFF5AAA95).withOpacity(0.2), width: 1),
                    ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/developers_icon.svg',
                              height: 40,
                              width: 40,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Developers',
                              style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Text('Name: Lorenzo Capetta',
                          style: TextStyle(fontSize: 16),),
              Text('Email: lorenzo.capetta@studenti.unipd.it',
                          style: TextStyle(fontSize: 16),),
              SizedBox(height: 8.0),
              Text('Name: Matteo Rinaldi',
                          style: TextStyle(fontSize: 16),),
              Text('Email: matteo.rinaldi.2@studenti.unipd.it',
                          style: TextStyle(fontSize: 16),),
              SizedBox(height: 8.0),
              Text('Name: Samuele Barbizzi',
                          style: TextStyle(fontSize: 16),),
              Text('Email: samuele.barbizzi@studenti.unipd.it',
                          style: TextStyle(fontSize: 16),),
              SizedBox(height: 8.0),
              Text('Name: Christian Dragonetti',
                          style: TextStyle(fontSize: 16),),
              Text('Email: christian.dragonetti@studenti.unipd.it',
                          style: TextStyle(fontSize: 16),),
                      ],
                    ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Color(0xFF5AAA95).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Color(0xFF5AAA95).withOpacity(0.2), width: 1),
                    ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/legal_info_icon.svg',
                              height: 40,
                              width: 40,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Legal Info',
                              style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Terms of Service\nPrivacy Policy",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    ),
                  ),
                ),
              ),
            ],
          ),
      ),
    );
  } //build
} //InfoPage