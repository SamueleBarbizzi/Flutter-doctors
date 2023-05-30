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
        title: const Text(HomePage.routename, 
        style: const TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.info),
            tooltip: 'Info',
            onPressed: () => _toInfoPage(context), //THIS HAS A BUG
          ),
        ],
      ),
        body: 
          Column( 
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container( height: 40, alignment: Alignment(-0.63, 0.5),
                child:  Text("CALORIES",
                  style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color.fromARGB(255, 76, 175, 80))
                )
              ),
              Container( height: 20, alignment: Alignment(-0.49,0),
                child: Text("Remaining = Target - Food + Exercise",
                  style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black)
                )
              ),
              SizedBox(height: 15),
              Row( mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Align( alignment: Alignment(0,0),
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
                    child: Center( 
                      child: Padding(
                        padding: const EdgeInsets.only(top: 35.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('2481', // mettere numero calorie con dati
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 26,
                                color: Color.fromARGB(255, 76, 175, 80)),
                            ),
                            const Text('Remaining', style: TextStyle(fontSize: 14),)
                          ]
                        ),
                      )
                    )
                  ),
                )),
                
                SizedBox(width: 30, height: 150),

                Align( alignment: Alignment(1,0),
                child: SizedBox(
                  width: 150,
                  height: 150,
                child: Column( crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                  Row(
                    children: [
                    Icon(MdiIcons.bullseyeArrow, color: Colors.red),
                    Text("Base Target   ",
                      style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black)
                    ),
                    Text("2387",
                      style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.black)
                    ), // inserire dati aggiornati
                  ],),
                  Row(
                    children: [
                    Icon(MdiIcons.silverwareForkKnife, color: Colors.blue),
                    Text("Food   ",
                      style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black)
                    ),
                    Text("1099",
                      style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.black)
                    ), // inserire dati aggiornati
                  ],),
                  Row(
                    children: [
                    Icon(MdiIcons.fire, color: Colors.orange),
                    Text("Exercise   ",
                      style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black)
                    ),
                    Text("503",
                      style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.black)
                    ), // inserire dati aggiornati
                  ],)
                ],),)),
              ],),

              Container( height: 30, alignment: Alignment(-0.2,-1),
                child: Text("Cick on the meal to select a recipe ",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black)),
              ),

              Container( height: 250,
                  padding: EdgeInsets.only(left: 115),
                  //alignment: Alignment(0,0),
                  child: Column( crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Icon(MdiIcons.coffee, color: Colors.grey, size: 35),
                          SizedBox(width: 20, height: 40),
                          ElevatedButton(
                            //icon: Icon(MdiIcons.coffee),
                            //label: Text('BREAKFAST'),
                            child: Text('BREAKFAST'),
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              //padding: EdgeInsets.fromLTRB(0, 20, 20, 20), 
                              backgroundColor: Colors.lightGreen,
                              fixedSize: Size(200, 40),
                              textStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 14, 75, 16)),
                              elevation: 15,
                              shadowColor: Color.fromARGB(255, 14, 75, 16),
                              shape: StadiumBorder(),
                              side: BorderSide(color: Color.fromARGB(255, 14, 75, 16), width: 2.5)
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Icon(Icons.add_circle, color: Colors.lightGreen, size: 35),
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              //padding: EdgeInsets.all(15),
                              backgroundColor: Color.fromARGB(255, 14, 75, 16),
                              shadowColor: Color.fromARGB(255, 14, 75, 16),                            
                            ),
                          ) 
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          ElevatedButton.icon(
                            icon: Icon(MdiIcons.whiteBalanceSunny),
                            label: Text('LUNCH'),
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              //padding: EdgeInsets.fromLTRB(0, 20, 50, 20), 
                              backgroundColor: Colors.lightGreen,
                              fixedSize: Size(220, 40),
                              textStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                              elevation: 15,
                              shadowColor:  Color.fromARGB(255, 14, 75, 16),
                              shape: StadiumBorder(),
                              side: BorderSide(color: Color.fromARGB(255, 14, 75, 16), width: 2.5)
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [                
                          ElevatedButton.icon(
                            icon: Icon(MdiIcons.moonWaningCrescent),
                            label: Text('DINNER'),
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              //padding: EdgeInsets.all(20.0), 
                              backgroundColor:  Colors.lightGreen,
                              fixedSize: Size(220, 40),
                              textStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                              elevation: 15,
                              shadowColor:  Color.fromARGB(255, 14, 75, 16),                                
                              shape: StadiumBorder(),
                              side: BorderSide(color: Color.fromARGB(255, 14, 75, 16), width: 2.5)
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          ElevatedButton.icon(
                            icon: Icon(MdiIcons.foodApple),
                            label: Text('SNACK'),
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              //padding: EdgeInsets.fromLTRB(0, 20, 50, 20), 
                              backgroundColor:  Colors.lightGreen,
                              fixedSize: Size(220, 40),
                              textStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                              elevation: 15,
                              shadowColor:  Color.fromARGB(255, 14, 75, 16),
                              shape: StadiumBorder(),
                              side: BorderSide(color: Color.fromARGB(255, 14, 75, 16), width: 2.5)
                            ),
                          )
                        ],
                      ),
                    ], 
                  ),
                ),
              //),
            ],
          ),
      );
  } //build

  void _toInfoPage(BuildContext context){
    //Then pop the HomePage
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => InfoPage()));
  }//_toInfoPage

} //HomePage
