import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter_doctors/screens/mainnavigator.dart';


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
            onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const MainNavigator())),
          ),
        title: Text(RecipePage.routename), centerTitle: true),
      body: SingleChildScrollView( 
        child: Container( padding: EdgeInsets.all(5),
          child: Column( crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              Container( padding:EdgeInsets.fromLTRB(10,5,5,5), margin: EdgeInsets.only(top: 3),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade400, width: 1.0),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [ BoxShadow(
                    color:Colors.grey.shade700,
                    blurRadius: 6,
                    spreadRadius: 2,
                    offset: Offset(-4,-4),
                  )]
                ),
                child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                  children: [
                    Column( crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          constraints: const BoxConstraints(maxWidth: 300),
                            child: Text("Roast veal in the oven ",
                              style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 28,
                              color: Color.fromARGB(255, 76, 175, 80))),
                        ),
                        Text("Main1", textAlign: TextAlign.left,
                          style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey[850])
                        ),
                      ]
                    ),
                    Padding( padding: EdgeInsets.fromLTRB(0,0,10,0),
                      child: Container( //color: Colors.brown,
                        child: Column( mainAxisAlignment: MainAxisAlignment.end, 
                          children: [ 
                            Icon(MdiIcons.fire, color: Colors.orange, size: 30),
                            Row( children: [ 
                              Text("215 ",
                              style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color.fromARGB(255, 76, 175, 80))
                              ),
                              Text("kcal",
                                style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black)
                              ),
                            ]),
                          ],
                        ),
                      ),
                    ),
                  ]
                ),
              ),
            /* Container( height: 300, //width: 400,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  image: DecorationImage(
                  image: AssetImage('assets/images/recipe1.jpg'), 
                  fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(10))
              ), */
              SizedBox(height:15),
              Container( 
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade400, width: 1.0),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [ BoxShadow(
                    color:Colors.grey.shade700,
                    blurRadius: 6,
                    spreadRadius: 2,
                    offset: Offset(-4,-4),
                  )]
                ),
                child: ClipRRect( borderRadius: BorderRadius.circular(10),
                  child: Image.network('https://www.giallozafferano.it/images/35-3543/Biscotti-due-ingredienti_780x520_wm.jpg')
                ),
              ),
              SizedBox(height:15),
              Container( width: 450, padding:EdgeInsets.fromLTRB(10,5,5,5), //margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.shade400, width: 1.0),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [ BoxShadow(
                      color:Colors.grey.shade700,
                      blurRadius: 6,
                      spreadRadius: 2,
                      offset: Offset(-4,-4),
                    )]
                ),
                child: Column( crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Ingredients:", textAlign: TextAlign.left,
                      style: TextStyle(
                      //height: 10,
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: Color.fromARGB(255, 76, 175, 80))
                    ),
                    SizedBox(height: 5),
                    Text("\u2022'Saffron': '1/2 tsp', \n\u2022'Rice': ' 80g',\n\u2022'Butter': '35g',\n\u2022'Onion': '1/2',\n\u2022'Grana Padano cheese': '20g',\n\u2022'White wine': '10g',\n\u2022'Water': 'to taste',\n\u2022'Vegetable stock': '1/2L',\n\u2022'Salt': 'to taste'", 
                        textAlign: TextAlign.left,
                        style: TextStyle(
                        height: 1.2,
                        fontSize: 20,
                        color: Colors.grey[850])
                    ),
                  ]
                ),
              ),
              SizedBox(height:15),
              Container( padding:EdgeInsets.fromLTRB(10,5,5,5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.shade400, width: 1.0),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [ BoxShadow(
                      color:Colors.grey.shade700,
                      blurRadius: 6,
                      spreadRadius: 2,
                      offset: Offset(-4,-4),
                    )]
                ),
                child: Column( crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Preparation:", 
                      textAlign: TextAlign.left,
                      style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: Color.fromARGB(255, 76, 175, 80))
                    ),
                    SizedBox(height: 5),
                    Text('To make saffron risotto (or risotto Milanese style), first put the pistils in a small glass, pour enough water over them to cover the pistils completely, stir and leave to infuse overnight, this way the pistils will release all their colour. Then prepare the vegetable stock, one litre will be needed for the recipe. Peel and finely chop the onion so that it can melt while cooking and not be perceived while tasting the risotto. In a large saucepan, pour 50 g of butter from the total amount needed, melt it over a low heat, then pour in the chopped onion and stew for 10-15 minutes, adding some stock to keep the sauté from drying out: the onion should be transparent and soft. Once the onion has stewed, pour in the rice and toast it for 3-4 minutes, so that the grains will seal and keep cooking well. Deglaze with the white wine and let it evaporate completely. Now continue cooking for about 18-20 minutes, adding the stock one ladle at a time, as needed, as it is absorbed by the rice: the grains should always be covered. Five minutes before the end of cooking, pour in the water with the saffron pistils you had infused, stir to flavour and dye the risotto a nice golden colour. When the cooking is finished, turn off the heat, season with salt, stir in the grated cheese and the remaining 75 g of butter, stir and cover with the lid and leave to rest for a couple of minutes, at which point the saffron risotto is ready, serve it piping hot, garnishing the dish with a few more pistils.', 
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      height: 1.2,
                      fontSize: 20,
                      color: Colors.grey[850])
                    ),
                  ]
                ),
              ),
              SizedBox(height:100) 
            ]
        ),)
      ),
    );
  }
}



  void _toMainNavigator(BuildContext context){
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const MainNavigator()));
  }//_toHomePage