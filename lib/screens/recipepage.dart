import 'package:flutter/material.dart';
import 'package:flutter_doctors/screens/mainnavigator.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


class RecipePage extends StatelessWidget {
  const RecipePage({Key? key}) : super(key: key);

  static const routename = 'RecipePage';

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
        title: Text(RecipePage.routename), centerTitle: true),
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        child: Icon(Icons.check),
        onPressed: (){},
      ),
      body: Center(child: Text('Recipe Here')),
    );
  }

  void _toMainNavigator(BuildContext context){
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const MainNavigator()));
  }//_toHomePage


} //RecipePage