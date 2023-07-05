// ignore_for_file: file_names


//import 'package:flutter/material.dart';
//class IngredientsList extends ChangeNotifier{

class IngredientsList{

// List of all ingredients
  final List<Map> ingredientslist = [
    {'id': 1,
    'name': 'Pasta',
    'course': 'Main1',
    'isSelected': false},

    {'id': 2,
    'name': 'Peeled tomatoes',
    'course': 'Main1',
    'isSelected': false},

    {'id': 3,
    'name': 'Extra virgin olive oil',
    'course': 'Main2',
    'group': 'Spice',
    'isSelected': false},

    {'id': 4,
    'name': 'Garlic',
    'course': 'Main2',
    'group': 'Spice',
    'isSelected': false},

    {'id': 5,
    'name': 'Basil',
    'course': 'Main2',
    'group': 'Spice',
    'isSelected': false},

    {'id': 6,
    'name': 'Fine salt',
    'course': 'Main2',
    'group': 'Spice',
    'isSelected': false},

    {'id': 7,
    'name': 'Coarse salt',
    'course': 'Main1',
    'group': 'Spice',
    'isSelected': false},

    {'id': 8,
    'name': 'Egg whites',
    'course': 'Breakfast',
    'isSelected': false},

    {'id': 9,
    'name': 'Peanut butter',
    'course': 'Breakfast',
    'isSelected': false},

    {'id': 10,
    'name': 'Oat flakes',
    'course': 'Breakfast',
    'isSelected': false},
   
    {'id': 11,
    'name': 'Hazelnut flour',
    'course': 'Main1',
    'isSelected': false},

    {'id': 12,
    'name': 'Acacia honey',
    'course': 'Breakfast',
    'isSelected': false},
  
    {'id': 13,
    'name': 'Spaghetti',
    'course': 'Main1',
    'isSelected': false},
    
    {'id': 14,
    'name': 'Tuna in oil',
    'course': 'Main1',
    'isSelected': false},

    {'id': 15,
    'name': 'Black pepper',
    'course': 'Main2',
    'group': 'Spice',
    'isSelected': false},

    {'id': 16,
    'name': 'Golden onions',
    'course': 'Main1',
    'isSelected': false},

    {'id': 17,
    'name': 'Farfalle',
    'course': 'Main1',
    'isSelected': false},

    {'id': 18,
    'name': 'Zucchini',
    'course': 'Main1',
    'isSelected': false},

    {'id': 19,
    'name': 'Mini Pipe Rigate',
    'course': 'Main1',
    'isSelected': false},

    {'id': 20,
    'name': 'Auburn Tomatoes',
    'course': 'Main1',
    'isSelected': false},

    {'id': 21,
    'name': 'Fresh Spring Onion',
    'course': 'Main2',
    'isSelected': false},

    {'id': 21,
    'name': 'Pre-cooked Chickpeas',
    'course': 'Main2',
    'isSelected': false},

    {'id': 22,
    'name': 'Broccoli',
    'course': 'Main2',
    'isSelected': false},    

    {'id': 24,
    'name': 'Plaice Fillets',
    'course': 'Main2',
    'isSelected': false},

    {'id': 25,
    'name': 'Rosemary',
    'course': 'Main2',
    'group': 'Spice',
    'isSelected': false},

    {'id': 26,
    'name': 'Sage',
    'course': 'Main2',
    'group': 'Spice',
    'isSelected': false},

    {'id': 27,
    'name': 'Thyme',
    'course': 'Main2',
    'group': 'Spice',
    'isSelected': false},

    {'id': 28,
    'name': 'Lemons',
    'course': 'Main2',
    'isSelected': false},

    {'id': 29,
    'name': 'Eggs',
    'course': 'Main2',
    'isSelected': false},

    {'id': 30,
    'name': 'White wine vinegar',
    'course': 'Main2',
    'isSelected': false},

    {'id': 31,
    'name': 'Whole milk',
    'course': 'Main2',
    'isSelected': false},

    {'id': 32,
    'name': 'Fuji apples',
    'course': 'Main2',
    'isSelected': false},

    {'id': 33,
    'name': 'Hazelnut kernels',
    'course': 'Main2',
    'isSelected': false},

    {'id': 34,
    'name': 'Cinnamon powder',
    'course': 'Main2',
    'isSelected': false},

    {'id': 35,
    'name': 'Salt',
    'course': 'Main2',
    'group': 'Spice',
    'isSelected': false},

    {'id': 36,
    'name': 'Clams',
    'course': 'Main2',
    'isSelected': false},

    {'id': 37,
    'name': 'Parsley',
    'course': 'Main2',
    'isSelected': false},

    {'id': 38,
    'name': 'Chicken Breast',
    'course': 'Main2',
    'isSelected': false},

    {'id': 39,
    'name': 'Butter',
    'course': 'Breakfast',
    'isSelected': false},

    {'id': 40,
    'name': '00 flour',
    'course': 'Main2',
    'isSelected': false},

    {'id': 41,
    'name': 'Salad',
    'course': 'Side',
    'isSelected': false},

    {'id': 42,
    'name': 'Saffron',
    'course': 'Main2',
    'isSelected': false},

    {'id': 43,
    'name': 'Rice',
    'course': 'Main1',
    'isSelected': false},

    {'id': 44,
    'name': 'Onion',
    'course': 'Main2',
    'isSelected': false},

    {'id': 45,
    'name': 'Grana Padano cheese',
    'course': 'Main2',
    'isSelected': false},

    {'id': 46,
    'name': 'White wine',
    'course': 'Main2',
    'isSelected': false},

    {'id': 47,
    'name': 'Vegetable stock',
    'course': 'Main2',
    'isSelected': false},

    {'id': 48,
    'name': 'Cherry tomatoes',
    'course': 'Main2',
    'isSelected': false},

    {'id': 49,
    'name': 'Tomato puree',
    'course': 'Main1',
    'isSelected': false},

    {'id': 50,
    'name': 'Salmon steaks',
    'course': 'Main2',
    'isSelected': false},

    {'id': 51,
    'name': 'Potatoes',
    'course': 'Main2',
    'isSelected': false},

    {'id': 52,
    'name': 'Lemon peel',
    'course': 'Main2',
    'isSelected': false},

    {'id': 53,
    'name': 'Lemon juice',
    'course': 'Main2',
    'isSelected': false},

    {'id': 54,
    'name': 'Dry white wine',
    'course': 'Main2',
    'isSelected': false},

  ];

}//Ingredients

/*
{'id': 1,
    'name': 'ingredient',
    'course': 'course#'
    'isSelected': false},
*/ 