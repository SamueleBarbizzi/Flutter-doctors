// ignore_for_file: file_names

class CookBook{

  final List<Map> recipeslist = [
    {'id': 1,
    'isSelected': false,
    'isSaved' : false,
    'name': 'Pasta with tomato sauce',
    'calories': 414,
    'course': ['Main1'],
    'meal': ['Lunch', 'Dinner'],
    'ingredients': {
      'Pasta': '80g',
      'Peeled tomatoes': '200g',
      'Extra virgin olive oil': '8g',
      'Garlic': '1 clove',
      'Basil': 'to taste',
      'Fine salt': ', to taste',
      'Coarse salt': 'to taste',
    },
    'preparation': 'To prepare the spaghetti with tomato sauce, start by preparing the sauce. In a frying pan, pour the extra virgin olive oil together with the garlic clove, peeled and divided in half, so you can remove the soul to make the fragrance more delicate. After 2 minutes of cooking over a high flame, add the peeled tomatoes and season with salt. Cover with a lid and cook for at least 1 hour on a very low heat: the sauce should simmer gently. Stir occasionally. After this time has elapsed, remove the garlic and pass the tomatoes through a food mill to obtain a smooth, homogeneous puree. Return the sauce to the pan, turn the heat very low and add the basil leaves. After a few minutes you can turn off the sauce and keep warm. Now you just have to cook the pasta in plenty of boiling, salted water. Drain the spaghetti al dente directly into the sauce and stir a few moments over a high flame to mix everything together. Your spaghetti with tomato sauce is ready, all you have to do is serve and garnish with fresh basil to taste!',
    },

    {'id': 2,
    'isSelected': false,
    'isSaved' : false,
    'name': 'Protein pancakes',
    'calories': 50,
    'course': ['Breakfast'],
    'meal': ['Breakfast'],
    'ingredients': {
      'Egg whites': '150g',
      'Peanut butter': '140g',
      'Oat flakes': '80g',
      'Hazelnut flour': '60g',
      'Acacia honey': '50g',
    },
    'preparation': 'To prepare the protein pancakes, pour the hazelnut flour, oat flakes and egg whites into a bowl. Also add the peanut butter and honey. Mix all the ingredients together with a whisk and finally add the milk. Stir again to obtain an even batter. Heat a non-stick frying pan, which you have lightly buttered with the help of kitchen foil. Pour a couple of ladlefuls of batter into the pan and cook for 2 minutes, without touching. Turn the pancakes over and cook for one minute on the other side. As they are ready, stack them one on top of the other and continue cooking the others: you will get about 12 pancakes in total. Serve the protein pancakes immediately, garnishing them with ingredients of your choice!',
    },

    {'id': 3,
    'isSelected': false,
    'isSaved' : false,
    'name': 'Spaghetti with tuna',
    'calories': 398,
    'course': ['Main1'],
    'meal': ['Lunch', 'Dinner'],
    'ingredients': {
      
      'Spaghetti': '80g',
      'Tuna in oil': '40g',
      'Peeled tomatoes': '100g',
      'Extra virgin olive oil': 'to taste',
      'Fine salt': 'to taste',
      'Black pepper': 'to taste',
      'Basil': 'to taste',
      'Golden onions': '1/4',
    },
    'preparation': 'To prepare the spaghetti with tuna, start by heating a pot full of water on the stove, when it boils add salt to taste: it will be used for cooking the pasta. Drain the tuna fillet from its preservation oil. In the meantime, clean the onion, slice it thinly. Heat the olive oil in a pan and add the sliced onion. Let it wilt over a low heat for a few minutes, stirring often. Slice the tuna with your hands and add it to the pan when the onion has softened and let it brown for a couple of minutes, stirring constantly. Now mash the peeled tomatoes with a fork and pour them into the pan with the tuna; let the sauce cook for about 10 minutes. In the meantime, boil the spaghetti, cook them al dente: by the time the pasta is cooked, the sauce will also be ready. Strain the spaghetti directly into the pan with the tuna, season with ground pepper, turn off the heat and season with fresh basil leaves. Stir and serve your spaghetti with tuna hot!'
    },

    {'id': 4,
    'isSelected': false,
    'isSaved' : false,
    'name': 'Pasta with courgettes',
    'calories': 369,
    'course': ['Main1'],
    'meal': ['Lunch', 'Dinner'],
    'ingredients': {
      'Farfalle': '80g',
      'Zucchini': '160g',
      'Basil': 'to taste',
      'Fine salt': 'to taste',
      'Extra virgin olive oil': '5g',
      'Black pepper': 'to taste',
      'Garlic': '1 clove',
    },
    'preparation': 'To prepare pasta and courgettes, you can boil water in a large saucepan and salt it when it comes to the boil. Meanwhile, wash and dry the courgettes, trim them and then grate them with a coarse-hole grater. In a large enough pan, pour the extra virgin olive oil and heat it over low heat together with a whole clove of garlic, already peeled. As soon as the oil is hot, add the courgettes, season with salt and pepper and let them cook for 5-6 minutes, stirring occasionally, then remove the garlic. In the meantime, boil the pasta in boiling salted water and drain it al dente, keeping a little cooking water to one side. Pour the pasta directly into the pan with the courgettes, together with a little cooking water, stir for a few moments and then turn off. Perfume with a little basil chopped by hand and your pasta and courgettes is ready to be enjoyed.'
    },
    
    {'id': 5,
    'isSelected': false,
    'isSaved' : false,
    'name': 'Chickpea and broccoli pasta soup',
    'calories': 426,
    'course': ['Main1'],
    'meal': ['Lunch', 'Dinner'],
    'ingredients': {
       
      'Mini Pipe Rigate': '75g',
      'Auburn Tomatoes': '40g',
      'Fresh Spring Onion': '20g',
      'Pre-cooked Chickpeas': '100g',
      'Broccoli': '1 leaf',
      'Water': '1L',
      'Extra Virgin Olive Oil': 'to taste',
      'Fine Salt': 'to taste',
      'Black Pepper': 'to taste',
    },
    'preparation': 'To prepare the chickpea and broccoli pasta soup, start by slicing the white part of the spring onion, then wash and dice the tomato into medium-sized pieces. Remove the florets from the broccoli and rinse them. In a large saucepan, pour a little oil and sauté the spring onion over a gentle flame, stirring often with a wooden spoon. After about 1 minute, you can add the diced tomatoes, the bay leaf (fresh or dried), the broccoli florets and 200 g of pre-cooked chickpeas, drained of their storage water. Stir everything together and cook over medium heat. After a few minutes, add water, keeping only 100 g of the total amount aside. Add salt to taste and cook the soup over a medium heat for about 10 minutes. In a separate bowl pour the remaining 200 g of chickpeas and add the 100 g of water kept aside, then blend everything with an immersion blender. After the soup has cooked for 10 minutes, add the pureed chickpeas. Cook for a further 5-8 minutes, taking care to remove the bay leaf, before adding the pasta, cooking for 5 minutes. Stir occasionally and, once ready, serve your soup with a drizzle of oil on each plate. The chickpea and broccoli pasta soup is ready to be enjoyed piping hot!'
    },

    {'id': 6,
    'isSelected': false,
    'isSaved' : false,
    'name': 'Baked plaice fillets',
    'calories': 180,
    'course': ['Main2'],
    'meal': ['Lunch', 'Dinner'],
    'ingredients': {
       
      'Plaice Fillets': '100g',
      'Fresh Spring Onion': '75g',
      'Extra Virgin Olive Oil': 'to taste',
      'Fine Salt': 'to taste',
      'Black Pepper': 'to taste',
      'Rosemary': '1 sprig',
      'Sage': '4 leaves',
      'Thyme': '2 sprigs',
      'Lemons': '1',
    },
    'preparation': 'To make the baked plaice fillets, start by cleaning the spring onions: trim the base, cut off the green part of the stem and rinse them under running water. Cut the spring onions in half lengthwise and place them in an oven dish, season with oil, salt and pepper. Chop the sage, thyme and rosemary with a knife, wash the lemon, dry it and cut it into thin slices. Grease a baking tray with olive oil. Place the plaice fillets on it, season with pepper and salt, season with the chopped herbs and then distribute the lemon slices over the fillets. Finally, place the spring onions in the baking dish between the fillets, season with salt and pepper and bake in a static oven preheated to 220° for 20 minutes. When cooked, take the baked plaice fillets out of the oven and season with a drizzle of raw oil before serving.'
    },

    {'id': 7,
    'isSelected': false,
    'isSaved' : false,
    'name': 'Poached eggs',
    'calories': 143,
    'course': ['Side'],
    'meal': ['Lunch', 'Dinner'],
    'ingredients': {
    
      'Eggs': '1',
      'White wine vinegar': '3g',
      'Coarse salt': 'to taste',
    },
    'preparation': 'To prepare the poached eggs, fill a large saucepan with water, leaving 4-5 cm from the edge. Turn on a moderate heat, then pour in the white wine vinegar and coarse salt. When the salt has dissolved and the water starts to boil slightly (it should not boil vehemently), lower the heat and stir with a spoon in the same direction to create a vortex in the water. Break an egg into a small bowl and pour it into the centre of the vortex. Let the egg cook for 2 minutes, without stirring or moving the egg: after 2 minutes you will get a liquid yolk, if you prefer you can extend the cooking time slightly. Gently strain the egg with the help of a skimmer and place it on a plate. Your poached eggs are ready to be enjoyed while still hot!'
    },

    {'id': 8,
    'isSelected': false,
    'isSaved' : false,
    'name': 'Apple and hazelnut porridge',
    'calories': 277,
    'course': ['Breakfast'],
    'meal': ['Breakfast'],
    'ingredients': {
       
      'Oat flakes': '70g',
      'Whole milk': '100g',
      'Water': '110g',
      'Fuji apples': '1',
      'Hazelnut kernels': '10g',
      'Acacia honey': '40g',
      'Cinnamon powder': '1 pinch',
      'Salt': '1 pinch',
    },
    'preparation': 'To prepare the apple and hazelnut porridge start with the oats: pour the water, milk and a pinch of salt into a saucepan and then add the oat flakes, stirring with a marisa. Now turn on the heat and cook over medium-low heat and stir. Cook the porridge for 4-6 minutes, continuing to stir until it has reached your preferred consistency: it should be creamy and very thick. When ready, turn off the heat and add 1 pinch of cinnamon. Stir well and then transfer the porrdige into two small breakfast bowls, setting them aside for a moment. Now take care of the apples: wash your apple well and cut it into very thin rounds, about 4 millimetres thick. Pour the honey into a frying pan, taking care to leave a couple of teaspoons aside for garnishing the porridge 8 later; let it melt over a gentle heat for 1-2 minutes. Add the sliced apples and let them melt for a minute. Turn the apples with the help of tongs and let them caramelise for one minute on the other side as well. At this point you can compose your apple and hazelnut porridge: take the small bowls and arrange a few apple slices on top of the soup, add the hazelnut kernels, sprinkle with a pinch of cinnamon and pour in a teaspoon of honey. If desired, you can decorate with more hazelnut kernels. Your apple and hazelnut porridge is ready to be enjoyed!'
    },

    {'id': 9,
    'isSelected': false,
    'isSaved' : false,
    'name': 'Spaghetti with clams',
    'calories': 420,
    'course': ['Main1'],
    'meal': ['Lunch', 'Dinner'],
    'ingredients': {
       
      'Spaghetti': '80g',
      'Clams': '250g',
      'Garlic': '1 clove',
      'Parsley': '1 bunch',
      'Extra virgin olive oil': 'to taste',
      'Black pepper': 'to taste',
      'Fine salt': 'to taste',
      'Coarse salt': 'to taste',
    },
    'preparation': 'To prepare spaghetti with clams, start by cleaning them. Make sure there are no broken or empty shells; they should be discarded. Next, beat them against the sink, or possibly on a chopping board. This operation is important to check that there is no sand inside: healthy bivalves will remain closed, while those full of sand will open. Then place the clams in a bowl and rinse them. Add coarse salt. Let the clams soak for 2-3 hours. After this time, the clams will have purged any residual sand, drain and rinse them. Heat a little oil in a pan. Then add a clove of garlic and let it brown. Then plunge the clams into the hot pan. Close the lid and leave to cook for a few minutes over a high flame. The clams will open with the heat, so shake the pan from time to time until they have completely opened. In the meantime, finely chop the parsley. As soon as all the clams have opened turn off the heat immediately, otherwise the clams will overcook. Cook the spaghetti in plenty of lightly salted water for half the cooking time indicated on the packet. Meanwhile, filter the clams, placing a bowl underneath and remembering to remove the garlic. In this way you will collect the clam cooking water in the bowl. Transfer it to the pan where you had cooked the clams and as soon as the spaghetti are ready, drain them, keeping the cooking water aside. Transfer them to the pan with the sauce. Add a ladle of cooking water, season with pepper and finish cooking the spaghetti, adding more water if necessary. When they are ready, add the clams. Add the parsley, toss briefly and serve your spaghetti with clams immediately.'
    },

    {'id': 10,
    'isSelected': false,
    'isSaved' : false,
    'name': 'Chicken breast',
    'calories': 419,
    'course': ['Main2'],
    'meal': ['Lunch', 'Dinner'],
    'ingredients': {

      'Chicken Breast': '200g',
      'Extra Virgin Olive Oil': '1 spoon',
      'Rosemary': '1 sprig',
      'Fine Salt': 'to taste',
      'Black Pepper': 'to taste',
    },
    'preparation': 'To prepare the milk-fed chicken breasts, start by cleaning the meat from the pieces of cartilage and excess fat. Now separate the two breasts and cut 4 slices from each. Place them on a cutting board and use a meat pounder to beat them into thin slices. Place the oil in a pan and flour the chicken slices. Gradually transfer them to the pan, turn up the heat slightly and wait about 2 minutes until a nice crust has formed. Then turn the slices over, wait a couple of minutes again and pour first the milk and then the rosemary into the pan. Season with salt and pepper, cover with a lid and cook for another 4-5 minutes until the milk has thickened. Now all you have to do is serve your chicken breasts in milk still hot!'
    },

    {'id': 11,
    'isSelected': false,
    'isSaved' : false,
    'name': 'Chicken breast in milk ',
    'calories': 363,
    'course': ['Main2'],
    'meal': ['Lunch', 'Dinner'],
    'ingredients': {

      'Chicken Breast': '150g',
      'Butter': '10g',
      'Extra Virgin Olive Oil': '5g',
      'Whole Milk': '50g',
      '00 flour': 'to taste',
      'Thyme': '2 sprigs',
      'Fine Salt': 'to taste',
      'Black Pepper': 'to taste',
    },
    'preparation': 'To prepare the milk-fed chicken breasts, start by cleaning the meat from the pieces of cartilage and excess fat. Now separate the two breasts and cut 4 slices from each. Place them on a cutting board and use a meat pounder to beat them into thin slices. Place the oil in a pan and flour the chicken slices. Gradually transfer them to the pan, turn up the heat slightly and wait about 2 minutes until a nice crust has formed. Then turn the slices over, wait a couple of minutes again and pour first the milk and then the rosemary into the pan. Season with salt and pepper, cover with a lid and cook for another 4-5 minutes until the milk has thickened. Now all you have to do is serve your chicken breasts in milk still hot!'
    },

    {'id': 12,
    'isSelected': false,
    'isSaved' : false,
    'name': 'Fresh salad',
    'calories': 60,
    'course': ['Side'],
    'meal': ['Lunch', 'Dinner'],
    'ingredients': {
      'Salad': '100 g',
    },
    'preparation': 'Use ready-made bagged salad. Alternatively, if you have bought a bunch of salad, put it in a basin of water selecting the best leaves, rinse them and then spin to dry.'
    },

    {'id': 13,
    'isSelected': false,
    'isSaved' : false,
    'name': 'Saffron risotto',
    'calories': 626,
    'course': ['Main1'],
    'meal': ['Lunch', 'Dinner'],
    'ingredients': {
      'Saffron': '1/2 tsp',
      'Rice': ' 80g',
      'Butter': '35g',
      'Onion': '1/2',
      'Grana Padano cheese': '20g',
      'White wine': '10g',
      'Water': 'to taste',
      'Vegetable stock': '1/2L',
      'Salt': 'to taste',
    },
    'preparation': 'To make saffron risotto (or risotto Milanese style), first put the pistils in a small glass, pour enough water over them to cover the pistils completely, stir and leave to infuse overnight, this way the pistils will release all their colour. Then prepare the vegetable stock, one litre will be needed for the recipe. Peel and finely chop the onion so that it can melt while cooking and not be perceived while tasting the risotto. In a large saucepan, pour 50 g of butter from the total amount needed, melt it over a low heat, then pour in the chopped onion and stew for 10-15 minutes, adding some stock to keep the sauté from drying out: the onion should be transparent and soft. Once the onion has stewed, pour in the rice and toast it for 3-4 minutes, so that the grains will seal and keep cooking well. Deglaze with the white wine and let it evaporate completely. Now continue cooking for about 18-20 minutes, adding the stock one ladle at a time, as needed, as it is absorbed by the rice: the grains should always be covered. Five minutes before the end of cooking, pour in the water with the saffron pistils you had infused, stir to flavour and dye the risotto a nice golden colour. When the cooking is finished, turn off the heat, season with salt, stir in the grated cheese and the remaining 75 g of butter, stir and cover with the lid and leave to rest for a couple of minutes, at which point the saffron risotto is ready, serve it piping hot, garnishing the dish with a few more pistils.'
    },

    {'id': 14,
    'isSelected': false,
    'isSaved' : false,
    'name': 'Tomato Risotto',
    'calories': 550,
    'course': ['Main1'],
    'meal': ['Lunch', 'Dinner'],
    'ingredients': {
      'Rice': '100g',
      'Cherry tomatoes': '100g',
      'Tomato puree': '1 tbsp',
      'Vegetable stock': '1/2L',
      'Golden onions': '1/2',
      'Grana Padano cheese': '10g',
      'Extra virgin olive oil': '1 tbsp',
      'Butter': '10g',
      'Basil': 'to taste',
      'Fine salt': 'to taste',
    },
    'preparation': 'To prepare the risotto with tomato, start by sautéing a finely chopped onion in 3 tablespoons of oil over low heat for about 10 minutes; the onion should not burn but become transparent. After this time, pour in the rice and toast it for a couple of minutes. Then deglaze with a ladleful of vegetable stock and let it evaporate. Add the peeled cherry tomatoes to which you have added a teaspoon of sugar to remove the acidity, stir well and add a ladle of stock. Add two tablespoons of tomato puree to taste. Continue to add a ladle of stock every time the risotto dries out, until it is cooked. When the cooking is almost finished, add chopped basil, according to your taste and adjust the salt if necessary. Then remove the saucepan from the heat and stir in the butter, finally add the grated Grana Padano 8 cheese and stir. Serve the tomato risotto hot and garnished with a few basil leaves.'
    },

    {'id': 15,
      'isSelected': false,
      'isSaved' : false,
      'name': 'Baked salmon',
      'calories': 435,
      'course': ['Main2'],
      'meal': ['Lunch', 'Dinner'],
      'ingredients': {
        'Salmon steaks': '170g',
        'Potatoes': '50g',
        'Lemon peel': '1/2 lemon',
        'Lemon juice': '10g',
        'Dry white wine': '15g',
        'Extra virgin olive oil': '1/2 spoon',
        'Parsley': 'to taste',
        'Fine salt': 'to taste',
        'Black pepper': 'to taste',
      },
      'preparation': 'To cook the baked salmon fillet, first remove the fish bones with tweezers and check that there are no bones left by running a fingertip over the flesh. Remove the backbone with a knife, then roll one end onto itself and wrap the other end around the fillet to form a medallion. Tie the medallion with kitchen string so that it keeps its shape even when cooking and transfer the medallions to a baking tray lined with baking paper. Take a fairly regular shaped potato, wash it and cut it into thin slices with a mandoline, without peeling it: the slices must be no more than 1 mm thick otherwise they will not be cooked enough. Now deal with the emulsion: grate the zest of one lemon into a bowl, then add 15 g lemon juice, oil, white wine, chopped parsley, salt and pepper and mix well with a fork. Season the salmon medallions with some of the emulsion, then cover them with the slightly overlapping potato discs and sprinkle the potatoes with the remaining emulsion. When the medallions are ready, bake in a static oven preheated to 180° for about 20 minutes, then turn the grill to 240° and continue cooking for another 3-4 minutes, until the potatoes are golden brown. When the cooking time has elapsed, remove the cooking string and serve your delicious baked salmon with potatoes immediately!'
      },


    {'id': 16,
    'isSelected': false,
    'isSaved' : false,
    'name': 'Omelette',
    'calories': 287,
    'course': ['Breakfast', 'Main2'],
    'meal': ['Breakfast','Lunch', 'Dinner'],
    'ingredients': {
      'Eggs': '2',
      'Fine Salt': 'to taste',
      'Whole Milk': '30g',
      'Extra Virgin Olive Oil': '15g',
    },
    'preparation': 'To prepare the omelettes, first break the eggs in a bowl. Add the milk and a pinch of salt. Then beat the eggs using a whisk, so that they are mixed with the milk. They will be ready when you lift up the whisk and the mixture comes down in a flush. Heat a pan on the stove and add a little extra virgin olive oil. As soon as it is hot, pour the egg mixture into it; to see if the oil is hot enough, try pouring in a few drops first. Cook the omelette over a moderate flame: with slow cooking, the egg will remain softer. The outside should be golden brown but not too much, as soon as it starts to set on the edges, cover with a lid 8. If the temperature seems too high, remove the pan from the heat for a few seconds, still keeping the lid on. Rotate the pan gently to prevent the omelette from remaining in one place for too long. As soon as the omelette is soft on the surface (i.e. slobbery) and the underside is golden brown when you lift the edge with a spatula, fold the omelette into a crescent shape, wait a few seconds more in the pan and serve your omelette piping hot.'
    },

    
  ];

}//Ingredients

/*{'id': num,
    'isSelected': false,
    'isSaved' : false,
    'name': '',
    'calories': num,
    'course': [''],
    'meal': [''],
    'ingredients': {
      'ingredient1': 'quantity1',
      'ingredient2': 'quantity2',
      'ingredient3': 'quantity3',
      'ingredient4': 'quantity4',
      'ingredient5': 'quantity5',
    },
    'preparation': ''
    },*/