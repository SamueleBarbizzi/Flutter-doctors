import 'dart:ffi';

import 'package:flutter/material.dart';
//import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter_doctors/screens/mainnavigator.dart';
import 'package:flutter_doctors/models/mealchoice.dart';
import 'package:flutter_doctors/models/personalmeals.dart';
import 'package:flutter_doctors/models/groups.dart';
import 'package:provider/provider.dart';


class VisualEditRecipe extends StatefulWidget {
  const VisualEditRecipe({Key? key}) : super(key: key);
  //final Map recipe;
  //final String dish;

  static const routename = 'visualEditRecipePage';

  @override
  _VisualEditRecipeState createState() => _VisualEditRecipeState();
}

class _VisualEditRecipeState extends State<VisualEditRecipe> {

  late Map chosen= Provider.of<MealChoiche>(context, listen: false).chosen;
  late Map personal=Provider.of<MealChoiche>(context, listen: false).personalRecipes;

  @override
  Widget build(BuildContext context) {
    print('${VisualEditRecipe.routename} built');
  
    List<Widget> mywidgets = [];
    Map chosen= Provider.of<MealChoiche>(context, listen: false).chosen;
    Map personal=Provider.of<MealChoiche>(context, listen: false).personalRecipes;

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
      };
      int lenEmpty = isEmpty.where((x) => x == true).length;
      int lenEmptyPersonal = isEmptyPersonal.where((x) => x == true).length;
      List allRecipe = addRecipe.expand((x) => x).toList();
      List allRecipePersonal = addRecipePersonal.expand((x) => x).toList();
      int lenRecipe=allRecipe.length;
      int lenRecipePersonal=allRecipePersonal.length;
      if (lenEmpty+lenEmptyPersonal!=0) {
        mywidgets.add(
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
                itemBuilder: (BuildContext ctx, index) { 
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
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey.shade400, width: 1.0),
                        borderRadius: BorderRadius.circular(8)
                      ), 
                      child: ClipRRect(borderRadius: BorderRadius.circular(10),
                        child: Image.network(allRecipe[index]['url']),
                      )
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
        return Scaffold(
          appBar: AppBar(
            title: Row(children: [
              const Text(VisualEditRecipe.routename, 
              style: const TextStyle(fontWeight: FontWeight.bold))]),
            centerTitle: true,
            leading: BackButton(
              onPressed: (){} //=> Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const MainNavigator())),
            ),),
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: mywidgets
          ),
          ),
        );
  }
}



