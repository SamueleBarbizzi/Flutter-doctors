//import 'dart:ffi';

import 'package:flutter/material.dart';
//import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter_doctors/screens/mainnavigator.dart';
import 'package:flutter_doctors/models/mealchoice.dart';
//import 'package:flutter_doctors/models/personalmeals.dart';
//import 'package:flutter_doctors/models/groups.dart';
import 'package:provider/provider.dart';
//import 'package:flutter_doctors/screens/cookbookpage.dart';
import 'package:flutter_doctors/screens/recipepage.dart';


class VisualEditRecipe extends StatefulWidget {
  const VisualEditRecipe({Key? key, required this.firstDatabaseEntry}) : super(key: key);
  //final Map recipe;
  //final String dish;
  final bool firstDatabaseEntry;

  static const routename = 'visualEditRecipePage';

  @override
  _VisualEditRecipeState createState() => _VisualEditRecipeState();
}

class _VisualEditRecipeState extends State<VisualEditRecipe> {

  late Map chosen= Provider.of<MealChoiche>(context, listen: false).chosen;
  late Map personal=Provider.of<MealChoiche>(context, listen: false).personalRecipes;
  late List snacks=Provider.of<MealChoiche>(context, listen: false).snacks;

/*   final List<String> groupsName = [
    'FIRST MAIN DISH',
    'SECOND MAIN DISH',
    'SIDE',
    'DESSERT',
  ]; */

  @override
  Widget build(BuildContext context) {
    print('${VisualEditRecipe.routename} built');
  
    List<Widget> widgetMeals = [];
    Map chosen= Provider.of<MealChoiche>(context, listen: false).chosen;
    Map personal=Provider.of<MealChoiche>(context, listen: false).personalRecipes;
    List snacks=Provider.of<MealChoiche>(context, listen: false).snacks;

    for (var k in ['BREAKFAST','LUNCH','DINNER']) { 
      List recipe = chosen[k].values.toList();
      List recipePersonal = personal[k].values.toList();
      List addRecipe = [];
      List addRecipePersonal = [];
      List<bool> isEmpty = [];
      List<bool> isEmptyPersonal = [];
      int iter = k=='BREAKFAST'? 1 : 4;
      for( int i=0; i< iter; i++) {
        isEmpty.add(recipe[i].isNotEmpty); 
        isEmptyPersonal.add(recipePersonal[i].isNotEmpty); 
        addRecipe.add(recipe[i]);
        addRecipePersonal.add(recipePersonal[i]);
      }
      int lenEmpty = isEmpty.where((x) => x == true).length;
      int lenEmptyPersonal = isEmptyPersonal.where((x) => x == true).length;
      List allRecipe = addRecipe.expand((x) => x).toList();
      List allRecipePersonal = addRecipePersonal.expand((x) => x).toList();
      int lenRecipe=allRecipe.length;
      int lenRecipePersonal=allRecipePersonal.length;
      if (lenEmpty+lenEmptyPersonal!=0) {
        widgetMeals.add(
          Container( child: 
            Column( children: [ 
              Container( alignment: Alignment.center, 
                width: double.infinity,
                padding: EdgeInsets.all(3), 
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      color: Colors.grey.shade400, width: 1.0),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [ BoxShadow(
                    color: Colors.grey.shade700,
                    blurRadius: 6,
                    spreadRadius: 2,
                    offset: const Offset(-4, -4),
                  )],
                ),
                child: Text( '$k',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Color.fromARGB(255, 76, 175, 80)),
                ),
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: lenRecipePersonal,
                itemBuilder: (BuildContext context, index) { 
                  return Card(
                    key: ValueKey(allRecipePersonal[index]['name']),
                    margin: const EdgeInsets.fromLTRB(5,1,5,1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      title: Text(allRecipePersonal[index]['name']),
                      subtitle: Text('     ${allRecipePersonal[index]['calories']} kcals'),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: lenRecipe,
                  itemBuilder: (BuildContext ctx, index) => Card ( 
                    key: ValueKey(allRecipe[index]['name']),
                    child: Tooltip( 
                      message: allRecipe[index]['name'],
                      child: GestureDetector( 
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey.shade400, width: 1.0),
                            borderRadius: BorderRadius.circular(8)
                          ), 
                          child: ClipRRect(borderRadius: BorderRadius.circular(10),
                            child: Image.network(allRecipe[index]['url']),
                          ),
                        ),
                        onTap: () { _showRecipe(
                                    context,
                                    allRecipe[index]['course'][0],
                                    allRecipe[index]);
                        },
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20,)
            ],),
          ),
        );
      }
    }


    int lenSnacks=snacks.length;
    if (lenSnacks!=0) {
      widgetMeals.add(
        Container( child: 
          Column( children: [ 
            Container( alignment: Alignment.center, 
              width: double.infinity,
              padding: EdgeInsets.all(3), 
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                    color: Colors.grey.shade400, width: 1.0),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [ BoxShadow(
                  color: Colors.grey.shade700,
                  blurRadius: 6,
                  spreadRadius: 2,
                  offset: const Offset(-4, -4),
                )],
              ),
              child: Text( 'SNACK',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Color.fromARGB(255, 76, 175, 80)),
              ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: lenSnacks,
              itemBuilder: (BuildContext context, index) { 
                return Card(
                  key: ValueKey(snacks[index]['name']),
                  margin: const EdgeInsets.fromLTRB(5,1,5,1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    title: Text(snacks[index]['name']),
                    subtitle: Text('     ${snacks[index]['calories']} kcals'),
                  ),
                );
              },
            ),
            const SizedBox(height: 20,)
          ],),
        ),
      );
    }


    return Scaffold(
      appBar: AppBar(
        title: Row(children: [
          const Text(VisualEditRecipe.routename, 
            style: const TextStyle(fontWeight: FontWeight.bold))]),
        centerTitle: true,
        leading: BackButton(
          onPressed: () => _toMainNavigator(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: widgetMeals
        ),
      ),
    );

  }

  void _showRecipe(BuildContext context, String dish, Map recipe) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => RecipePage(
              recipe: recipe,
              dish: dish,
            )));
  }

  void _toMainNavigator(BuildContext context) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => MainNavigator(
            firstDatabaseEntry: widget.firstDatabaseEntry, flag: false
            )));
  } //_toMainNavigator

}



