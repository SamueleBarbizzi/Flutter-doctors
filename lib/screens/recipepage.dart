// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_doctors/screens/mainnavigator.dart';
import 'package:flutter_doctors/models/mealchoice.dart';
import 'package:provider/provider.dart';


class RecipePage extends StatefulWidget {
  RecipePage({Key? key}) : super(key: key);

  static const routename = 'RecipePage';

  @override
  _RecipePageState createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {

  Map items = {};

    @override
  void initState() {
    items = Provider.of<MealChoiche>(context, listen: false).chosen;
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print('${RecipePage.routename} built');

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
            onPressed: () => Navigator.pop(context),
          ),
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            tooltip: 'Home',
            onPressed: () => _toMainNavigator(context),
          ),
        ],
        title: const Text(RecipePage.routename), centerTitle: true),
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        child: const Icon(Icons.check),
        onPressed: (){},
      ),
      body: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(10),
            ),
            Expanded(
              child:
              ListView.builder(
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  String key = items.keys.elementAt(index);
                  return Column(
                    children: <Widget>[
                      ListTile(
                        title: Text('$key'),
                        subtitle: Text('${items[key]['name']}'),
                      ),
                      const Divider(
                        height: 2.0,
                      ),
                    ],
                  );
                },
              )
      ),],),
    );
  }

  void _toMainNavigator(BuildContext context){
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const MainNavigator()));
  }//_toHomePage


} //RecipePage