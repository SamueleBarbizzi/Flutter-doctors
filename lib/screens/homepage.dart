// ignore_for_file: depend_on_referenced_packages, library_private_types_in_public_api, avoid_print, unused_import, unused_element, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_doctors/models/cookbook.dart';
import 'package:flutter_doctors/models/personalmeals.dart';
import 'package:flutter_doctors/models/mealchoice.dart';
import 'package:flutter_doctors/screens/breakfastchoicepage.dart';
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
import 'package:syncfusion_flutter_charts/charts.dart';

class HomePage extends StatefulWidget {
  final bool firstDatabaseEntry;
  const HomePage({super.key, required this.firstDatabaseEntry});

  static const routename = 'Home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int i = 0;
  int largestValueIndex = 0;
  List<CaloriesEntity> fetchedData = [];
  List<ChartsData> chartData = [];
  int baseTarget = 0;

  TextEditingController nameController = TextEditingController();
  TextEditingController quantityController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    quantityController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    selectedIndex();
  }

void loadSavedMeals() {
  Provider.of<MealChoiche>(context,listen: false).loadMeals();
}

void loadCookBookStatus() {
  Provider.of<CookBook>(context,listen: false).loadCookbookStatus();
}

void getCalorieIntake() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  baseTarget = prefs.getInt('dailycalorieintake')!;
}

  Future<void> selectedIndex() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    i = sp.getInt('selectedIndex') ?? 0;
  }

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
      if (mounted) {
        setState(() {
          i = dataLength - 1;
        });
      }
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

  @override
  Widget build(BuildContext context) {
    loadSavedMeals();
    loadCookBookStatus();
    //Calories calculation
    int actualCalories =
        Provider.of<MealChoiche>(context, listen: false).getAllCalories();
    //int baseTarget = 2387; //da inserire
    int sumCalories = 0; // actual calculation below at line 130
    // Remain = Target - Food + Exercise;
    int remain = baseTarget - actualCalories + sumCalories;
    return Scaffold(
      appBar: AppBar(
        title: const Text(HomePage.routename, style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
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
                  getCalorieIntake();
                  final DateFormat italyDateFormat = DateFormat("dd-MM-yyyy");
                  chartData = [];
                  for (int t = 0; t < data.length; t++) {
                    String date = italyDateFormat.format(data[t].dateTime);
                    int sumCalories = data[t].sumCalories.round();
                    chartData.add(ChartsData(date, sumCalories));
                  }

                  int largestValue = data[0].sumCalories.round();

                  for (int t = 1; t < data.length; t++) {
                    if (data[t].sumCalories.round() > largestValue) {
                      largestValue = data[t].sumCalories.round();
                      largestValueIndex = t;
                    }
                  }
                  String date = italyDateFormat.format(data[i].dateTime);
                  int sumCalories = data[i].sumCalories.round();
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // const SizedBox(height: 5),
                          IconButton(
                            color: Color(0xFF0B614D),
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            icon: const Icon(LineIcons.angleDoubleLeft),
                            onPressed: _decrementDate,
                          ),
                          Text(date,
                              style: const TextStyle(
                                fontFamily: "Lato",
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                                  color: Color(0xFF0B614D),
                              )),
                          IconButton(
                            color: Color(0xFF0B614D),
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            icon: const Icon(LineIcons.angleDoubleRight),
                            onPressed: () => _incrementDate(dataLength),
                          ),
                        ],
                      ),
                      Center(
                        child: TextButton(
                          onPressed: () {
                            showAnalytics(chartData);
                          },
                          style: ButtonStyle(
                            shadowColor: MaterialStatePropertyAll(Colors.grey.shade500),
                              splashFactory: NoSplash.splashFactory,
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                      (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed)) {
                                  return Color(0xFF0B614D).withOpacity(0.8);
                                }
                                return Color(0xFF0B614D);
                              }),
                              overlayColor:
                                  const MaterialStatePropertyAll<Color>(
                                Color(0xFF0B614D),
                              ),
                              elevation: const MaterialStatePropertyAll(4.0)),
                          child: const Text(
                            'Weekly Analytics',
                            style: TextStyle(
                              fontFamily: "Lato",
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 220,
                        width: 350,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: Colors.grey.shade400, width: 1.0),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade500,
                              blurRadius: 4,
                              spreadRadius: 1,
                              offset: const Offset(-2, -2),
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
                                        color: Color(0xFF4CAF50)))),
                            Container(
                                height: 20,
                                alignment: const Alignment(-0.9, 0),
                                child: const Text(
                                    "Remaining = Target - Food + Exercise",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black))),
                            Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: SizedBox(
                                        width: 120,
                                        height: 140,
                                        child: CustomPaint(
                                            painter: ScoreCircularProgress(
                                              backColor: Colors.lightGreen
                                                  .withOpacity(0.4),
                                              frontColor: Colors.lightGreen,
                                              strokeWidth: 20,
                                              value: (actualCalories /
                                                      baseTarget)
                                                  .toDouble(), // da mettere valori
                                            ),
                                            child: Center(
                                                child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 52.0),
                                              child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(remain.toString(),
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 28,
                                                            color: Color(
                                                                0xFF4CAF50))),
                                                    const Text('Remaining',
                                                        style: TextStyle(
                                                            fontSize: 14))
                                                  ]), // Column
                                            ) // Padding
                                                )), // CustomPaint
                                      ),
                                    ),

                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 20.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 2.0),
                                            child: Row(
                                              children: [
                                                Icon(MdiIcons.bullseyeArrow,
                                                    color: Colors.red),
                                                const Text("Base Target ",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.black)),
                                                Text(
                                                    baseTarget.toString() +
                                                        " kcal",
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 12,
                                                        color:
                                                            Color(0xFF4CAF50))),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 2.0),
                                            child: Row(
                                              children: [
                                                Icon(
                                                    MdiIcons
                                                        .silverwareForkKnife,
                                                    color: Colors.blue),
                                                const Text("Food ",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.black)),
                                                Text(
                                                    actualCalories.toString() +
                                                        " kcal",
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 12,
                                                        color:
                                                            Color(0xFF4CAF50))),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 2.0),
                                            child: Row(
                                              children: [
                                                Icon(MdiIcons.fire,
                                                    color: Colors.orange),
                                                const Text("Rest + Exercise ",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.black)),
                                                Text("$sumCalories" + " kcal",
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 12,
                                                        color:
                                                            Color(0xFF4CAF50))),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ), // Column
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      Container(
                        height: 330,
                        width: 350,
                        margin: const EdgeInsets.fromLTRB(25, 0, 25, 100),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: Colors.grey.shade400, width: 1.0),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade500,
                              blurRadius: 4,
                              spreadRadius: 1,
                              offset: const Offset(-2, -2),
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
                                      fontSize: 20,
                                      color: Color(0xFF4CAF50))),
                            ),
                            const SizedBox(height: 25),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton.icon(
                                  icon: Icon(MdiIcons.coffee,
                                      color:
                                          const Color.fromARGB(255, 6, 90, 158),
                                      shadows: const <Shadow>[
                                        Shadow(
                                            color: Colors.black,
                                            blurRadius: 1.0,
                                            offset: Offset(0, 2))
                                      ]),
                                  label: const Text('Breakfast'),
                                  onPressed: () {
                                    _toBreakfastChoicePage(context, baseTarget);
                                  },
                                  style: ElevatedButton.styleFrom(
                                      //padding: EdgeInsets.fromLTRB(0, 20, 20, 20),
                                      backgroundColor: Colors.lightGreen,
                                      fixedSize: const Size(200, 40),
                                      textStyle: const TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                      elevation: 15,
                                      shadowColor:
                                          const Color.fromARGB(255, 14, 75, 16),
                                      shape: const StadiumBorder(),
                                      side: const BorderSide(
                                          color:
                                              Color.fromARGB(255, 14, 75, 16),
                                          width: 2.5)),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton.icon(
                                  icon: Icon(MdiIcons.whiteBalanceSunny,
                                      color: const Color.fromARGB(
                                          255, 219, 200, 23),
                                      shadows: const <Shadow>[
                                        Shadow(
                                            color: Colors.black,
                                            blurRadius: 1.0,
                                            offset: Offset(0, 2))
                                      ]),
                                  label: const Text('Lunch'),
                                  onPressed: () {
                                    String mealName = 'LUNCH';
                                    _toIngredientsPage(
                                        context, mealName, baseTarget);
                                  },
                                  style: ElevatedButton.styleFrom(
                                      //padding: EdgeInsets.fromLTRB(0, 20, 50, 20),
                                      backgroundColor: Colors.lightGreen,
                                      fixedSize: const Size(200, 40),
                                      textStyle: const TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                      elevation: 15,
                                      shadowColor:
                                          const Color.fromARGB(255, 14, 75, 16),
                                      shape: const StadiumBorder(),
                                      side: const BorderSide(
                                          color:
                                              Color.fromARGB(255, 14, 75, 16),
                                          width: 2.5)),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton.icon(
                                  icon: const Icon(Icons.mode_night_rounded,
                                      color: Color.fromARGB(255, 126, 125, 125),
                                      shadows: <Shadow>[
                                        Shadow(
                                            color: Colors.black,
                                            blurRadius: 1.0,
                                            offset: Offset(0, 2))
                                      ]),
                                  label: const Text('Dinner'),
                                  onPressed: () {
                                    String mealName = 'DINNER';
                                    _toIngredientsPage(
                                        context, mealName, baseTarget);
                                  },
                                  style: ElevatedButton.styleFrom(
                                      //padding: EdgeInsets.all(20.0),
                                      backgroundColor: Colors.lightGreen,
                                      fixedSize: const Size(200, 40),
                                      textStyle: const TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                      elevation: 15,
                                      shadowColor:
                                          const Color.fromARGB(255, 14, 75, 16),
                                      shape: const StadiumBorder(),
                                      side: const BorderSide(
                                          color:
                                              Color.fromARGB(255, 14, 75, 16),
                                          width: 2.5)),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton.icon(
                                  icon: Icon(MdiIcons.foodApple,
                                      color: const Color.fromARGB(
                                          255, 218, 26, 12),
                                      shadows: const <Shadow>[
                                        Shadow(
                                            color: Colors.black,
                                            blurRadius: 1.0,
                                            offset: Offset(0, 2))
                                      ]),
                                  label: const Text('Snack'),
                                  onPressed: () => showDialog(
                                    context: context,
                                    builder: (context) => ScaffoldMessenger(
                                      child: Builder(
                                        builder: (context) => Scaffold(
                                          backgroundColor: Colors.transparent,
                                          body: GestureDetector(
                                            child: AlertDialog(
                                              title: const Text('New snack'),
                                              content: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  TextField(
                                                    controller: nameController,
                                                    //onChanged: (value) {String name = value;},
                                                    decoration:
                                                        const InputDecoration(
                                                      labelText: "Name",
                                                      hintText: "Name...",
                                                      border: OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          10))),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 20),
                                                  TextField(
                                                    controller:
                                                        quantityController,
                                                    keyboardType:
                                                        TextInputType.number,
                                                    //onChanged: (value) {int quantity = int.parse(value);},
                                                    decoration:
                                                        const InputDecoration(
                                                      labelText: "Calories",
                                                      hintText: "Kcals...",
                                                      border: OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          10))),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              actions: <Widget>[
                                                TextButton(
                                                  onPressed: () {
                                                    nameController.clear();
                                                    quantityController.clear();
                                                    Navigator.pop(
                                                        context, 'Cancel');
                                                  },
                                                  child: const Text('Cancel'),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    if (nameController.text !=
                                                            '' &&
                                                        quantityController
                                                                .text !=
                                                            '') {
                                                      Provider.of<MealChoiche>(
                                                              context,
                                                              listen: false)
                                                          .addSnack(
                                                              nameController
                                                                  .text,
                                                              int.parse(
                                                                  quantityController
                                                                      .text));
                                                      setState(() {});

                                                      actualCalories = Provider
                                                              .of<MealChoiche>(
                                                                  context,
                                                                  listen: false)
                                                          .getAllCalories();

                                                      nameController.clear();
                                                      quantityController
                                                          .clear();
                                                      Navigator.pop(
                                                          context, 'Add');
                                                    } else {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                              const SnackBar(
                                                        content: Text(
                                                            'Name or quantity inserted are empty! Please complete both inputs or Cancel'),
                                                        elevation: 20,
                                                      ));
                                                    }
                                                  },
                                                  child: const Text('Add'),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      //padding: EdgeInsets.fromLTRB(0, 20, 50, 20),
                                      backgroundColor: Colors.lightGreen,
                                      fixedSize: const Size(200, 40),
                                      textStyle: const TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                      elevation: 15,
                                      shadowColor:
                                          const Color.fromARGB(255, 14, 75, 16),
                                      shape: const StadiumBorder(),
                                      side: const BorderSide(
                                          color:
                                              Color.fromARGB(255, 14, 75, 16),
                                          width: 2.5)),
                                ),
                              ],
                            ),
                          ],
                        ),
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
  } //build

  void showAnalytics(List<ChartsData> chartData) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  20.0,
                ),
              ),
            ),
            child: SizedBox(
              height: 400.0,
              child: Container(
                child: SfCartesianChart(
                  onDataLabelRender: (DataLabelRenderArgs args) {
                    //LineSeries<ChartsData, String> series = args.seriesRenderer;
                    if (args.pointIndex == largestValueIndex) {
                      args.color = const Color(0xFF912F40);
                      args.textStyle = const TextStyle(color: Colors.white);
                    }
                  },
                  title: ChartTitle(
                      text: 'Weekly Calories View',
                      textStyle: const TextStyle(
                        color: Color(0xFF00916E),
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      )),
                  primaryXAxis: CategoryAxis(
                    isVisible: false,
                  ),
                  primaryYAxis: NumericAxis(
                      // rangePadding: ChartRangePadding.round,
                      ),
                  tooltipBehavior:
                      TooltipBehavior(enable: true, header: "Calories"),
                  series: <LineSeries<ChartsData, String>>[
                    LineSeries<ChartsData, String>(
                        color: Color(0xFF4CAF50),
                        dataSource: chartData,
                        xValueMapper: (ChartsData chart, _) =>
                            chart.dataTotalCalories,
                        yValueMapper: (ChartsData chart, _) =>
                            chart.totalCalories,
                        dataLabelSettings: const DataLabelSettings(
                            isVisible: true,
                            textStyle: TextStyle(color: Colors.black)),
                        markerSettings: const MarkerSettings(
                            isVisible: true,
                            shape: DataMarkerType.circle,
                            color: Color(0xFF4CAF50)))
                  ],
                ),
              ),
            ),
          );
        });
  }

  void _toInfoPage(BuildContext context) {
    //Then pop the HomePage
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => InfoPage()));
  } //_toInfoPage

  void _toIngredientsPage(BuildContext context, String mealName, int calories) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => IngredientsPage(
              meal: mealName,
              firstDatabaseEntry: widget.firstDatabaseEntry,
              sumCalories: calories,
            )));
  } //_toIngredientsPage

  void _toBreakfastChoicePage(BuildContext context, int calories) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => BreakfastChoicePage(
              firstDatabaseEntry: widget.firstDatabaseEntry,
              sumCalories: calories,
            )));
  } //_toCookbookPage
} //HomePage

class ChartsData {
  ChartsData(this.dataTotalCalories, this.totalCalories);
  String dataTotalCalories;
  int totalCalories;
}
