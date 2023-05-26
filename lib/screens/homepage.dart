// ignore_for_file: depend_on_referenced_packages, library_private_types_in_public_api, avoid_print, unused_import

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter_doctors/screens/loginpage.dart';
import 'package:flutter_doctors/screens/infopage.dart';
import 'package:flutter_doctors/screens/score_circular_progress.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const routename = 'Homepage';

  @override
  Widget build(BuildContext context) {
    print('${HomePage.routename} built');
    return Scaffold(
      appBar: AppBar(
        title: const Text(HomePage.routename),
        actions: [
          IconButton(
            icon: const Icon(Icons.info),
            tooltip: 'Info',
            onPressed: () => _toInfoPage(context), //THIS HAS A BUG
          ),
        ],
      ),
        body: Container(
          child: Column( 
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 150,
                  height: 150,
                  child: CustomPaint(
                    painter: ScoreCircularProgress(
                      backColor: Color.fromARGB(255, 76, 175, 80).withOpacity(0.4),
                      frontColor: const Color.fromARGB(255, 76, 175, 80),
                      strokeWidth: 20,
                      value: 0.5, // da mettere valori 
                    ),
                    child: Align(
                        alignment: Alignment.center,
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.only(top: 40.0),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                 'num calorie', // mettere numero calorie
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Color.fromARGB(255, 76, 175, 80)),
                                ),
                                const Text(
                                  ' Not good',
                                  style: TextStyle(fontSize: 16),
                                )
                              ]),
                        ))),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(50, 50, 50, 50),
                child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        ElevatedButton.icon(
                          icon: Icon(MdiIcons.coffee),
                          label: Text('BREAKFAST'),
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(20.0), backgroundColor: Colors.green,
                            fixedSize: Size(250, 60),
                            textStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                            elevation: 15,
                            shadowColor: Colors.green,
                            shape: StadiumBorder()
                          ),
                        ) 
                      ],
                    ),
                    Row(
                      children: [
                        ElevatedButton.icon(
                          icon: Icon(MdiIcons.whiteBalanceSunny),
                          label: Text('LUNCH'),
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(20.0), backgroundColor: Colors.green,
                            fixedSize: Size(250, 60),
                            textStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                            elevation: 15,
                            shadowColor: Colors.green,
                            shape: StadiumBorder()
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [                
                        ElevatedButton.icon(
                          icon: Icon(MdiIcons.moonWaningCrescent),
                          label: Text('DINNER'),
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(20.0), backgroundColor: Colors.green,
                            fixedSize: Size(250, 60),
                            textStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                            elevation: 15,
                            shadowColor: Colors.green,
                            shape: StadiumBorder()
                          ),
                        )
                        //_buildForm(context)
                      ],
                    ),
                  ], 
                ),
              )
            ],
          ),
        ),
    );
  } //build

  void _toInfoPage(BuildContext context){
    //Then pop the HomePage
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => InfoPage()));
  }//_toInfoPage

} //HomePage
