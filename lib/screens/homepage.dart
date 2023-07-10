// ignore_for_file: depend_on_referenced_packages, library_private_types_in_public_api, avoid_print, unused_import, unused_element, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter_doctors/screens/loginpage.dart';
import 'package:flutter_doctors/screens/infopage.dart';
import 'package:flutter_doctors/models/score_circular_progress.dart';
import 'package:flutter_doctors/screens/ingredientspage.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_doctors/database/entities/caloriesentity.dart';
import 'package:flutter_doctors/provider/databaseprovider.dart';
import 'package:flutter_doctors/screens/recipepage.dart';

class HomePage extends StatefulWidget {
  final bool firstDatabaseEntry;
  const HomePage({super.key, required this.firstDatabaseEntry});

  static const routename = 'Homepage';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int i = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    selectedIndex();
  }

  Future<void> selectedIndex() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    i = sp.getInt('selectedIndex') ?? 0;
  }

  List<CaloriesEntity> fetchedData = [];

  Future<List<CaloriesEntity>> _fetchData() async {
    List<CaloriesEntity> fetchedData =
        await Provider.of<DatabaseProvider>(context, listen: false)
            .findAllCalories();
    return fetchedData;
  }

  Future<void> firstIndex(int dataLength) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    if (widget.firstDatabaseEntry == true &&
        sp.getInt('selectedIndex') == null) {
      setState(() {
        i = dataLength - 1;
      });
    }
  }

  Future<void> _decrementDate() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    setState(() {
      if (i > 0) {
        i -= 1;
        sp.setInt('selectedIndex', i);
      }
    });
  }

  Future<void> _incrementDate(int dataLength) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    setState(() {
      if (i < dataLength - 1) {
        i += 1;
        sp.setInt('selectedIndex', i);
      }
    });
  }

  bool _isShowBreakfast = false;
  bool _isShowLunch = false;
  bool _isShowDinner = false;
  bool _isShowSnack = false;

  @override
  Widget build(BuildContext context) {
    print('${HomePage.routename} built');
    return Scaffold(
      appBar: AppBar(
        title: const Row(children: [
          //Image.asset("assets/images/logo.png", width: 20),
          Text(HomePage.routename,
              style: TextStyle(fontWeight: FontWeight.bold))
        ]),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.info),
            tooltip: 'Info',
            onPressed: () => _toInfoPage(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Consumer<DatabaseProvider>(builder: (context, dbr, child) {
          return FutureBuilder<List<CaloriesEntity>>(
              initialData: null,
              future: _fetchData(),
              builder: (context, AsyncSnapshot<List<CaloriesEntity>> snapshot) {
                if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  final data = snapshot.data as List<CaloriesEntity>;
                  int dataLength = data.length;
                  firstIndex(dataLength);
                  final DateFormat italyDateFormat = DateFormat("dd-MM-yyyy");
                  String date = italyDateFormat.format(data[i].dateTime);
                  int sumCalories = data[i].sumCalories.round();
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              height: 230,
                              width: 350,
                              margin: const EdgeInsets.only(top: 5),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color: Colors.grey.shade400, width: 1.0),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade700,
                                    blurRadius: 6,
                                    spreadRadius: 2,
                                    offset: const Offset(-4, -4),
                                  )
                                ],
                              ),
                              child: Column(
                                children: [
                                  Container(
                                      height: 40,
                                      alignment: const Alignment(-0.95, 0.5),
                                      child: const Text("Calories",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              color: Color.fromARGB(
                                                  255, 76, 175, 80)))),
                                  Container(
                                      height: 20,
                                      alignment: const Alignment(-0.9, 0),
                                      child: const Text(
                                          "Remaining = Target - Food + Exercise",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black))),
                                  const SizedBox(height: 15),
                                  Align(
                                    alignment: const Alignment(1, -1),
                                    child: Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          SizedBox(
                                            width: 150,
                                            height: 150,
                                            child: CustomPaint(
                                                painter: ScoreCircularProgress(
                                                  backColor: Colors.lightGreen
                                                      .withOpacity(0.4),
                                                  frontColor: Colors.lightGreen,
                                                  strokeWidth: 20,
                                                  value:
                                                      0.5, // da mettere valori
                                                ),
                                                child: const Center(
                                                    child: Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 35.0),
                                                  child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          '2481', // mettere numero calorie con dati
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 26,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      76,
                                                                      175,
                                                                      80)),
                                                        ),
                                                        Text(
                                                          'Remaining',
                                                          style: TextStyle(
                                                              fontSize: 14),
                                                        )
                                                      ]),
                                                ))),
                                          ),
                                          const SizedBox(
                                              width: 30, height: 150),
                                          Align(
                                            alignment: const Alignment(1, 0),
                                            child: SizedBox(
                                              width: 150,
                                              height: 150,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  const Row(
                                                    children: [
                                                      Icon(
                                                          MdiIcons
                                                              .bullseyeArrow,
                                                          color: Colors.red),
                                                      Text("Base Target   ",
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              color: Colors
                                                                  .black)),
                                                      Text("2387",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 12,
                                                              color: Color.fromARGB(
                                                                  255,
                                                                  76,
                                                                  175,
                                                                  80))), // inserire dati aggiornati
                                                    ],
                                                  ),
                                                  const Row(
                                                    children: [
                                                      Icon(
                                                          MdiIcons
                                                              .silverwareForkKnife,
                                                          color: Colors.blue),
                                                      Text("Food   ",
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              color: Colors
                                                                  .black)),
                                                      Text("1099",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 12,
                                                              color: Color.fromARGB(
                                                                  255,
                                                                  76,
                                                                  175,
                                                                  80))), // inserire dati aggiornati
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      const Icon(MdiIcons.fire,
                                                          color: Colors.orange),
                                                      const Text(
                                                          "Rest + Exercise   ",
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              color: Colors
                                                                  .black)),
                                                      Text("$sumCalories",
                                                          style: const TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 12,
                                                              color: Color.fromARGB(
                                                                  255,
                                                                  76,
                                                                  175,
                                                                  80))), // inserire dati aggiornati
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          Container(
                            height: 330,
                            margin: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: Colors.grey.shade400, width: 1.0),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade700,
                                  blurRadius: 6,
                                  spreadRadius: 2,
                                  offset: const Offset(-4, -4),
                                )
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 30,
                                  alignment: const Alignment(-0.95, -1),
                                  padding: const EdgeInsets.only(
                                      left: 5), //color:Colors.red,
                                  child: const Text("Meal Selection",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24,
                                          color: Color.fromARGB(
                                              255, 76, 175, 80))),
                                ),
                                const SizedBox(height: 25),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton.icon(
                                      icon: const Icon(MdiIcons.coffee,
                                          color:
                                              Color.fromARGB(255, 6, 90, 158),
                                          shadows: <Shadow>[
                                            Shadow(
                                                color: Colors.black,
                                                blurRadius: 1.0,
                                                offset: Offset(0, 2))
                                          ]),
                                      label: const Text('Breakfast'),
                                      //onPressed: (){},
                                      onPressed: () {
                                        setState(
                                          () {
                                            _isShowBreakfast =
                                                !_isShowBreakfast;
                                          },
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                          //padding: EdgeInsets.fromLTRB(0, 20, 20, 20),
                                          backgroundColor: Colors.lightGreen,
                                          fixedSize: const Size(200, 40),
                                          textStyle: const TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold),
                                          elevation: 15,
                                          shadowColor: const Color.fromARGB(
                                              255, 14, 75, 16),
                                          shape: const StadiumBorder(),
                                          side: const BorderSide(
                                              color: Color.fromARGB(
                                                  255, 14, 75, 16),
                                              width: 2.5)),
                                    ),
                                    Visibility(
                                      visible: _isShowBreakfast,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          String mealName = 'BREAKFAST';
                                          _toIngredientsPage(context, mealName);
                                        },
                                        style: ElevatedButton.styleFrom(
                                            //padding: EdgeInsets.fromLTRB(0, 20, 20, 20),
                                            backgroundColor: Colors.lightGreen,
                                            fixedSize: const Size(200, 40),
                                            textStyle: const TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold),
                                            elevation: 15,
                                            shadowColor: const Color.fromARGB(
                                                255, 14, 75, 16),
                                            shape: const StadiumBorder(),
                                            side: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 14, 75, 16),
                                                width: 2.5)),
                                        child: const Icon(MdiIcons.pencil,
                                            color:
                                                Color.fromARGB(255, 14, 75, 16),
                                            size: 27.5),
                                      ),
                                    ),
                                    /*
                            Visibility( visible: _isShowBreakfast,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Icon(MdiIcons.pencil, color: Color.fromARGB(255, 14, 75, 16), size: 27.5),
                                style: ElevatedButton.styleFrom(
                                  shape: CircleBorder(),
                                  padding: EdgeInsets.all(13),
                                  backgroundColor: Colors.lightGreen,
                                  shadowColor: Color.fromARGB(255, 14, 75, 16),
                                  side: BorderSide(color: Color.fromARGB(255, 14, 75, 16), width: 3)                            
                                ),
                              ),
                            ), */
                                  ],
                                ),
                                /*
                        const SizedBox(height: 12),
                        Row( mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton.icon(
                              icon: Icon(MdiIcons.whiteBalanceSunny, 
                                color: Color.fromARGB(255, 219, 200, 23), 
                                shadows: <Shadow>[Shadow(color: Colors.black, blurRadius: 1.0, offset: Offset(0,2))]),
                              label: Text('Lunch'),
                              onPressed: () {setState(() {_isShowLunch=!_isShowLunch;},);},
                          ), 
                        ],
                      ), */
                                const SizedBox(height: 15),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton.icon(
                                      icon: const Icon(
                                          MdiIcons.whiteBalanceSunny,
                                          color:
                                              Color.fromARGB(255, 219, 200, 23),
                                          shadows: <Shadow>[
                                            Shadow(
                                                color: Colors.black,
                                                blurRadius: 1.0,
                                                offset: Offset(0, 2))
                                          ]),
                                      label: const Text('Lunch'),
                                      onPressed: () {
                                        setState(
                                          () {
                                            _isShowLunch = !_isShowLunch;
                                          },
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                          //padding: EdgeInsets.fromLTRB(0, 20, 50, 20),
                                          backgroundColor: Colors.lightGreen,
                                          fixedSize: const Size(200, 40),
                                          textStyle: const TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold),
                                          elevation: 15,
                                          shadowColor: const Color.fromARGB(
                                              255, 14, 75, 16),
                                          shape: const StadiumBorder(),
                                          side: const BorderSide(
                                              color: Color.fromARGB(
                                                  255, 14, 75, 16),
                                              width: 2.5)),
                                    ),
                                    Visibility(
                                      visible: _isShowLunch,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          String mealName = 'LUNCH';
                                          _toIngredientsPage(context, mealName);
                                        },
                                        style: ElevatedButton.styleFrom(
                                            //padding: EdgeInsets.fromLTRB(0, 20, 50, 20),
                                            backgroundColor: Colors.lightGreen,
                                            fixedSize: const Size(200, 40),
                                            textStyle: const TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold),
                                            elevation: 15,
                                            shadowColor: const Color.fromARGB(
                                                255, 14, 75, 16),
                                            shape: const StadiumBorder(),
                                            side: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 14, 75, 16),
                                                width: 2.5)),
                                        child: const Icon(MdiIcons.pencil,
                                            color:
                                                Color.fromARGB(255, 14, 75, 16),
                                            size: 27.5),
                                      ),
                                    ),
                                    /*
                            Visibility( visible: _isShowLunch,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Icon(MdiIcons.pencil, color: Color.fromARGB(255, 14, 75, 16), size: 27.5),
                                style: ElevatedButton.styleFrom(
                                  shape: CircleBorder(),
                                  padding: EdgeInsets.all(13),
                                  backgroundColor: Colors.lightGreen,
                                  shadowColor: Color.fromARGB(255, 14, 75, 16),
                                  side: BorderSide(color: Color.fromARGB(255, 14, 75, 16), width: 3)                            
                                ),
                              ),
                            ),*/
                                  ],
                                ),
                                /*
                        const SizedBox(height: 12),
                        Row( mainAxisAlignment: MainAxisAlignment.center,
                          children: [                
                            ElevatedButton.icon(
                              icon: Icon(Icons.mode_night_rounded,
                                color: Color.fromARGB(255, 126, 125, 125),
                                shadows: <Shadow>[Shadow(color: Colors.black, blurRadius: 1.0, offset: Offset(0,2))]),
                              label: Text('Dinner'),
                              onPressed: () {setState(() {_isShowDinner=!_isShowDinner;},);},
                          ),
                        ],
                      ),*/

                                const SizedBox(height: 15),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton.icon(
                                      icon: const Icon(Icons.mode_night_rounded,
                                          color: Color.fromARGB(
                                              255, 126, 125, 125),
                                          shadows: <Shadow>[
                                            Shadow(
                                                color: Colors.black,
                                                blurRadius: 1.0,
                                                offset: Offset(0, 2))
                                          ]),
                                      label: const Text('Dinner'),
                                      onPressed: () {
                                        setState(
                                          () {
                                            _isShowDinner = !_isShowDinner;
                                          },
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                          //padding: EdgeInsets.all(20.0),
                                          backgroundColor: Colors.lightGreen,
                                          fixedSize: const Size(200, 40),
                                          textStyle: const TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold),
                                          elevation: 15,
                                          shadowColor: const Color.fromARGB(
                                              255, 14, 75, 16),
                                          shape: const StadiumBorder(),
                                          side: const BorderSide(
                                              color: Color.fromARGB(
                                                  255, 14, 75, 16),
                                              width: 2.5)),
                                    ),
                                    Visibility(
                                      visible: _isShowDinner,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          String mealName = 'DINNER';
                                          _toIngredientsPage(context, mealName);
                                        },
                                        style: ElevatedButton.styleFrom(
                                            shape: const CircleBorder(),
                                            padding: const EdgeInsets.all(13),
                                            backgroundColor: Colors.lightGreen,
                                            shadowColor: const Color.fromARGB(
                                                255, 14, 75, 16),
                                            side: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 14, 75, 16),
                                                width: 3)),
                                        child: const Icon(MdiIcons.pencil,
                                            color:
                                                Color.fromARGB(255, 14, 75, 16),
                                            size: 27.5),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 15),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton.icon(
                                      icon: const Icon(MdiIcons.foodApple,
                                          color:
                                              Color.fromARGB(255, 218, 26, 12),
                                          shadows: <Shadow>[
                                            Shadow(
                                                color: Colors.black,
                                                blurRadius: 1.0,
                                                offset: Offset(0, 2))
                                          ]),
                                      label: const Text('Snack'),
                                      onPressed: () {
                                        setState(
                                          () {
                                            _isShowSnack = !_isShowSnack;
                                          },
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                          //padding: EdgeInsets.fromLTRB(0, 20, 50, 20),
                                          backgroundColor: Colors.lightGreen,
                                          fixedSize: const Size(200, 40),
                                          textStyle: const TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold),
                                          elevation: 15,
                                          shadowColor: const Color.fromARGB(
                                              255, 14, 75, 16),
                                          shape: const StadiumBorder(),
                                          side: const BorderSide(
                                              color: Color.fromARGB(
                                                  255, 14, 75, 16),
                                              width: 2.5)),
                                    ),
                                    Visibility(
                                      visible: _isShowSnack,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                            //padding: EdgeInsets.all(20.0),
                                            backgroundColor: Colors.lightGreen,
                                            fixedSize: const Size(200, 40),
                                            textStyle: const TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold),
                                            elevation: 15,
                                            shadowColor: const Color.fromARGB(
                                                255, 14, 75, 16),
                                            shape: const StadiumBorder(),
                                            side: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 14, 75, 16),
                                                width: 2.5)),
                                        child: const Icon(MdiIcons.pencil,
                                            color:
                                                Color.fromARGB(255, 14, 75, 16),
                                            size: 27.5),
                                      ),
                                    ),
                                    /*
                            Visibility( visible: _isShowDinner,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Icon(MdiIcons.pencil, color: Color.fromARGB(255, 14, 75, 16), size: 27.5),
                                style: ElevatedButton.styleFrom(
                                  shape: CircleBorder(),
                                  padding: EdgeInsets.all(13),
                                  backgroundColor: Colors.lightGreen,
                                  shadowColor: Color.fromARGB(255, 14, 75, 16),
                                  side: BorderSide(color: Color.fromARGB(255, 14, 75, 16), width: 3)                            
                                ),
                              ),
                            ), 
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row( mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton.icon( 
                              icon: Icon(MdiIcons.foodApple, 
                                color: Color.fromARGB(255, 218, 26, 12),
                                shadows: <Shadow>[Shadow(color: Colors.black, blurRadius: 1.0, offset: Offset(0,2))]),
                              label: Text('Snack'),
                              onPressed: () {setState(() {_isShowSnack=!_isShowSnack;},);},
                              style: ElevatedButton.styleFrom(
                                //padding: EdgeInsets.fromLTRB(0, 20, 50, 20), 
                                backgroundColor:  Colors.lightGreen,
                                fixedSize: Size(200, 40),
                                textStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                                elevation: 15,
                                shadowColor:  Color.fromARGB(255, 14, 75, 16),
                                shape: StadiumBorder(),
                                side: BorderSide(color: Color.fromARGB(255, 14, 75, 16), width: 2.5)
                              ),
                            ),
                            Visibility( visible: _isShowSnack,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Icon(MdiIcons.pencil, color: Color.fromARGB(255, 14, 75, 16), size: 27.5),
                                style: ElevatedButton.styleFrom(
                                  shape: CircleBorder(),
                                  padding: EdgeInsets.all(13),
                                  backgroundColor: Colors.lightGreen,
                                  shadowColor: Color.fromARGB(255, 14, 75, 16),
                                  side: BorderSide(color: Color.fromARGB(255, 14, 75, 16), width: 3)                            
                                ),
                              ),
                            ), 
                          ],
                        ),*/
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              });
        }),
      ),
    );

    /*body: Center(
          child:
            ElevatedButton(
              onPressed: () => _toIngredientsPage(context),
              child: const Text('Ingredients')
          ),
        ),
      
    );*/
  } //build

  void _toInfoPage(BuildContext context) {
    //Then pop the HomePage
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => InfoPage()));
  } //_toInfoPage

  void _toIngredientsPage(BuildContext context, String mealName) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => IngredientsPage(
            meal: mealName, firstDatabaseEntry: widget.firstDatabaseEntry)));
  } //_toIngredientsPage
} //HomePage
