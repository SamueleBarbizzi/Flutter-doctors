// ignore_for_file: file_names

class CookBook {
  final List<Map> recipeslist = [
    {
      'id': 1,
      'isSelected': false,
      'isSaved': false,
      'name': 'Pasta with tomato sauce',
      'calories': 414,
      'course': ['Main1'],
      'meal': ['Lunch', 'Dinner'],
      'ingredients': {
        'Pasta': '80 g',
        'Tomatoes': '200 g',
        'Extra virgin olive oil': '8 g',
        'Garlic': '1 clove',
        'Basil': 'to taste',
        'Fine salt': 'to taste',
        'Coarse salt': 'to taste',
      },
      'preparation':
          'To prepare the spaghetti with tomato sauce, start by preparing the sauce. In a frying pan, pour the extra virgin olive oil together with the garlic clove, peeled and divided in half, so you can remove the soul to make the fragrance more delicate. After 2 minutes of cooking over a high flame, add the peeled tomatoes and season with salt. Cover with a lid and cook for at least 1 hour on a very low heat: the sauce should simmer gently. Stir occasionally. After this time has elapsed, remove the garlic and pass the tomatoes through a food mill to obtain a smooth, homogeneous puree. Return the sauce to the pan, turn the heat very low and add the basil leaves. After a few minutes you can turn off the sauce and keep warm. Now you just have to cook the pasta in plenty of boiling, salted water. Drain the spaghetti al dente directly into the sauce and stir a few moments over a high flame to mix everything together. Your spaghetti with tomato sauce is ready, all you have to do is serve and garnish with fresh basil to taste!',
      'url':
          'https://orapesce.it/cdn/shop/articles/penne-pomodoro-basilico-sgombro.jpg?v=1650380627'
    },
    {
      'id': 2,
      'isSelected': false,
      'isSaved': false,
      'name': 'Protein pancakes',
      'calories': 50,
      'course': ['Breakfast'],
      'meal': ['Breakfast'],
      'ingredients': {
        'Eggs': '150 g',
        'Peanut butter': '140 g',
        'Oat flakes': '80 g',
        'Hazelnut flour': '60 g',
        'Honey': '50 g',
      },
      'preparation':
          'To prepare the protein pancakes, pour the hazelnut flour, oat flakes and egg whites into a bowl. Also add the peanut butter and honey. Mix all the ingredients together with a whisk and finally add the milk. Stir again to obtain an even batter. Heat a non-stick frying pan, which you have lightly buttered with the help of kitchen foil. Pour a couple of ladlefuls of batter into the pan and cook for 2 minutes, without touching. Turn the pancakes over and cook for one minute on the other side. As they are ready, stack them one on top of the other and continue cooking the others: you will get about 12 pancakes in total. Serve the protein pancakes immediately, garnishing them with ingredients of your choice!',
      'url':
          'https://www.giallozafferano.it/images/243-24385/Pancake-proteici_650x433_wm.jpg'
    },
    {
      'id': 3,
      'isSelected': false,
      'isSaved': false,
      'name': 'Spaghetti with tuna',
      'calories': 398,
      'course': ['Main1'],
      'meal': ['Lunch', 'Dinner'],
      'ingredients': {
        'Spaghetti': '80 g',
        'Tuna in oil': '40 g',
        'Tomatoes': '100 g',
        'Extra virgin olive oil': 'to taste',
        'Fine salt': 'to taste',
        'Black pepper': 'to taste',
        'Basil': 'to taste',
        'White onions': '1/4',
      },
      'preparation':
          'To prepare the spaghetti with tuna, start by heating a pot full of water on the stove, when it boils add salt to taste: it will be used for cooking the pasta. Drain the tuna fillet from its preservation oil. In the meantime, clean the onion, slice it thinly. Heat the olive oil in a pan and add the sliced onion. Let it wilt over a low heat for a few minutes, stirring often. Slice the tuna with your hands and add it to the pan when the onion has softened and let it brown for a couple of minutes, stirring constantly. Now mash the peeled tomatoes with a fork and pour them into the pan with the tuna; let the sauce cook for about 10 minutes. In the meantime, boil the spaghetti, cook them al dente: by the time the pasta is cooked, the sauce will also be ready. Strain the spaghetti directly into the pan with the tuna, season with ground pepper, turn off the heat and season with fresh basil leaves. Stir and serve your spaghetti with tuna hot!',
      'url':
          'https://www.giallozafferano.it/images/176-17670/Spaghetti-al-tonno_650x433_wm.jpg'
    },
    {
      'id': 4,
      'isSelected': false,
      'isSaved': false,
      'name': 'Risotto with zucchini',
      'calories': 520,
      'course': ['Main1'],
      'meal': ['Lunch', 'Dinner'],
      'ingredients': {
        'Rice': '80 g',
        'Zucchini': '80 g',
        'Vegetable stock': '1 L',
        'White onions': '20 g',
        'White wine': '25 g',
        'Butter': '20 g',
        'Grated cheese': '30 g',
        'Fine salt': 'to taste',
        'Black pepper': 'to taste',
        'Extra virgin olive oil': 'to taste',
        'Mint': '5 leaves',
      },
      'preparation':
          'To prepare pasta and courgettes, you can boil water in a large saucepan and salt it when it comes to the boil. Meanwhile, wash and dry the courgettes, trim them and then grate them with a coarse-hole grater. In a large enough pan, pour the extra virgin olive oil and heat it over low heat together with a whole clove of garlic, already peeled. As soon as the oil is hot, add the courgettes, season with salt and pepper and let them cook for 5-6 minutes, stirring occasionally, then remove the garlic. In the meantime, boil the pasta in boiling salted water and drain it al dente, keeping a little cooking water to one side. Pour the pasta directly into the pan with the courgettes, together with a little cooking water, stir for a few moments and then turn off. Perfume with a little basil chopped by hand and your pasta and courgettes is ready to be enjoyed.',
      'url':
          'https://blog.giallozafferano.it/piattiprontiinunattimo/wp-content/uploads/2018/06/risotto-alle-zucchine-2-web.jpg'
    },
    {
      'id': 5,
      'isSelected': false,
      'isSaved': false,
      'name': 'Chickpea and broccoli pasta soup',
      'calories': 426,
      'course': ['Main1'],
      'meal': ['Lunch', 'Dinner'],
      'ingredients': {
        'Pasta': '75 g',
        'Tomatoes': '40 g',
        'Fresh Spring Onion': '20 g',
        'Chickpeas': '100 g',
        'Broccoli': '1 leaf',
        'Water': '1 L',
        'Extra Virgin Olive Oil': 'to taste',
        'Fine Salt': 'to taste',
        'Black Pepper': 'to taste',
      },
      'preparation':
          'To prepare the chickpea and broccoli pasta soup, start by slicing the white part of the spring onion, then wash and dice the tomato into medium-sized pieces. Remove the florets from the broccoli and rinse them. In a large saucepan, pour a little oil and sauté the spring onion over a gentle flame, stirring often with a wooden spoon. After about 1 minute, you can add the diced tomatoes, the bay leaf (fresh or dried), the broccoli florets and 200 g of pre-cooked chickpeas, drained of their storage water. Stir everything together and cook over medium heat. After a few minutes, add water, keeping only 100 g of the total amount aside. Add salt to taste and cook the soup over a medium heat for about 10 minutes. In a separate bowl pour the remaining 200 g of chickpeas and add the 100 g of water kept aside, then blend everything with an immersion blender. After the soup has cooked for 10 minutes, add the pureed chickpeas. Cook for a further 5-8 minutes, taking care to remove the bay leaf, before adding the pasta, cooking for 5 minutes. Stir occasionally and, once ready, serve your soup with a drizzle of oil on each plate. The chickpea and broccoli pasta soup is ready to be enjoyed piping hot!',
      'url':
          'https://www.giallozafferano.it/images/ricette/179/17946/foto_hd/hd650x433_wm.jpg'
    },
    {
      'id': 6,
      'isSelected': false,
      'isSaved': false,
      'name': 'Baked plaice fillets',
      'calories': 180,
      'course': ['Main2'],
      'meal': ['Lunch', 'Dinner'],
      'ingredients': {
        'Plaice Fillets': '100 g',
        'Fresh Spring Onion': '75 g',
        'Extra Virgin Olive Oil': 'to taste',
        'Fine Salt': 'to taste',
        'Black Pepper': 'to taste',
        'Rosemary': '1 sprig',
        'Sage': '4 leaves',
        'Thyme': '2 sprigs',
        'Lemons': '1',
      },
      'preparation':
          'To make the baked plaice fillets, start by cleaning the spring onions: trim the base, cut off the green part of the stem and rinse them under running water. Cut the spring onions in half lengthwise and place them in an oven dish, season with oil, salt and pepper. Chop the sage, thyme and rosemary with a knife, wash the lemon, dry it and cut it into thin slices. Grease a baking tray with olive oil. Place the plaice fillets on it, season with pepper and salt, season with the chopped herbs and then distribute the lemon slices over the fillets. Finally, place the spring onions in the baking dish between the fillets, season with salt and pepper and bake in a static oven preheated to 220° for 20 minutes. When cooked, take the baked plaice fillets out of the oven and season with a drizzle of raw oil before serving.',
      'url':
          'https://blog.giallozafferano.it/azuccherozero/wp-content/uploads/2020/03/Filetti-di-platessa-al-forno-dorati-e-leggeri-o02.jpeg'
    },
    {
      'id': 7,
      'isSelected': false,
      'isSaved': false,
      'name': 'Poached eggs',
      'calories': 143,
      'course': ['Side'],
      'meal': ['Lunch', 'Dinner'],
      'ingredients': {
        'Eggs': '1',
        'White wine vinegar': '3 g',
        'Coarse salt': 'to taste',
      },
      'preparation':
          'To prepare the poached eggs, fill a large saucepan with water, leaving 4-5 cm from the edge. Turn on a moderate heat, then pour in the white wine vinegar and coarse salt. When the salt has dissolved and the water starts to boil slightly (it should not boil vehemently), lower the heat and stir with a spoon in the same direction to create a vortex in the water. Break an egg into a small bowl and pour it into the centre of the vortex. Let the egg cook for 2 minutes, without stirring or moving the egg: after 2 minutes you will get a liquid yolk, if you prefer you can extend the cooking time slightly. Gently strain the egg with the help of a skimmer and place it on a plate. Your poached eggs are ready to be enjoyed while still hot!',
      'url':
          'https://www.giallozafferano.it/images/232-23235/Uova-in-camicia_650x433_wm.jpg'
    },
    {
      'id': 8,
      'isSelected': false,
      'isSaved': false,
      'name': 'Apple and hazelnut porridge',
      'calories': 277,
      'course': ['Breakfast'],
      'meal': ['Breakfast'],
      'ingredients': {
        'Oat flakes': '70 g',
        'Milk': '100 g',
        'Water': '110 g',
        'Apples': '1',
        'Hazelnut kernels': '10 g',
        'Honey': '40 g',
        'Cinnamon': '1 pinch in powder',
        'Salt': '1 pinch',
      },
      'preparation':
          'To prepare the apple and hazelnut porridge start with the oats: pour the water, milk and a pinch of salt into a saucepan and then add the oat flakes, stirring with a marisa. Now turn on the heat and cook over medium-low heat and stir. Cook the porridge for 4-6 minutes, continuing to stir until it has reached your preferred consistency: it should be creamy and very thick. When ready, turn off the heat and add 1 pinch of cinnamon. Stir well and then transfer the porrdige into two small breakfast bowls, setting them aside for a moment. Now take care of the apples: wash your apple well and cut it into very thin rounds, about 4 millimetres thick. Pour the honey into a frying pan, taking care to leave a couple of teaspoons aside for garnishing the porridge 8 later; let it melt over a gentle heat for 1-2 minutes. Add the sliced apples and let them melt for a minute. Turn the apples with the help of tongs and let them caramelise for one minute on the other side as well. At this point you can compose your apple and hazelnut porridge: take the small bowls and arrange a few apple slices on top of the soup, add the hazelnut kernels, sprinkle with a pinch of cinnamon and pour in a teaspoon of honey. If desired, you can decorate with more hazelnut kernels. Your apple and hazelnut porridge is ready to be enjoyed!',
      'url':
          'https://www.giallozafferano.it/images/170-17046/Porridge-mele-e-nocciole_780x520_wm.jpg'
    },
    {
      'id': 9,
      'isSelected': false,
      'isSaved': false,
      'name': 'Spaghetti with clams',
      'calories': 420,
      'course': ['Main1'],
      'meal': ['Lunch', 'Dinner'],
      'ingredients': {
        'Spaghetti': '80 g',
        'Clams': '250 g',
        'Garlic': '1 clove',
        'Parsley': '1 bunch',
        'Extra virgin olive oil': 'to taste',
        'Black pepper': 'to taste',
        'Fine salt': 'to taste',
        'Coarse salt': 'to taste',
      },
      'preparation':
          'To prepare spaghetti with clams, start by cleaning them. Make sure there are no broken or empty shells; they should be discarded. Next, beat them against the sink, or possibly on a chopping board. This operation is important to check that there is no sand inside: healthy bivalves will remain closed, while those full of sand will open. Then place the clams in a bowl and rinse them. Add coarse salt. Let the clams soak for 2-3 hours. After this time, the clams will have purged any residual sand, drain and rinse them. Heat a little oil in a pan. Then add a clove of garlic and let it brown. Then plunge the clams into the hot pan. Close the lid and leave to cook for a few minutes over a high flame. The clams will open with the heat, so shake the pan from time to time until they have completely opened. In the meantime, finely chop the parsley. As soon as all the clams have opened turn off the heat immediately, otherwise the clams will overcook. Cook the spaghetti in plenty of lightly salted water for half the cooking time indicated on the packet. Meanwhile, filter the clams, placing a bowl underneath and remembering to remove the garlic. In this way you will collect the clam cooking water in the bowl. Transfer it to the pan where you had cooked the clams and as soon as the spaghetti are ready, drain them, keeping the cooking water aside. Transfer them to the pan with the sauce. Add a ladle of cooking water, season with pepper and finish cooking the spaghetti, adding more water if necessary. When they are ready, add the clams. Add the parsley, toss briefly and serve your spaghetti with clams immediately.',
      'url':
          'https://www.giallozafferano.it/images/219-21925/Spaghetti-alle-vongole_650x433_wm.jpg'
    },
    {
      'id': 10,
      'isSelected': false,
      'isSaved': false,
      'name': 'Chicken breast',
      'calories': 419,
      'course': ['Main2'],
      'meal': ['Lunch', 'Dinner'],
      'ingredients': {
        'Chicken': '200g of breast',
        'Extra Virgin Olive Oil': '1 spoon',
        'Rosemary': '1 sprig',
        'Fine Salt': 'to taste',
        'Black Pepper': 'to taste',
      },
      'preparation':
          'To prepare the milk-fed chicken breasts, start by cleaning the meat from the pieces of cartilage and excess fat. Now separate the two breasts and cut 4 slices from each. Place them on a cutting board and use a meat pounder to beat them into thin slices. Place the oil in a pan and flour the chicken slices. Gradually transfer them to the pan, turn up the heat slightly and wait about 2 minutes until a nice crust has formed. Then turn the slices over, wait a couple of minutes again and pour first the milk and then the rosemary into the pan. Season with salt and pepper, cover with a lid and cook for another 4-5 minutes until the milk has thickened. Now all you have to do is serve your chicken breasts in milk still hot!',
      'url':
          'https://www.salepepe.it/files/2014/12/Come-cucinare-il-petto-di-pollo-tecnica-base.jpg'
    },
    {
      'id': 11,
      'isSelected': false,
      'isSaved': false,
      'name': 'Chicken breast in milk ',
      'calories': 363,
      'course': ['Main2'],
      'meal': ['Lunch', 'Dinner'],
      'ingredients': {
        'Chicken': '150 g of breast',
        'Butter': '10 g',
        'Extra Virgin Olive Oil': '5 g',
        'Milk': '50 g',
        '00 flour': 'to taste',
        'Thyme': '2 sprigs',
        'Fine Salt': 'to taste',
        'Black Pepper': 'to taste',
      },
      'preparation':
          'To prepare the milk-fed chicken breasts, start by cleaning the meat from the pieces of cartilage and excess fat. Now separate the two breasts and cut 4 slices from each. Place them on a cutting board and use a meat pounder to beat them into thin slices. Place the oil in a pan and flour the chicken slices. Gradually transfer them to the pan, turn up the heat slightly and wait about 2 minutes until a nice crust has formed. Then turn the slices over, wait a couple of minutes again and pour first the milk and then the rosemary into the pan. Season with salt and pepper, cover with a lid and cook for another 4-5 minutes until the milk has thickened. Now all you have to do is serve your chicken breasts in milk still hot!',
      'url':
          'https://www.giallozafferano.it/images/ricette/166/16687/foto_hd/hd650x433_wm.jpg'
    },
    {
      'id': 12,
      'isSelected': false,
      'isSaved': false,
      'name': 'Fresh salad',
      'calories': 60,
      'course': ['Side'],
      'meal': ['Lunch', 'Dinner'],
      'ingredients': {
        'Salad': '100 g',
      },
      'preparation':
          'Use ready-made bagged salad. Alternatively, if you have bought a bunch of salad, put it in a basin of water selecting the best leaves, rinse them and then spin to dry.',
      'url':
          'https://media-assets.lacucinaitaliana.it/photos/61fa9f0088beebce25c097d4/1:1/w_2560%2Cc_limit/empty'
    },
    {
      'id': 13,
      'isSelected': false,
      'isSaved': false,
      'name': 'Saffron risotto',
      'calories': 626,
      'course': ['Main1'],
      'meal': ['Lunch', 'Dinner'],
      'ingredients': {
        'Saffron': '1/2 tsp',
        'Rice': ' 80 g',
        'Butter': '35 g',
        'White onions': '1/2',
        'Grated cheese': '20 g',
        'White wine': '10 g',
        'Water': 'to taste',
        'Vegetable stock': '1/2 L',
        'Salt': 'to taste',
      },
      'preparation':
          'To make saffron risotto (or risotto Milanese style), first put the pistils in a small glass, pour enough water over them to cover the pistils completely, stir and leave to infuse overnight, this way the pistils will release all their colour. Then prepare the vegetable stock, one litre will be needed for the recipe. Peel and finely chop the onion so that it can melt while cooking and not be perceived while tasting the risotto. In a large saucepan, pour 50 g of butter from the total amount needed, melt it over a low heat, then pour in the chopped onion and stew for 10-15 minutes, adding some stock to keep the sauté from drying out: the onion should be transparent and soft. Once the onion has stewed, pour in the rice and toast it for 3-4 minutes, so that the grains will seal and keep cooking well. Deglaze with the white wine and let it evaporate completely. Now continue cooking for about 18-20 minutes, adding the stock one ladle at a time, as needed, as it is absorbed by the rice: the grains should always be covered. Five minutes before the end of cooking, pour in the water with the saffron pistils you had infused, stir to flavour and dye the risotto a nice golden colour. When the cooking is finished, turn off the heat, season with salt, stir in the grated cheese and the remaining 75 g of butter, stir and cover with the lid and leave to rest for a couple of minutes, at which point the saffron risotto is ready, serve it piping hot, garnishing the dish with a few more pistils.',
      'url':
          'https://www.giallozafferano.it/images/ricette/174/17481/foto_hd/hd650x433_wm.jpg'
    },
    {
      'id': 14,
      'isSelected': false,
      'isSaved': false,
      'name': 'Tomato Risotto',
      'calories': 550,
      'course': ['Main1'],
      'meal': ['Lunch', 'Dinner'],
      'ingredients': {
        'Rice': '100 g',
        'Tomatoes': '100 g',
        'Tomato puree': '1 tbsp',
        'Vegetable stock': '1/2 L',
        'White onions': '1/2',
        'Grated cheese': '10 g',
        'Extra virgin olive oil': '1 tbsp',
        'Butter': '10 g',
        'Basil': 'to taste',
        'Fine salt': 'to taste',
      },
      'preparation':
          'To prepare the risotto with tomato, start by sautéing a finely chopped onion in 3 tablespoons of oil over low heat for about 10 minutes; the onion should not burn but become transparent. After this time, pour in the rice and toast it for a couple of minutes. Then deglaze with a ladleful of vegetable stock and let it evaporate. Add the peeled cherry tomatoes to which you have added a teaspoon of sugar to remove the acidity, stir well and add a ladle of stock. Add two tablespoons of tomato puree to taste. Continue to add a ladle of stock every time the risotto dries out, until it is cooked. When the cooking is almost finished, add chopped basil, according to your taste and adjust the salt if necessary. Then remove the saucepan from the heat and stir in the butter, finally add the grated Grana Padano 8 cheese and stir. Serve the tomato risotto hot and garnished with a few basil leaves.',
      'url':
          'https://www.giallozafferano.it/images/ricette/12/1219/foto_hd/hd650x433_wm.jpg'
    },
    {
      'id': 15,
      'isSelected': false,
      'isSaved': false,
      'name': 'Baked salmon',
      'calories': 435,
      'course': ['Main2'],
      'meal': ['Lunch', 'Dinner'],
      'ingredients': {
        'Salmon steaks': '170 g',
        'Potatoes': '50 g',
        'Lemons': '1/2 lemon peel and 10 g juice',
        'White wine': '15 g',
        'Extra virgin olive oil': '1/2 spoon',
        'Parsley': 'to taste',
        'Fine salt': 'to taste',
        'Black pepper': 'to taste',
      },
      'preparation':
          'To cook the baked salmon fillet, first remove the fish bones with tweezers and check that there are no bones left by running a fingertip over the flesh. Remove the backbone with a knife, then roll one end onto itself and wrap the other end around the fillet to form a medallion. Tie the medallion with kitchen string so that it keeps its shape even when cooking and transfer the medallions to a baking tray lined with baking paper. Take a fairly regular shaped potato, wash it and cut it into thin slices with a mandoline, without peeling it: the slices must be no more than 1 mm thick otherwise they will not be cooked enough. Now deal with the emulsion: grate the zest of one lemon into a bowl, then add 15 g lemon juice, oil, white wine, chopped parsley, salt and pepper and mix well with a fork. Season the salmon medallions with some of the emulsion, then cover them with the slightly overlapping potato discs and sprinkle the potatoes with the remaining emulsion. When the medallions are ready, bake in a static oven preheated to 180° for about 20 minutes, then turn the grill to 240° and continue cooking for another 3-4 minutes, until the potatoes are golden brown. When the cooking time has elapsed, remove the cooking string and serve your delicious baked salmon with potatoes immediately!',
      'url':
          'https://blog.giallozafferano.it/cucinachetipassaoriginal/wp-content/uploads/2019/12/salmone-al-forno-27.jpg'
    },
    {
      'id': 16,
      'isSelected': false,
      'isSaved': false,
      'name': 'Omelette',
      'calories': 287,
      'course': ['Breakfast', 'Main2'],
      'meal': ['Breakfast', 'Lunch', 'Dinner'],
      'ingredients': {
        'Eggs': '2',
        'Fine Salt': 'to taste',
        'Milk': '30 g',
        'Extra Virgin Olive Oil': '15 g',
      },
      'preparation':
          'To prepare the omelettes, first break the eggs in a bowl. Add the milk and a pinch of salt. Then beat the eggs using a whisk, so that they are mixed with the milk. They will be ready when you lift up the whisk and the mixture comes down in a flush. Heat a pan on the stove and add a little extra virgin olive oil. As soon as it is hot, pour the egg mixture into it; to see if the oil is hot enough, try pouring in a few drops first. Cook the omelette over a moderate flame: with slow cooking, the egg will remain softer. The outside should be golden brown but not too much, as soon as it starts to set on the edges, cover with a lid 8. If the temperature seems too high, remove the pan from the heat for a few seconds, still keeping the lid on. Rotate the pan gently to prevent the omelette from remaining in one place for too long. As soon as the omelette is soft on the surface (i.e. slobbery) and the underside is golden brown when you lift the edge with a spatula, fold the omelette into a crescent shape, wait a few seconds more in the pan and serve your omelette piping hot.',
      'url':
          'https://www.giallozafferano.it/images/ricette/176/17665/foto_hd/hd650x433_wm.jpg'
    },
    {
      'id': 17,
      'isSelected': false,
      'isSaved': false,
      'name': 'Chicken cacciatore',
      'calories': 518,
      'course': ['Main2'],
      'meal': ['Lunch', 'Dinner'],
      'ingredients': {
        'Chicken': '1.3 kg',
        'Tomatoes': '400 g',
        'White onions': '1',
        'Carrots': '1',
        'Celery': '1 rib',
        'Garlic': '1 clove',
        'Red Wine': '100 g',
        'Extra virgin olive oil': 'to taste',
        'Rosemary': '1 sprig',
        'Parsley': '1 tuft chopped',
        'Fine salt': 'to taste',
        'Black pepper': 'to taste',
      },
      'preparation':
          'To prepare chicken cacciatore, start by chopping the vegetables. After peeling the onion, peel and trim the carrot as well, and finally remove the tuft from the celery and chop it all until you get 2-3 mm cubes. Then move on to cleaning the chicken. Cut it into pieces by separating thighs, breast and wings. At this point you have everything you need, move to the stove. In a saucepan heat a drop of oil, do not overdo it because the skin of the chicken will release a lot of fat. Turn on the flame and let it heat for a few moments, after which pour in the chicken pieces, always starting on the skin side. Let them brown for about 10 minutes, turning after a while. When the chicken is well browned add the chopped celery, carrot and onion and then the hulled garlic clove. Then salt, pepper and rosemary, stir and let it season for another 5 minutes. Deglaze with the red wine and let the alcohol part evaporate completely. Remove the rosemary and garlic clove and then add the chopped peeled tomatoes. Stir it all together and cover with a lid, let it cook over moderate heat for 30-35 minutes. Remember that if the chicken is larger then you will need to increase the cooking time a little more, vice versa if smaller. In any case, the chicken is considered ready as soon as the meat comes off the bones. At the end of cooking make sure it is just right with salt and finally sprinkle with parsley. One last stir and your chicken cacciatore is ready, enjoy!',
      'url':
          'https://www.cucchiaio.it/content/cucchiaio/it/ricette/2009/12/ricetta-pollo-cacciatora/_jcr_content/header-par/image_single.img.jpg/1579020893122.jpg'
    },
    {
      'id': 18,
      'isSelected': false,
      'isSaved': false,
      'name': 'Cuttlefish with peas',
      'calories': 276,
      'course': ['Main2'],
      'meal': ['Lunch', 'Dinner'],
      'ingredients': {
        'Baby peas': '250 g',
        'Cleaned cuttlefish': '0.5 kg',
        'White onions': '1',
        'Extra virgin olive oil': '2 tbsp',
        'Fine salt': 'to taste',
        'Parsley': 'to taste',
        'Vegetable stock': 'to taste',
        'Tomatoes': '250 g',
        'White wine': '25 g',
        'Black pepper': 'to taste',
      },
      'preparation':
          'To make cuttlefish with peas as first thing make the vegetable broth. Once strained keep it warm; then hull the onion and chop it with a knife. Now take your already cleaned cuttlefish (if not you can follow our directions found in the tab how to clean cuttlefish). Peel off the tentacles, remove the eye and chop them into small pieces. Cut the mantle into fairly wide strips. Heat the olive oil in a large saucepan, pour in the chopped onion and stew over medium heat for about 10 minutes, adding hot vegetable broth as needed so the onion does not dry out too much. When the onion is soft and translucent, pour in the cuttlefish, season with salt and pepper. The cuttlefish may release some water so you can turn up the heat to dry them out. When they have lost their water, deglaze with the white wine and let it evaporate. Finally add the peas, peeled tomatoes previously crushed and stripped of their stems; add a ladleful of broth and continue cooking over a gentle heat for 15 to 20 minutes. Meanwhile, wash, dry and chop the parsley as well. When the cuttlefish with peas are soft, turn off the heat, flavor with fresh parsley and serve immediately.',
      'url':
          'https://blog.giallozafferano.it/ricettepanedolci/wp-content/uploads/2020/11/seppie-e-piselli-1-720x480.jpeg'
    },
    {
      'id': 19,
      'isSelected': false,
      'isSaved': false,
      'name': 'Roast veal in the oven with potatoes',
      'calories': 445,
      'course': ['Main2'],
      'meal': ['Lunch', 'Dinner'],
      'ingredients': {
        'Veal undercut': '300 g',
        'Potatoes': '0.5 kg',
        'White wine': '25 g',
        'Rosemary': '1 sprig',
        'Garlic': '1 clove',
        'Extra virgin olive oil': '20 g',
        'Fine salt': 'to taste',
        'Black pepper': 'to taste',
      },
      'preparation':
          'To prepare roast veal with potatoes, start with the potatoes. After washing and drying them well, peel them and then cut them into chunks of about a couple of centimeters, or at any rate the important thing is that they are all the same thickness. Pour the chunks into a bowl and adjust the oil, salt and pepper and also add the peeled garlic. Add a sprig of chopped rosemary and mix everything together, with your hands or a wooden spoon, then transfer to a drip pan greased with oil and bake, in a preheated oven on static mode, at 200° for 20 minutes. Meanwhile, take care of the meat tying. The first thing to do, however, is to remove the whitish tissues that may become tough during cooking, making the meat not very tender. So with one hand hold up a flap while with the other hand in which you hold a sharp blade, the one for filleting fish will do, go and discard these parts until the piece of meat is completely clean. Now move on to tying it up. Unroll a good bit of kitchen twine and let it go underneath the meat arranged horizontally on the cutting board. Join the two ends together until they form a double knot placed on the outer side: for convenience we start from the left side all the way to the end. Now pass the twine around your hand twice (if you think you can also rotate your hand, so it will knot automatically), until it forms a loop. Then pass the meat inside, tighten the twine by pulling the top or bottom end, until you reach the center. Here is the first knot, repeat like this until the piece of veal is completely caged: meanwhile, remember to leave about an inch of space between each knot. When you reach the end, flip the meat over to the other side, still holding the ends in place, and weld it all together again by making a double knot, obviously on the opposite side from the first. Splint the meat by passing the other sprig of rosemary under the knots and then salt and pepper the cutting board. Place the piece of meat on it and begin massaging it, making the aromatics adhere in all places. Heat the oil in a frying pan and add the meat, letting it seal over medium-high heat on all sides: so every minute or so you will have to turn it with tongs or wooden spoons making sure that the meat browns nicely. When all sides of the piece of meat are well sealed, deglaze with the white wine and let it evaporate for a few moments, after which turn off the flame. Bring the meat to the center of the drip pan making space between the potatoes. Sprinkle the piece of veal with the gravy and stick a roasting thermometer into the center of the meat. Continue cooking, still at 200°, until the thermometer reaches 65°, roughly it will take about 35 minutes. After that time has elapsed, your baked veal roast with potatoes  will be ready: wait a few minutes before removing the string and slicing this goodness!',
      'url':
          'https://www.giallozafferano.it/images/ricette/172/17292/foto_hd/hd650x433_wm.jpg'
    },
    {
      'id': 20,
      'isSelected': false,
      'isSaved': false,
      'name': 'Potato omelette',
      'calories': 252,
      'course': ['Main2'],
      'meal': ['Lunch', 'Dinner'],
      'ingredients': {
        'Eggs': '3',
        'Potatoes': '250 g',
        'Grated cheese': '50 g',
        'Parsley': 'to taste',
        'Fine salt': 'to taste',
        'Black pepper': 'to taste',
        'Seed oil': 'to taste',
      },
      'preparation':
          'To make the potato frittata first finely chop the parsley with a knife. Then peel the potatoes and cut them into 1 cm thick slices. Bring a pot filled with water to a boil and then blanch the sliced potatoes for 4-5 minutes. Now pour the eggs into a bowl, add the grated cheese, chopped parsley and then season with salt and pepper. At this point stir to combine the ingredients. Drain the potatoes that will have finished cooking, let them cool and then add them to the egg mixture. Then move on to cooking: heat a drizzle of seed oil in a frying pan, and once it is hot, pour in the mixture. Cover with the lid and cook over moderate heat for 15 minutes, turning the pan occasionally. When the surface is slightly soft but still moist, invert the frittata onto the lid by flipping the pan over with a firm, quick motion. Slide the omelet back into the pan so that the other side is also cooked, cover again with the lid and continue cooking for another 5 minutes. After this time has elapsed, the frittata will be ready; you can serve it piping hot or even cold.',
      'url':
          'https://www.giallozafferano.it/images/204-20451/Frittata-di-patate_650x433_wm.jpg'
    },
    {
      'id': 21,
      'isSelected': false,
      'isSaved': false,
      'name': 'Baked sea bream',
      'calories': 195,
      'course': ['Main2'],
      'meal': ['Lunch', 'Dinner'],
      'ingredients': {
        'Sea bream': '450 g',
        'Garlic': '1 clove',
        'Fine salt': 'to taste',
        'Black pepper': 'to taste',
        'Parsley': '1 clump',
        'Thyme': '1 sprig',
        'Extra virgin olive oil': '10 g',
        'Lemons': '1 slice',
      },
      'preparation':
          'To make sea bream baked in foil, if you have uncleaned sea bream on hand, proceed as indicated below: use scissors to make a cut on the belly and proceed straight down to under the head, then remove the entrails. Wash the belly of the fish well under running water to remove any remaining traces of blood. Again using scissors, first cut off the side fin near the head, then cut off the caudal fin located under the belly and the dorsal fin. Flip the fish over on the opposite side and remove the other side fin and the caudal fin. Using the scaling tool, or the blade of a knife, carefully scale the sea bream, repeatedly passing the tool from the tail toward the head. Pass the sea bream again under running water, washing it carefully on the outside as well. Wash and chop the parsley. Place a sheet of baking paper on a baking sheet lay each cleaned sea bream in the center, salt and pepper the inside. then stuff with the aromatics: sprigs of thyme previously washed and dried, half a peeled clove of garlic for each sea bream, half a slice of lemon and the extra virgin olive oil. Pour in drizzle of olive oil over the bream as well then close the sheet of baking paper by rolling up the two ends. Then wrap it in foil, again curling the ends to seal. Lay the bream on a baking sheet and bake in a static oven preheated to 180° for about 40 minutes. When cooked, take the sea bream out of the oven, let it cool and then serve in the foil itself, sprinkling it with fresh parsley if you like.',
      'url':
          'https://www.cucchiaio.it/content/cucchiaio/it/ricette/2009/12/ricetta-orata-cartoccio/_jcr_content/header-par/image_single.img.jpg/1632481796540.jpg'
    },
    {
      'id': 22,
      'isSelected': false,
      'isSaved': false,
      'name': 'Sicilian-style swordfish',
      'calories': 381,
      'course': ['Main2'],
      'meal': ['Lunch', 'Dinner'],
      'ingredients': {
        'Sliced swordfish': '150 g',
        'Tomatoes': '150 g',
        'Pitted green olives': '25 g',
        'Extra virgin olive oil': '15 g',
        'Garlic': '1 clove',
        'Pine nuts': '10 g',
        'Oregano': 'to taste',
        'Fine salt': 'to taste',
        'Black pepper': 'to taste',
      },
      'preparation':
          'To prepare Sicilian-style swordfish, start with the cherry tomatoes. Peel them off the sprig, rinse and dry them, after which cut them in half. In a large frying pan pour the oil and flavour a whole clove of garlic, already peeled. After a couple of minutes you can pour in the chopped cherry tomatoes. Sprinkle with a pinch of salt and a little oregano and cook for about 10 minutes. In the meantime you can take care of the pitted olives, cut them into rounds of a few millimeters. When you are done, add them to the sauce. Remove the garlic clove and then add the swordfish as well, letting it cook for a couple of minutes on one side. Turn on the other, cover with the lid and cook for another 2 to 3 minutes; when cooked, sprinkle with a pinch of black pepper. In the meantime that the swordfish is cooking, you can pour the pine nuts into the pan and toast them for a few moments over high heat making sure they do not burn, then stir often. When the swordfish is cooked arrange it on a serving plate and add the pine nuts. Your Sicilian-style swordfish is ready, serve it still steaming hot and ... enjoy!',
      'url':
          'https://www.giallozafferano.it/images/169-16972/Pesce-spada-alla-siciliana_450x300.jpg'
    },
    {
      'id': 23,
      'isSelected': false,
      'isSaved': false,
      'name': 'Zucchini omelette',
      'calories': 349,
      'course': ['Main2'],
      'meal': ['Lunch', 'Dinner'],
      'ingredients': {
        'Eggs': '3',
        'Nutmeg': 'to taste',
        'Grated cheese': '25 g',
        'Zucchini': '225 g',
        'Extra virgin olive oil': '25 g',
        'Garlic': '1 clove',
        'Fine salt': 'to taste',
        'Black pepper': 'to taste',
      },
      'preparation':
          'To prepare the zucchini frittata, start by preparing the vegetables: wash and dry them. Take the small ones, cut them into very thin rounds and pour them into a bowl. Season them with a drizzle of oil. Season with coarsely chopped mint leaves. Season with salt and pepper. Keep them aside. Turn to the medium-sized zucchini and slice them lengthwise. Then cut them into small cubes. Now take a 28-cm-diameter bottomed nonstick skillet (the skillet will have an overall diameter of 33.5 cm) and sauté a clove of garlic with a drizzle of oil. When the garlic has achieved a golden color, remove it. Cook the diced zucchini on high heat for 7 to 8 minutes. Adjust for salt and pepper. Once they are ready, set them aside and turn to the eggs for the omelet. Beat the eggs with a hand whisk or fork. Adjust the salt and pepper, then add the grated cheese a little at a time to incorporate it well into the eggs. As you continue beating, sprinkle in the nutmeg. You should get a smooth mixture. Add the beaten eggs to the pan with the chopped zucchini and cover with the lid, cooking for 8 minutes over moderate heat. After the time has elapsed, place a plate on top of the nonstick skillet. Turn the skillet upside down on the plate. Then place the skillet back on the heat and evenly arrange the sliced zucchini on its surface. Slide the frittata back into the pan to cook it on the opposite side and have the sliced zucchini incorporated into the preparation. Let it cook like this for 2-3 minutes, and now the zucchini frittata is ready to be enjoyed!',
      'url':
          'https://blog.giallozafferano.it/lacucinadirosalba/wp-content/uploads/2020/05/DSC3066_00001.jpg'
    },
    {
      'id': 24,
      'isSelected': false,
      'isSaved': false,
      'name': 'Stuffed Zucchini Ligurian Style',
      'calories': 340,
      'course': ['Main2'],
      'meal': ['Lunch', 'Dinner'],
      'ingredients': {
        'Zucchini': '350 g',
        'White onions': '30 g',
        'Eggs': '1',
        'Bread': '20 g',
        'Capers': '4 g',
        'Pine nuts': '10 g',
        'Grated cheese': '25 g',
        'Extra virgin olive oil': '15 g',
        'Black pepper': '1 pinch',
        'Anchovies in oil': '5 g',
        'Milk': '30 g',
        'Tuna in oil': '75 g',
        'Thyme': 'to taste',
        'Breadcrumbs': '30 g',
      },
      'preparation':
          'To prepare Ligurian-style stuffed zucchini, first wash the zucchini and boil them according to their consistency: if they are nice and firm you can boil them in boiling water for about 6-7 minutes. If, on the other hand, they were a bit soft then you can reduce the time by 1-2 minutes. Drain the zucchini place them in a bowl with ice so that they cool quickly without losing their nice bright green color. When they are cold then remove the ends of the zucchini, then cut them in half lengthwise and hollow them out with a small digger; set aside for a moment. Meanwhile, cut the stale bread into small cubes. Pour it into a small bowl and add the milk and let it soften. Peel and carve the onion first horizontally and then vertically. After that chop finely and move to the stove. In a frying pan, heat the oil along with the onion and anchovies, let the anchovies break up, stirring often with a spatula, after which add the zucchini flesh. Saute for a few minutes over high heat and transfer to a bowl. Meanwhile, toast the pine nuts in another pan, being careful not to burn them. Now that everything is ready, make the mixture :in the blender pour the drained tuna, toasted pine nuts and desalted capers. Finally, add the soaked bread and blend to make a firm, homogeneous mixture. Add the mixture to the base of onions, anchovies, and zucchini flesh. Also add the grated Parmesan cheese, beaten eggs and then season with salt, pepper and flaked thyme, then add the breadcrumbs as well and mix everything well with a spatula. Grease a baking dish that can hold the zucchini then proceed to stuff them with the mixture and then lay them inside the dish. Sprinkle the surface with breadcrumbs and bake in a preheated oven, in grill mode, at 250° for about 10 to 12 minutes. Once cooked, wait 5 minutes before serving your Ligurian-style stuffed zucchini.',
      'url':
          'https://blog.giallozafferano.it/peccatodigola/wp-content/uploads/2019/04/ricetta-zucchine-ripiene-alla-ligure-peccato-di-gola-di-giovanni.jpg'
    },
    {
      'id': 25,
      'isSelected': false,
      'isSaved': false,
      'name': 'Baked potatoes',
      'calories': 261,
      'course': ['Side'],
      'meal': ['Lunch', 'Dinner'],
      'ingredients': {
        'Potatoes': '0.5 kg',
        'Rosemary': '1 sprig',
        'Garlic': '1 clove',
        'Extra virgin olive oil': '15 g',
        'Fine salt': 'to taste',
        'Black pepper': 'to taste',
        'Thyme': '1 sprig',
      },
      'preparation':
          'To prepare the baked potatoes first wash them well and peel them. Divide the potatoes in half lengthwise and then into quarters. From these cut out cubes a couple of cm in size and gradually transfer them to a bowl. In a pot bring plenty of water to a boil and submerge the potatoes. Blanch them for 7 minutes then drain and transfer them back to a bowl. Season with the thyme leaves. Add salt, pepper and oil and mix well with a spoon. Transfer the potatoes to a previously greased low-sided aluminum baking dish. Add rosemary sprigs and two garlic cloves. Bake the potatoes in a preheated ventilated oven at 220°, on the middle rack, for 40 minutes or until the potatoes are nicely browned. Halfway through cooking it is recommended to gently stir the potatoes for even browning. When cooked, take your baked potatoes out of the oven, remove the garlic cloves and serve.',
      'url':
          'https://www.cucchiaio.it/content/cucchiaio/it/ricette/2015/04/patate-al-forno/_jcr_content/header-par/image-single.img.jpg/1581958003248.jpg'
    },
    {
      'id': 26,
      'isSelected': false,
      'isSaved': false,
      'name': 'Ratatouille',
      'calories': 162,
      'course': ['Side'],
      'meal': ['Lunch', 'Dinner'],
      'ingredients': {
        'Eggplant': '140 g',
        'Zucchini': '100 g',
        'Green peppers': '75 g',
        'Yellow peppers': '75 g',
        'Tomatoes': '125 g',
        'White onions': '60 g',
        'Garlic': '1 clove',
        'Extra virgin olive oil': 'to taste',
        'Fine salt': 'to taste',
        'Thyme': 'to taste',
        'Parsley': 'to taste',
        'Basil': 'to taste',
      },
      'preparation':
          'To prepare the ratatouille first wash all the vegetables. Then take the yellow peppers, remove the stalk and divide them in half. Also remove any seeds and inner filaments. Then divide each half in half again lengthwise and make strips from the strips. Repeat the same operation for the green peppers as well. Next turn to the eggplants, peel and split them in half. Then with a knife remove only the outermost part with the skin, thus avoiding the central part containing more seeds. Then cut out rectangles of a couple of cm. Then take the zucchini as well: trim them and cut them in half. As just done for the eggplant, take only the outer part of the zucchini and also from this cut out rectangles a couple of cm large. Turn to the tomatoes, trim them and cut them into 4 wedges. From each one then cut out cubes. Take the onion, peel it and cut it into thin slices. Then chop the garlic finely as well and add it to the onion. At this point, flake the thyme, chop the basil with your hands and chop the parsley. Now you can take care of the cooking. Pour a drizzle of oil into the pan and add both the eggplant and zucchini. Cook for about 10 minutes, stirring occasionally. Meanwhile, in another skillet pour a drizzle of oil, add the onion along with the garlic and let it wilt over medium heat. After a few minutes add the peppers as well. Add the tomatoes, a little water and the thyme. Cook everything over medium heat and as soon as the 10 minutes are up add zucchini and eggplant inside the peppers. Adjust the salt, cover with a lid and continue cooking for another 10-12 minutes. If the water dries out too much, add a little more so that at the end of cooking you will retain some of the sauce. Add the parsley, basil, stir everything together and serve your ratatouille.',
      'url':
          'https://www.cuocicuoci.com/wp-content/uploads/2022/05/ratatouille-anteprima.jpeg'
    },
    {
      'id': 27,
      'isSelected': false,
      'isSaved': false,
      'name': 'Piattoni with tomato sauce',
      'calories': 90,
      'course': ['Side'],
      'meal': ['Lunch', 'Dinner'],
      'ingredients': {
        'Jackdaws': '100 g',
        'Tomatoes': '1',
        'Red onions': '1/2',
        'Tomato puree': '25 g',
        'Extra virgin olive oil': 'to taste',
        'Fine salt': 'to taste',
        'Black pepper': 'to taste',
      },
      'preparation':
          'To make tomato piattoni cut a cross in the base of the auburn tomatoes with a knife, then blanch them in hot water for about 1 minute 1. Drain them How to Make Tomato Piattoni and let them cool by immersing them in a bowl full of cold water. Wash the piattoni under running water, then peel them How to Make Tomato Piattoni Recipe and cut them into lozenges. Retrieve the tomatoes and peel them by pulling the skin at the incisions made earlier. Divide the tomatoes into wedges How to Prepare Piattoni with Tomato and remove the inner part with the seeds. Peel and slice the red onion, heat the oil in a saucepan, Piattoni al pomodoro recipe add the onion, let it stew on low heat for 5 minutes, then pour in the tomatoes, let it flavor for a couple of minutes, then pour in the piattoni as well. How to cook Piattoni with tomato sauce Add a little hot water, about 2 ladles, season with salt and pepper, cover with a lid How to accompany Piattoni with tomato sauce Cook the piattoni for about 10 minutes, then pour in the tomato puree and continue cooking for about 5 minutes or as long as it takes for the sauce to reduce. Serve your piattoni al pomodoro seasoned to taste a drizzle of extra virgin olive oil!',
      'url':
          'https://www.giallozafferano.it/images/177-17739/Piattoni-al-pomodoro_780x520_wm.jpg'
    },
    {
      'id': 28,
      'isSelected': false,
      'isSaved': false,
      'name': 'Baked onions',
      'calories': 144,
      'course': ['Side'],
      'meal': ['Lunch', 'Dinner'],
      'ingredients': {
        'White onions': '300 g',
        'Red onions': '300 g',
        'Fine salt': 'to taste',
        'Parsley': '1 clump',
        'Bread': '1 tbsp breadcrumbs',
        'Extra virgin olive oil': 'to taste',
        'Black pepper': 'to taste',
      },
      'preparation':
          'To prepare baked onions start by peeling and cleaning the onions, then boil them for 7 to 8 minutes in plenty of salted water. Drain them and cut them in half with a sharp knife. Oil a baking dish well and arrange the onions in it with the cut side facing up, season with salt and pepper, cover with plenty of chopped parsley and sprinkle with breadcrumbs. Finish by drizzling with extra virgin olive oil. Bake at 180°C for 60 to 75 minutes until the onions are well cooked, wilted and slightly toasted (check the onions are cooked by pricking them with a wooden toothpick). If you want to achieve a gratin and golden brown effect the last 10 minutes, put the oven at 200°C in grill mode. Serve the baked onions piping hot!',
      'url':
          'https://blog.giallozafferano.it/nocemoscata/wp-content/uploads/2019/05/IMG_9716..jpg'
    },
    {
      'id': 29,
      'isSelected': false,
      'isSaved': false,
      'name': 'Artichokes trifoliated',
      'calories': 122,
      'course': ['Side'],
      'meal': ['Lunch', 'Dinner'],
      'ingredients': {
        'Artichokes': '4',
        'Garlic': '1 clove',
        'Extra virgin olive oil': '3 tbsp',
        'Parsley': '2 tbsp',
        'Vegetable stock': 'to taste',
        'Fine salt': 'to taste',
        'Black pepper': 'to taste',
      },
      'preparation':
          'The first thing you need to do when you are getting ready to handle artichokes is to protect your hands with gloves to prevent them from turning black or to rub them well with lemon juice; keep half a lemon on hand, and rub your hands occasionally-it will help safeguard them! Next, clean the artichokes ( to see how to do it click here) and place them hand by hand in a container with acidulated water (added lemon juice), preventing them from turning black. In a saucepan, crush 2 cloves of garlic, lightly brown them in oil, add the artichokes in wedges and the well-drained stems and sauté them a few moments. Add some chopped parsley, keeping a handful aside (which you will use to sprinkle over the artichokes when the cooking is finished); Also prepare some vegetable broth with which you are going to bathe the artichokes whenever they get too dry, then pepper and salt to your taste. Cooking should go on for about 15 to 20 minutes depending on the size of the artichokes; you will be able to know when it is time to turn off the heat by poking a stem with a fork; it should be tender but not mushy. Serve the artichokes trifoliated as soon as they are ready!',
      'url':
          'https://www.cucchiaio.it/content/cucchiaio/it/ricette/2018/11/carciofi-trifolati/_jcr_content/header-par/image-single.img.jpg/1542097916103.jpg'
    },
    {
      'id': 30,
      'isSelected': false,
      'isSaved': false,
      'name': 'Sardinian-style eggplant',
      'calories': 63,
      'course': ['Side'],
      'meal': ['Lunch', 'Dinner'],
      'ingredients': {
        'Garlic': '1 clove',
        'Extra virgin olive oil': 'to taste',
        'Fine salt': 'to taste',
        'Black pepper': 'to taste',
        'Eggplant': '250 g',
        'Tomatoes': '125 g',
        'Parsley': '1 tbsp chopped',
      },
      'preparation':
          'To prepare eggplant Sardinian style, you can use either the elongated violet variety or the round variety. First wash the eggplants and cut them into half-inch slices . Using the blade of a knife, carve each slice of eggplant by making vertical, horizontal and transverse lines to form a checkerboard pattern. This will help the eggplant lose its bitter mood more easily and facilitate even cooking. Salt the eggplant slices and lay them in a colander. Cover them with a plate on which you will place a weight so as to compress them and leave them like this for half an hour so that they lose their bitter liquid. Meanwhile, wash the tomatoes, cut them in half and gently hollow out the inside with a small knife to remove the seeds. Now cut them into half-inch pieces and pour them into a bowl. Now season the tomatoes: add the garlic cloves and the three tablespoons of finely chopped parsley, the salt and finally the oil. Stir and let the chunks of tomatoes soak with the seasoning for a few minutes. Meanwhile, after the half-hour has passed, take back the eggplant slices and check that they have released their bitter water. Rinse them under cold running water and then dry them thoroughly with kitchen paper or a cloth. Then, heat the static oven to 180°-200°. Grease a 34-cm, high-sided baking dish with olive oil and begin by forming a layer of eggplant. Then cover with a layer of chopped cherry tomatoes. Continue in this way until you have used up all the eggplant, as shown in the photo. Then bake the dish, in a preheated static oven and bake at 200° for at least 40 minutes. Remove from the oven and serve the eggplants hot or cold according to your taste.',
      'url':
          'https://www.giallozafferano.it/images/ricette/6/607/foto_hd/hd650x433_wm.jpg'
    },
    {
      'id': 31,
      'isSelected': false,
      'isSaved': false,
      'name': 'Eggplant carpaccio',
      'calories': 370,
      'course': ['Side'],
      'meal': ['Lunch', 'Dinner'],
      'ingredients': {
        'Eggplant': '200 g',
        'Extra virgin olive oil': '40 g',
        'Lemons': '10 ml juice',
        'Mint': '3 leaves',
        'Basil': '2 leaves',
        'Garlic': '1 clove',
        'Fine salt': 'to taste',
        'Black pepper': 'to taste',
      },
      'preparation':
          'To prepare the eggplant carpaccio, start by washing the eggplants under running water and dry them well with a dish towel. Now remove the stalk with a knife and thinly slice the eggplant lengthwise, helping yourself with a mandoline so that you get regular slices of the same thickness, each slice should be about 2-3 mm thick. When finished, place a griddle on the stove and heat it, place the eggplant slices on the griddle, salt them and turn them so that they are cooked on both sides (cook a couple of minutes or until they are well colored with the typical dark grill streaks). Once cooked, lay the eggplants on a plate and let them cool. Now deal with the marinade: take an ovenproof dish that measures 28 cm x 18 cm (alternatively, you can use a larger or smaller dish, making sure that the eggplant is always in contact with the marinade so that it absorbs the aromatic seasoning). Pour the oil and lemon juice into the dish, add the garlic, season with salt and pepper and finally flavor with the mint leaves and basil. The marinade is ready. Now dip the eggplant into the marinade, cover the dish with plastic wrap and let it season in the refrigerator for a couple of hours. Serve the eggplant carpaccio cold as an appetizer or side dish.',
      'url':
          'https://www.giallozafferano.it/images/ricette/27/2783/foto_hd/hd650x433_wm.jpg'
    },
    {
      'id': 32,
      'isSelected': false,
      'isSaved': false,
      'name': 'Friar beard with anchovies',
      'calories': 117,
      'course': ['Side'],
      'meal': ['Lunch', 'Dinner'],
      'ingredients': {
        'Monks beard (agretti)': '125 g',
        'Garlic': '1 cloves',
        'Anchovies in oil': '3',
        'Fine salt': 'to taste',
        'Extra virgin olive oil': '2 tbsp',
      },
      'preparation':
          'To prepare the anchovy friar beard, start by removing the reddish ends from the friar beard, breaking them off with your fingers and removing them. After carefully washing the friar beard, boil it for about 7 to 8 minutes in plenty of salted water. Let the friar beard drain thoroughly. Meanwhile, in a large skillet, brown the garlic with the extra virgin olive oil over high heat. When the garlic has taken on color remove it from the oil. Now put the chopped anchovy fillets into the oil and let them cook until the anchovies have dissolved in the oil. At this point, add the boiled and well-drained friar beard. Sauté it for a few minutes, until the cooking liquid in the bottom has dried up. Your friar beard with anchovies is ready to be served!',
      'url':
          'https://www.giallozafferano.it/images/7-792/Barba-di-frate-alle-acciughe_650x433_wm.jpg'
    },
    {
      'id': 33,
      'isSelected': false,
      'isSaved': false,
      'name': 'Sauteed porcini mushrooms',
      'calories': 144,
      'course': ['Side'],
      'meal': ['Lunch', 'Dinner'],
      'ingredients': {
        'Porcini mushrooms': '200 g',
        'Extra virgin olive oil': 'to taste',
        'Parsley': 'to taste chopped',
        'Garlic': '1 clove',
        'Fine salt': 'to taste',
        'Black pepper': 'to taste',
      },
      'preparation':
          'To prepare sauteed porcini mushrooms, start by cleaning the mushrooms: with a knife, remove the lower part where the soil is present; then gently scrape the stem and the upper part, removing the soil present. With a twisting motion separate the mushroom caps from the stems (if you notice that the mushrooms contain small pests, perform this operation by holding the mushrooms upside down, so that the pests, will tend to rise toward the extreme tip of the stem; at that point you can remove them by cutting away the end along with the soil). If the mushrooms are large they are easier to clean and it is not necessary to split the mushrooms. Using a small brush remove any soil from the inside of the cap as well. Finally, wipe a damp cloth over the mushrooms to remove further residue. Slice the mushrooms into about 5 mm slices, then sauté two cloves of garlic in a pan with a drizzle of oil. Add the sliced mushrooms and cook them over a gentle flame for no more than 10 minutes. Meanwhile, finely chop the parsley. Stir the mushrooms gently from time to time, and when it is a couple of minutes before the end of cooking, remove the garlic, then adjust the salt. Grind black pepper to taste, lastly add the parsley. Stir well and serve the sauteed porcini mushrooms!',
      'url':
          'https://www.giallozafferano.it/images/6-673/Funghi-porcini-trifolati_450x300.jpg'
    },
    {
      'id': 34,
      'isSelected': false,
      'isSaved': false,
      'name': 'Pan-fried fennel',
      'calories': 54,
      'course': ['Side'],
      'meal': ['Lunch', 'Dinner'],
      'ingredients': {
        'Fennel': '200 g',
        'Extra virgin olive oil': 'to taste',
        'Thyme': 'to taste',
        'Garlic': '1 clove',
        'Black pepper': 'to taste',
      },
      'preparation':
          'To make pan-seared fennel, start by washing the fennels, then clean them by cutting off the base of the core and the stems (the latter you can use to flavor a soup or stock). Divide each fennel in half and then proceed by cutting them into wedges. Once the fennels are cut, you can proceed with the cooking: heat extra virgin olive oil in a pan with two cloves of garlic. Season the thyme sprigs, then add the fennel wedges. Season to taste with salt. Season with pepper to taste and cover with a lid. Cook for 5 minutes over medium heat (if you prefer a softer final texture, you can continue this cooking step a few minutes). Shake the pan occasionally to move them around, without flaking them. After the 5 minutes are up remove the lid raise the heat and cook for about 7 to 8 minutes until they get a nice color, always move the pan for even cooking. Once ready serve piping hot.',
      'url':
          'https://www.giallozafferano.it/images/165-16504/Finocchi-in-padella_780x520_wm.jpg'
    },
    {
      'id': 35,
      'isSelected': false,
      'isSaved': false,
      'name': 'Sauteed zucchini',
      'calories': 114,
      'course': ['Side'],
      'meal': ['Lunch', 'Dinner'],
      'ingredients': {
        'Zucchini': '150 g',
        'Garlic': '1 cloves',
        'Parsley': '1 tbsp',
        'Extra virgin olive oil': '10 g',
        'Fine salt': 'to taste',
        'Black pepper': 'to taste',
      },
      'preparation':
          'To prepare sauteed zucchini, wash and trim the zucchini, then dry them and cut them into thin, 2-mm rounds. Place the oil and garlic in a nonstick skillet, pour in the zucchini, season with salt and pepper and cook over high heat for about 8 minutes. Stir the zucchini occasionally by shaking the pan or stirring gently so they do not flake. Meanwhile, wash, dry and then finely chop the clump of parsley. When the zucchini are cooked, turn off the heat and remove the garlic. Season with the chopped parsley, stir gently all the time, and serve the sauteed zucchini immediately.',
      'url':
          'https://www.giallozafferano.it/images/4-407/Zucchine-trifolate_650x433_wm.jpg'
    },
    {
      'id': 36,
      'isSelected': false,
      'isSaved': false,
      'name': 'Baked beans',
      'calories': 313,
      'course': ['Side'],
      'meal': ['Lunch', 'Dinner'],
      'ingredients': {
        'Dried white beans': '100 g',
        'Tomatoes': '100 g',
        'Sausage': '90 g',
        'Sage': '1 leaf',
        'Extra virgin olive oil': 'to taste',
        'Fine salt': 'to taste',
        'Black pepper': 'to taste',
      },
      'preparation':
          'To prepare baked beans, you will need to soak dried cannellini beans in a large bowl covered well with cold water overnight. The next day, drain the beans and rinse under running water. Pour them into a large pot with about 2.5 liters of cold water. Cook the cannellini beans over high heat until they come to a boil, then turn down and cook over low heat for at least 50 to 60 minutes, skimming them occasionally with a skimmer. You will need to cook with the lid on the whole time. When they are ready, when they are cooked but not mushy, drain and save the cooking liquid. Remove the casing from the sausage, then shell it by hand. In the pot where the beans were boiled, heat the oil, place the sausage and sizzle over a gentle flame. Add the seasonings: sage and peeled, whole garlic (or poached, if you prefer a milder taste). Stir and allow to season. When the sausage is well browned, you can remove the aromatics. Then shred the peeled tomatoes in a bowl before pouring them into the saucepan. Cook on a gentle heat for about 10 to 15 minutes. Add the cannellini beans. Stir, add the cooking liquid kept aside, about 250 g. Sauté again over medium heat for about 10 minutes, stirring gently. Season with salt to taste. Your baked beans will be ready to be served and enjoyed, we recommend them piping hot with raw extra virgin olive oil, a fresh sprig of rosemary and a grating of pepper!',
      'url':
          'https://www.giallozafferano.it/images/177-17744/Fagioli-all-uccelletto_650x433_wm.jpg'
    },
    {
      'id': 37,
      'isSelected': false,
      'isSaved': false,
      'name': 'Chickpea soup',
      'calories': 356,
      'course': ['Main1'],
      'meal': ['Lunch', 'Dinner'],
      'ingredients': {
        'Chickpeas': '100 g',
        'Carrots': 'half',
        'Celery': 'half rib',
        'White onions': 'half',
        'Leeks': 'half',
        'Extra virgin olive oil': '1 tbsp',
        'Rosemary': '1 sprig',
        'Fine salt': 'to taste',
        'Black pepper': 'to taste',
        'Bay leaf': '1 leaf',
        'Vegetable stock': '0.7 L',
        'Tomato puree': '30 g',
      },
      'preparation':
          'To prepare the chickpea soup, start by soaking the chickpeas. Pour them into a large bowl, cover with water and let them rehydrate for at least 12 hours. After that time has elapsed, place a pot with vegetable broth on the stove to heat it. Meanwhile, drain and rinse the chickpeas. Before cooking, clean the leek: remove the two ends then cut vertically and remove the first two leaves, then cut into thin rounds.  Also peel the celery and with a potato peeler remove the outer, fibrous part. Then chop it finely. Continue by peeling and chopping the onion and carrot as well. Move to the stove and pour the oil into a saucepan, let it heat and then add the chopped celery, carrot and onion and the leek. To help the vegetables stew better, add a ladleful of hot stock and continue cooking for about 10 minutes. At this point pour in the chickpeas, letting them brown for a few minutes. Then add bay leaves and rosemary tied with kitchen twine. Cover the chickpeas with the hot vegetable broth and finally add the tomato puree. Stir and cover with the lid. Let cook on a gentle heat for about 2 to 2 1/2 hours, adding broth as needed. When the cooking is finished, remove the bouquet of herbs and adjust the salt and pepper before serving. Here is your chickpea soup ready, accompany with croutons, if you prefer, and enjoy.',
      'url':
          'https://www.giallozafferano.it/images/182-18212/Zuppa-di-ceci_450x300.jpg'
    },
    {
      'id': 38,
      'isSelected': false,
      'isSaved': false,
      'name': 'Spaghetti with seafood',
      'calories': 598,
      'course': ['Main1'],
      'meal': ['Lunch', 'Dinner'],
      'ingredients': {
        'Spaghetti': '80 g',
        'Mussels': '250 g',
        'Clams': '250 g',
        'Squid': '75 g',
        'Scampi': '2',
        'Tomatoes': '75 g',
        'Garlic': 'half clove',
        'Parsley': 'half tuft',
        'White wine': '10 g',
        'Fine salt': 'to taste',
        'Black pepper': 'to taste',
      },
      'preparation':
          'To prepare seafood spaghetti, start by cleaning the mussels and clams. The latter you will need to rinse them several times under running water and then let them soak in cold water. In the meantime, clean the mussels: scrape away the toughest impurities with the blade of a small knife, tear off the byssus, that is, the barbette part that sticks out, then help yourself with a new steel strawbill clean the shell well. Before cooking, tap the clams one by one on a cutting board or in the sink with the cut of the shell facing downward: if you notice sand it should be discarded. Heat the oil in a fairly large pan and when it is hot pour in the clams and mussels immediately cover with a lid and wait until they are fully opened, this will take 3-4 minutes. Once the mussels and clams are open remove the lid, pour them into a container, do not discard the cooking liquid but strain it to remove any impurities and residual sand. Keep it aside while warm. Shell both clams and mussels, keeping some shellfish with shells aside to garnish the dish. If you do not use them already cleaned, you can devote yourself to cleaning the squid: you will have to remove the head and the innards, subsequently then remove the skin and incise only the superficial part, you can help by entering with the blade inside it, until you open it completely after which cut it into strips. Move on to the scampi: with scissors cut on the sides of the tail, thus removing the shell that covers the abdomen. Then with a toothpick try to remove the intestines, the black fillet present in the langoustine. This way it will not release a bitter taste. Remove only the shell and keep the head and claws. Finally, wash the cherry tomatoes and cut them into wedges. Boil water for pasta, to be salted when boiling. Meanwhile brown garlic clove with oil, when it is browned pour in squid along with a pinch of salt. Cook 5 minutes then deglaze with white wine. Let alcohol evaporate, remove garlic and add cherry tomatoes. Cook another 5 minutes. At this point you can start cooking the spaghetti, which will be to drain very al dente. Also add the scampi to the sauce, season with salt and pepper. Drain the spaghetti directly into the pan when there are 5 minutes left to finish cooking. Continue cooking, pouring as needed the cooking water from the mussels and clams that you have kept aside. Last, also add the mussels and clams with shells and without. When the cooking is finished, turn off the heat, season with chopped parsley and stir one last time. Serve the seafood spaghetti hot.',
      'url':
          'https://www.giallozafferano.it/images/ricette/182/18285/foto_hd/hd650x433_wm.jpg'
    },
    {
      'id': 39,
      'isSelected': false,
      'isSaved': false,
      'name': 'Pasta with eggplant',
      'calories': 381,
      'course': ['Main1'],
      'meal': ['Lunch', 'Dinner'],
      'ingredients': {
        'Pasta': '80 g',
        'Eggplant': '80 g',
        'Basil': 'a few leaves',
        'Fresh spring onion': '25 g',
        'Tomatoes': '70 g',
        'Extra virgin olive oil': '10 g',
        'Fine salt': 'to taste',
        'Black pepper': 'to taste',
      },
      'preparation':
          'To prepare pasta with eggplant first take care of the eggplant. Wash them, trim them and cut them first into slices and then into cubes of about 1 cm. Then transfer them to a colander, salt them lightly and place a saucer with a weight on top of them and let them drain for a couple of hours. When the eggplants have removed all their vegetation water, begin cutting the spring onion first in half and then in fairly thin slices. Pour the oil into a pan, let it heat and add the spring onion. Once it is well browned add the eggplant, season with salt and pepper and let it cook about 15 minutes. Meanwhile, wash the cherry tomatoes and cut them into wedges and add them to the eggplant only when it is tender and cooked. Season with salt and pepper and cook for another 4 to 5 minutes. Meanwhile, cook the pasta in plenty of boiling water, salted to taste; once al dente, drain it and pour it directly into the pan with the eggplant. Saute your pasta with eggplant for a few minutes adding the basil leaves, now all you have to do is serve it!',
      'url':
          'https://blog.giallozafferano.it/mezzestagioni/wp-content/uploads/2020/06/normaver2.jpg'
    },
    {
      'id': 40,
      'isSelected': false,
      'isSaved': false,
      'name': 'Couscous with vegetables',
      'calories': 251,
      'course': ['Main1'],
      'meal': ['Lunch', 'Dinner'],
      'ingredients': {
        'Precooked couscous': '80 g',
        'Hot water': '90 g',
        'Extra virgin olive oil': '15 g',
        'Turmeric powder': 'half tbsp',
        'Carrots': '90 g',
        'Eggplant': '90 g',
        'Tomatoes': '50 g',
        'Fresh chili pepper': '10 g',
        'Fresh Spring Onion': 'half',
        'Fine salt': 'to taste',
        'Garlic': '500 g',
        'Zucchini': '90 g',
        'Jackdaws': '50 g',
        'Fresh ginger': '5 g',
      },
      'preparation':
          'To prepare the vegetable couscous, start by taking care of cleaning and cutting the vegetables and flavorings needed for the recipe. Cut the chili pepper into strips and remove the inner seeds. Wash and clean the vegetables, then coarsely chop the spring onion and cut the eggplant first into slices, then into sticks and finally into cubes. Proceed with the carrots: cut them first into slightly diagonal rounds, and then from them cut into matchsticks. Repeat the same cut for the zucchini as well. Again keeping a slightly diagonal cut, cut the jackdaws into chunks. Finally, cut the cherry tomatoes in half lengthwise as well. Then place a large wok-type skillet on the stove, and heat a drizzle of oil in it. Fry briefly the chili pepper and the whole peeled clove of garlic in it, and as soon as the oil has flavored add the eggplant and spring onion first. Let the eggplant blanch properly, without adding more oil to prevent it from soaking too much, then add the carrots and after a few minutes the green beans and zucchini. Adjust the salt and pepper. Frying, bring the vegetables to a simmer (just a few minutes will do), then remove the garlic and add the cherry tomatoes. Continue cooking for another 1-2 minutes, then turn off the heat: your vegetables are ready. As a final touch, grate in the ginger. Mix well and keep aside.Now deal with the couscous: we used precooked couscous, which is faster and easier to prepare. Pour it into a large bowl, season with salt turmeric (which will give the couscous its typical color as well as an extra aromatic note) AND oil, mix and cover with hot water. Seal with plastic wrap and wait 2 minutes: after this time has passed, the couscous is ready. Shell it thoroughly, turning it out onto a tray and separating the grains with a fork. Now its time to serve on a plate! Place the vegetables in the center of each plate of couscous, and scent with hand-chopped mint leaves. The vegetable couscous is ready to enjoy!',
      'url':
          'https://www.fattoincasadabenedetta.it/wp-content/uploads/2022/10/sito-06-cous-cous-alle-verdure_cover.jpg'
    },
    {
      'id': 41,
      'isSelected': false,
      'isSaved': false,
      'name': 'Pasta sorrentina',
      'calories': 536,
      'course': ['Main1'],
      'meal': ['Lunch', 'Dinner'],
      'ingredients': {
        'Pasta': '80 g',
        'Tomato puree': '125 g',
        'Mozzarella': '40 g',
        'Extra virgin olive oil': '10 g',
        'Garlic': 'half clove',
        'Basil': ' to taste',
        'Fine salt': ' to taste',
        'Grated cheese': '20 g',
      },
      'preparation':
          'To prepare pasta alla sorrentina, start by preparing the sauce. In a large skillet pour the oil and add the peeled garlic clove, sauté for 1 minute and then pour in the tomato puree. Adjust the salt, add a few basil leaves and stir. At this point, cover with the lid and cook for 30 minutes on a gentle heat. At the end of cooking remember to remove the garlic clove. Place on the stove to heat a pot filled with water that will be used for cooking the pasta and in the meantime take care of dicing the mozzarella. When the water has reached a boil cook the pasta. and drain it al dente, directly into the sauce; stir to mix. Pour about half the pasta into a 25-cm-diameter baking dish, so that you make a first layer on top then add half the mozzarella cubes and sprinkle with a little Parmesan. Cover with the remaining dough, then add the mozzarella and finally top with the Parmesan. Return to the oven with the grill mode set for about 5 minutes, until the pasta is nicely gratinated and the mozzarella cheese is melted (if you do not have a grill, you can put the pan on the highest rack and turn the oven on full power, but be careful that it does not burn!). Garnish your pasta alla sorrentina, with fresh basil and bring to the table immediately!',
      'url':
          'https://www.giallozafferano.it/images/192-19253/Pasta-alla-sorrentina_650x433_wm.jpg'
    },
    {
      'id': 42,
      'isSelected': false,
      'isSaved': false,
      'name': 'Pasta and zucchini',
      'calories': 369,
      'course': ['Main1'],
      'meal': ['Lunch', 'Dinner'],
      'ingredients': {
        'Pasta': '80 g',
        'Zucchini': '160 g',
        'Basil': 'to taste',
        'Fine salt': 'to taste',
        'Extra virgin olive oil': '5 g',
        'Black pepper': 'to taste',
        'Garlic': 'half clove',
      },
      'preparation':
          'To prepare pasta and zucchini, you can boil water in a large saucepan and salt it when it comes to a boil. Meanwhile, wash and dry the zucchini, trim them and then grate them with a coarse-hole grater. In a fairly large frying pan, pour the extra-virgin olive oil and heat it over low heat along with a whole clove of garlic, already peeled. As soon as the oil is hot, add the zucchini, season with salt and pepper and let them cook for 5-6 minutes, stirring occasionally; then remove the garlic. Meanwhile, boil the pasta in boiling salted water and drain it al dente, keeping a little cooking water aside. Pour the pasta directly into the pan with the zucchini, along with a little of the cooking water, flake for a few moments, stir and then turn off. Scent the whole thing with some hand-chopped basil and your pasta and zucchini is ready to be enjoyed.',
      'url':
          'https://www.giallozafferano.it/images/166-16633/Pasta-e-zucchine_650x433_wm.jpg'
    },
    {
      'id': 43,
      'isSelected': false,
      'isSaved': false,
      'name': 'Shrimp au gratin',
      'calories': 113,
      'course': ['Main2'],
      'meal': ['Lunch', 'Dinner'],
      'ingredients': {
        'Shrimp': '100 g',
        'Fine salt': 'to taste',
        'White wine': '20 ml',
        'Bread': '25 g breadcrumbs',
        'Grated cheese': '15 g',
        'Extra virgin olive oil': 'to taste',
        'Parsley': '10 g',
        'Garlic': 'half clove',
      },
      'preparation':
          'To prepare the shrimp au gratin, start by cleaning the crustaceans: shell them, leaving the tail, and carve the back of the shrimp with a small knife so as to remove the black thread inside. Lay two shrimp in each shell, so as to occupy the inside, and pour a tbsp of white wine into each one, directly over the shrimp. Prepare the panure: in a bowl arrange the breadcrumbs, chopped parsley, grated Grana Padano cheese and salt. Pour in a drizzle of oil and stir. Add the half clove of minced garlic and stir again. Top each shell with one/two tbsp of the panure and finish with a drizzle of oil. Arrange the shells with shrimp on a baking sheet covered with baking paper and bake at 180° for about 25 minutes.',
      'url':
          'https://blog.giallozafferano.it/ricettedelcuoreblog/wp-content/uploads/2018/07/IMG_9999logo.jpg'
    },
    {
      'id': 44,
      'isSelected': false,
      'isSaved': false,
      'name': 'Tuna beans and onion',
      'calories': 336,
      'course': ['Main2'],
      'meal': ['Lunch', 'Dinner'],
      'ingredients': {
        'Tuna in oil': '120 g',
        'Dried white beans': '80 g',
        'Red onions': '80 g',
        'Extra virgin olive oil': '8 g',
        'Fine salt': 'to taste',
      },
      'preparation':
          'To prepare tuna, beans and onion start with the white beans: put them in a bowl full of water and let them soak for 12 hours. Once this time has passed, drain them and rinse them under running water. Now transfer them to a pot with water (unsalted): the water should completely cover the beans. Cook the beans for 50 minutes with a lid , checking their cooking from time to time: the beans should be tender but not mushy. When there are 3 or 4 minutes left to the end of cooking time, add salt. Once the beans are cooked drain them well and let them cool. Move on to the Tropea onion: cut off the ends, peel it and cut it into very thin rounds. If you prefer a milder flavor from the onion, you can soak it in cold water for at least 1 hour (several hours is better); otherwise continue with the recipe. pour the now-cooled beans into a large bowl, add the onion and drained tuna. Drizzle with extra-virgin olive oil, salt to taste and mix well, helping yourself with a fork and a tbsp. Transfer to a serving dish : your tuna beans and onion are ready to be enjoyed!',
      'url':
          'https://www.giallozafferano.it/images/169-16977/Tonno-fagioli-e-cipolla_780x520_wm.jpg'
    },
    {
      'id': 45,
      'isSelected': false,
      'isSaved': false,
      'name': 'Tomatoes au gratin',
      'calories': 118,
      'course': ['Side'],
      'meal': ['Lunch', 'Dinner'],
      'ingredients': {
        'Parsley': 'chopped 2 tbsp',
        'Garlic': '1 clove',
        'Fine salt': 'to taste',
        'Black pepper': 'to taste',
        'Anchovies in oil': '20 g',
        'Vegetable stock': '80 ml',
        'Extra virgin olive oil': '15 ml',
        'Bread': '55 g breadcrumbs',
        'Capers': '8 g pickled',
        'Basil': '6 leaves',
        'Tomatoes': '150 g',
      },
      'preparation':
          'To make Pugliese-style tomato gratin, get 4 firm auburn tomatoes weighing about 150 g each that are more or less evenly spaced. Wash the tomatoes under running water, then cut the tomatoes to about ¾ of their height, keeping aside the cap with the stem that you will need as a garnish for the final dish. Using a small knife, hollow out the pulp all around the circumference of the tomato and then, using a teaspoon, scoop it out; salt the inside of the tomatoes and place them upside down on a rack to drain (for about 20 minutes), so that they lose their vegetation water. Place the breadcrumbs in a bowl, drain the anchovies from their preserving oil and chop them and add them to the breadcrumbs, also drain the pickled capers and add them to the filling, the crushed garlic, chopped parsley and basil, oil salt and the broth by pouring it in a little at a time until the filling is soft. To prepare the vegetable broth, follow the Vegetable Broth Cooking School sheet found here. Now take the tomatoes and stuff them with the filling using a teaspoon, grease an oven dish with oil, lay the tomatoes inside and bake in a preheated static oven at 200° for about 40 minutes (or ventilated at 180° for 30 minutes). As soon as the tomatoes are slightly wrinkled and the surface is nicely browned, remove them from the oven, let them cool, transfer them to a serving dish and garnish them with the top cap that you set aside. Serve your Apulian-style tomatoes au gratin, accompanying them with a fresh salad if desired.',
      'url':
          'https://www.giallozafferano.it/images/5-581/Pomodori-gratinati-alla-pugliese_780x520_wm.jpg'
    },
    {
      'id': 46,
      'isSelected': false,
      'isSaved': false,
      'name': 'Pan-fried sea bream',
      'calories': 232,
      'course': ['Main2'],
      'meal': ['Lunch', 'Dinner'],
      'ingredients': {
        'Sea bream': '500 g',
        'Extra virgin olive oil': '10 g',
        'Carrots': '40 g',
        'Zucchini': '40 g',
        'Fresh Spring Onion': '20 g',
        'Garlic': '1 clove',
        'Thyme': 'to taste',
      },
      'preparation':
          'To prepare pan-seared gilthead seabream, first take care of cleaning the fish: make a cut on the belly with scissors and remove the innards with your hands, then rinse the inside thoroughly under running water and remove the scales using a scaler or the blade of a knife; do this under running water or inside a plastic bag so as not to spread the scales around. For more details on the process, see our cooking school "Cleaning Sea Bream." Now move on to cutting the vegetables: wash and peel the carrots, then trim the ends and cut them into rounds about 5 mm thick. Wash and trim the zucchini as well, cut them in half lengthwise and then further divide each half; finally cut them into cubes about 1 cm thick. Last, wash the spring onion, remove the base and cut it into rounds about 5 mm thick. Pour the oil into a large nonstick pan, add the poached garlic clove and sauté for a couple of minutes. When the oil has seasoned, remove the garlic from the pan and lay the sea bream inside, then add the carrots, zucchini, spring onion and thyme sprigs, season with salt and pepper to taste. Cover the pan with a lid and cook over medium heat for 7 minutes, after which you turn the sea bream with the help of 2 spatulas being careful not to break them; cover again with the lid and cook for another 7 minutes. Cooking times, of course, may vary depending on the weight of the sea bream you will use.  The pan-seared sea bream is ready to be served!',
      'url':
          'https://www.giallozafferano.it/images/169-16935/Orata-in-padella_780x520_wm.jpg'
    },
    {
      'id': 47,
      'isSelected': false,
      'isSaved': false,
      'name': 'Chicken and green bean rolls',
      'calories': 242,
      'course': ['Main2'],
      'meal': ['Lunch', 'Dinner'],
      'ingredients': {
        'Chicken': '4 slices of breast of 30 g',
        'Green beans': '30 g',
        'Mustard': '10 g',
        'Ham': '35 g',
        'Fine salt': 'to taste',
        'Extra virgin olive oil': '5 g',
        'Potatoes': '100 g',
        'Yogurt': '30 g',
        'Milk': '5 g',
        'Chives': '3 strands',
        'Black pepper': 'to taste',
      },
      'preparation':
          'To prepare the chicken and green bean rolls start with the potatoes that will be used for the side dish, as they have the longest cooking time, so pour them into a pot along with plenty of cold water place it on the stove and let it come to a boil, after which you cook the potatoes for 20-30 minutes depending on their size, testing with a fork. The potatoes will be cooked as soon as they no longer resist, at which point drain them and let them cool a bit finally peel them and let them cool. To cut the cooking time in half, you can cook them in a pressure cooker. Once the boiled potatoes are completely cooled, for convenience and for optimal cutting you could leave them 15 minutes in the freezer, cut them into cubes of a couple of centimeters. Collect the cubes in a bowl and pour in the Greek yogurt along with the chives, which you can cut up with the help of scissors, and stir. If you find that the mixture becomes too thick dilute it by adding 1-2 tbsp of milk, adjust the salt and pepper, stir and store in the refrigerator, covering with plastic wrap. Meanwhile, trim the green beans, then remove the two ends then rinse them under running water and blanch them in plenty of boiling water for 10 to 15 minutes, just long enough to make them a little softer. Then drain the green beans and let them cool a little while also pouring in some cold water to stop the cooking so they will remain a nice green color. Finally arrange the green beans in a bowl and season with salt. On a cutting board arrange the chicken breast slices and salt them only on the surface then spread a little mustard, helping yourself with a tbsp to distribute it. Just above the center arrange a handful of green beans. Starting from the top, roll the chicken slice with the green beans in the middle so that the meat is rolled onto itself and thus obtain a roulade; repeat the operation for all the other slices. Insert two toothpicks for each roulade, this way you will be sure that it will not open during cooking. Pour some extra virgin olive oil in a frying pan and when it is hot lay the roulades, turning them after a few minutes of cooking over high heat and continue so that the meat is sealed well. Let them cool for a few moments and do not discard the cooking oil that will be needed later. Remove the wooden skewers from each roulade and salt the surface that had not been salted previously. On a cutting board arrange the prosciutto slices and starting from the bottom roll the slice all around the roulade so that the prosciutto completely covers the roulade, and do this for everyone. Pour the cooking juices from the rolls into an oven dish and lay them in it, letting them bake in a static oven preheated to 180° for 15 minutes. As soon as the chicken and green bean rolls are cooked you can serve them accompanied by your yogurt potato salad !',
      'url':
          'https://www.giallozafferano.it/images/157-15790/Involtini-di-pollo-e-fagiolini_650x433_wm.jpg'
    },
    {
      'id': 48,
      'isSelected': false,
      'isSaved': false,
      'name': 'Spicy chicken skewers',
      'calories': 238,
      'course': ['Main2'],
      'meal': ['Lunch', 'Dinner'],
      'ingredients': {
        'Chicken': '100 g of breast',
        'Garlic': '1 spice',
        'Fine salt': 'to taste',
        'Black pepper': 'to taste',
        'Hot paprika': '1 tbsp',
        'Cayenne pepper': '1 tbsp',
        'Honey': '5 g',
        'Sesame seeds': '3 g',
        'Extra virgin olive oil': '5 g',
      },
      'preparation':
          'To prepare the spicy chicken skewers, start by taking care of the meat. Take the chicken breast and cut it first into strips and then into cubes of about 2 cm on each side. Transfer them inside a bowl and add the oil. Season with salt and pepper and also add the spices: first the cayenne pepper and then the paprika. Finally add the honey, crushed garlic and mix everything together. At this point cover with plastic wrap and place in the refrigerator to marinate for at least 2 hours, preferably overnight. After this time has elapsed, take steel (or wooden) skewers and stack the pieces of meat, leaving a space between the cubes. Once all the skewers are formed, lay them on a lightly greased hot grill and sprinkle them with sesame seeds. Wait 3-4 minutes, until they are nicely toasted and slightly caramelized. Then turn them over, finish cooking for another 2-3 minutes, and serve your spicy chicken skewers.',
      'url':
          'https://www.giallozafferano.it/images/165-16508/Spiedini-di-pollo-piccanti_450x300.jpg'
    },
    {
      'id': 49,
      'isSelected': false,
      'isSaved': false,
      'name': 'Two-ingredient cookies',
      'calories': 112,
      'course': ['Dessert'],
      'meal': ['Breakfast', 'Lunch', 'Dinner'],
      'ingredients': {
        'Banana': '330 g',
        'Muesli': '110 g',
      },
      'preparation':
          'To make the two-ingredient cookies, start by pouring the muesli into a bowl. Then peel the bananas, remove the strings, and cut them into small pieces. Place the banana pieces in a potato masher and let the resulting puree fall into the bowl with the muesli. Stir with a spoon to combine the mixture, and if desired, add the chocolate chips. Stir again with the spoon to evenly distribute the chips. Next, take a baking sheet, line it with parchment paper, and spoon small mounds of the dough onto it, making sure to compact the cookies well and space them apart to prevent sticking during baking. Let the cookies rest in the freezer for 5-10 minutes. This will make them firmer and help them maintain their shape. Preheat a static oven to 180°C (or a fan oven to around 160°C) and bake the cookies for 15 minutes. Once cooked, remove the cookies from the oven and gently detach them from the baking sheet using a spatula. Transfer them to a wire rack to cool. Your two-ingredient cookies are now ready to enjoy!',
      'url':
          'https://www.giallozafferano.it/images/35-3543/Biscotti-due-ingredienti_780x520_wm.jpg'
    },
    {
      'id': 50,
      'isSelected': false,
      'isSaved': false,
      'name': 'Octopus stew',
      'calories': 199,
      'course': ['Main2'],
      'meal': ['Lunch', 'Dinner'],
      'ingredients': {
        'Octopus': '200 g',
        'Tomato puree': '80 g',
        'White onions': '1',
        'Garlic': '1 clove',
        'Thyme': '4 sprigs',
        'Sage': '2 leaves',
        'Water': '1 L',
        'Extra virgin olive oil': 'to taste',
        'Fine salt': 'to taste',
        'Black pepper': 'to taste',
      },
      'preparation':
          'To prepare the stew octopus, start by cleaning it. After rinsing and drying it thoroughly, place it on a cutting board and score the sac containing the eyes. Then, in the central part, located under the octopus, you will find the beak that needs to be cut away with a small knife. Lastly, clean the inside of the head and rinse everything. Proceed by cleaning the shallot. Then slice it and place it in a bowl. Peel the clove of garlic and move to the stovetop. In a large pot, heat a drizzle of oil, then add the garlic and shallot. Pour in the tomato passata, increase the heat, season with salt, and add the thyme leaves, sage, and water. Heat it well until the mixture reaches a boil, then immerse the octopus tentacles three times. This will cause them to curl nicely. Make sure they have taken on the typical curled shape and then fully immerse them. Cover with a lid and cook over medium heat for 50 minutes. For safety, remember to prick the octopus in the inner part where the beak was. If the fork easily penetrates the flesh, then it is considered cooked. Sprinkle everything with a grind of black pepper, then lift the octopus, moving it to the cutting board. Cut it into pieces of preferred size and serve it with its sauce. Your stew octopus is ready: enjoy your meal.',
      'url':
          'https://blog.giallozafferano.it/dulcisinforno/wp-content/uploads/2019/04/Polpo-in-umido-9341.jpg'
    },
    {
      'id': 51,
      'isSelected': false,
      'isSaved': false,
      'name': 'Grilled zucchini and eggplant',
      'calories': 100,
      'course': ['Side'],
      'meal': ['Lunch', 'Dinner'],
      'ingredients': {
        'Zucchini': '200 g',
        'Eggplant': '200 g',
        'Fine salt': 'to taste',
        'Black pepper': 'to taste',
      },
      'preparation':
          'To prepare grilled vegetables, wash all the vegetables under running cold water and dry them. Slice the zucchini and eggplant into rounds about 4-5 mm thick. Take the peppers, remove the top, cut them in half, then use a knife to remove the white filaments and seeds from the inside. Slice them into rather large cubes and set aside. Remove the stems from the tomatoes and slice them into rounds of the same thickness. Once all the vegetables are cut, heat a grill on the stovetop. When the grill is hot, cook the vegetables in batches. Arrange the peppers side by side, grilling them for 5 minutes and flipping them with kitchen tongs for even cooking. Then, grill the zucchini for 3 minutes and continue with the eggplant for another 3 minutes. Remember to flip the vegetables for even cooking. Finally, grill the tomatoes for 4 minutes until nicely grilled. You can now serve your grilled vegetables, seasoning them with olive oil, salt, and pepper.',
      'url':
          'https://blog.giallozafferano.it/incucinaacasamia/wp-content/uploads/2020/11/IMG_0732-960x1280.jpg'
    },
    {
      'id': 52,
      'isSelected': false,
      'isSaved': false,
      'name': 'Banana smoothie',
      'calories': 59,
      'course': ['Dessert'],
      'meal': ['Lunch', 'Dinner'],
      'ingredients': {
        'Banana': '80 g',
        'Lemons': '10 g juice',
        'Water': '50 g',
      },
      'preparation':
          'To prepare the banana smoothie, start by taking the lemon. Cut it in half and squeeze the juice from one half. Now, take a banana, peel it, and slice it into rounds. Place the banana slices in a bowl and sprinkle them with the juice from half a lemon. Next, take the banana that you added the lemon juice to and put it in a blender. Add the water. Blend well until you obtain a smooth and homogeneous mixture. Now, serve your banana smoothie in a glass or a pitcher.',
      'url':
          'https://www.giallozafferano.it/images/154-15424/Frullato-alla-banana_780x520_wm.jpg'
    },
    {
      'id': 53,
      'isSelected': false,
      'isSaved': false,
      'name': 'Green bean, carrot, corn and tuna salad',
      'calories': 205,
      'course': ['Main2'],
      'meal': ['Lunch', 'Dinner'],
      'ingredients': {
        'Green beans': '120 g',
        'Tuna in oil': '60 g',
        'Carrots': '100 g',
        'Corn': '40 g',
        'Fine salt': 'to taste',
        'Extra virgin olive oil': 'to taste',
      },
      'preparation':
          'To make the green bean salad with carrots, corn, and tuna, first place a pot of water on the stove and bring it to a boil. Wash and dry the green beans, trim the ends, and boil them in the hot water for 7 minutes. Once boiled, drain them and transfer to a bowl of ice water to stop the cooking process. Once cooled, cut the green beans in half and place them in a large bowl. Now, trim and peel the carrots, cut them into quarters lengthwise, and then slice them into small triangles. Take the bowl with the cooked green beans, add the drained corn and the tuna, also drained from its oil, and then add the carrots. Season with salt and oil, and mix well. Your green bean salad with carrots, corn, and tuna is ready to be served.',
      'url':
          'https://www.giallozafferano.it/images/191-19153/Insalata-di-fagiolini-carote-mais-e-tonno_780x520_wm.jpg'
    },
    {
      'id': 54,
      'isSelected': false,
      'isSaved': false,
      'name': 'Yougurt Smoothie',
      'calories': 71,
      'course': ['Dessert'],
      'meal': ['Lunch', 'Dinner'],
      'ingredients': {
        'Yogurt': '60 g',
        'Lemons': '10 g juice',
        'Melon': '100 g pulp',
        'Peach pulp': '90g',
      },
      'preparation':
          "To prepare the yogurt smoothie, first wash the peaches (you will need about 3), peel them, and remove the pits. Then roughly chop them into pieces and set aside. Now, let's deal with the melon: cut it in half, remove the seeds and the rind, then cut it into pieces. Cut the lime in half and juice it using a juicer. Collect the juice in a glass and set it aside. Now, take a blender and add the melon and peaches to it. Pour in the yogurt and the lime juice, then close the blender and blend until you obtain a creamy mixture. There you have it, your fresh yogurt smoothie is ready!",
      'url':
          'https://magazine.giallozafferano.it/wp-content/uploads/2016/06/smoothie.jpg'
    },
    {
      'id': 55,
      'isSelected': false,
      'isSaved': false,
      'name': 'Ice cream melon',
      'calories': 108,
      'course': ['Dessert'],
      'meal': ['Lunch', 'Dinner'],
      'ingredients': {
        'Melon': '500 g',
      },
      'preparation':
          'Start by cleaning the melon: cut off the ends of the melon to create a stable base, then halve it and remove the seeds from the inside using a spoon. Slice each half into moderately thick slices, remove the rind from each slice, and finally cut them into cubes about 2 cm thick. Spread the cubes on a tray, making sure not to overlap them, cover with plastic wrap, and transfer it to the freezer. Allow the fruit to harden, which usually takes at least 12 hours. Once the fruit is frozen, you can blend it to create your refreshing dessert: pour the frozen melon into a blender or a mixer with steel blades and blend until it becomes creamy. Then, transfer it to a bowl. Transfer your frozen fruit into separate bowls or cups and serve immediately!',
      'url':
          'https://www.giallozafferano.it/images/169-16961/Frutta-gelata_650x433_wm.jpg'
    },
    {
      'id': 56,
      'isSelected': false,
      'isSaved': false,
      'name': 'Pineapple ice cream',
      'calories': 108,
      'course': ['Dessert'],
      'meal': ['Lunch', 'Dinner'],
      'ingredients': {
        'Ananas': '500 g',
      },
      'preparation':
          'To clean the pineapple, remove the base and the top by cutting them off with a knife. Then, divide the pineapple into 4 wedges, remove the woody core, and peel off the skin. Cut each wedge in half lengthwise and slice the resulting pieces into chunks about 1 cm thick. Spread the pineapple chunks on a tray, cover them with plastic wrap, and transfer them to the freezer. Once the pineapple has hardened, transfer it to a freezer bag and keep it in the freezer for at least 12 hours. When the fruit is frozen, you can blend it to create your refreshing dessert: pour the frozen pineapple into a blender or a mixer with steel blades and blend until it becomes creamy. Then, transfer it to a bowl. Transfer your frozen fruit into separate bowls or cups and serve immediately!',
      'url':
          'https://www.giallozafferano.it/images/169-16961/Frutta-gelata_650x433_wm.jpg'
    },
    {
      'id': 57,
      'isSelected': false,
      'isSaved': false,
      'name': 'Ice cream strawberries',
      'calories': 108,
      'course': ['Dessert'],
      'meal': ['Lunch', 'Dinner'],
      'ingredients': {
        'Strawberries': '500 g',
      },
      'preparation':
          'To clean the strawberries, wash and dry them, then remove the stems and cut them in half. At this point, you can transfer them to a tray without overlapping and freeze them for at least 12 hours. When the fruit is frozen, you can blend it to create your refreshing dessert: pour the frozen strawberries into a blender or a mixer with steel blades and blend until they become creamy. Then, transfer them to a bowl. Transfer your frozen fruit into separate bowls or cups and serve immediately!',
      'url':
          'https://www.giallozafferano.it/images/169-16961/Frutta-gelata_650x433_wm.jpg'
    },
    {
      'id': 58,
      'isSelected': false,
      'isSaved': false,
      'name': 'Fruit porridge',
      'calories': 100,
      'course': ['Breakfast'],
      'meal': ['Breakfast'],
      'ingredients': {
        'Oat flakes': '30 g',
        'Milk': '150 ml',
        'Water': '50 ml',
        'Honey': '2 tbsp',
        'Cinnamon': '1 pinch',
      },
      'preparation':
          'In a small saucepan, mix the oatmeal with the milk and water, bringing slowly to a boil. Simmer the mixture over low heat for about 15 minutes, stirring occasionally to keep it from sticking, until the water has evaporated and the mixture has become creamy. At this point, turn off the heat and transfer the porridge to a bowl; stuff it to your liking by adding fresh fruit to taste (150 grams) or honey. For example, you can add 1 tbsp of honey and some fruit (including dried fruit) and various seeds, finally scenting it with a pinch of cinnamon. Or you can enrich it with dark chocolate chips and coconut flour. Your satiating and nutritious super breakfast is served!',
      'url':
          'https://blog.giallozafferano.it/dulcisinforno/wp-content/uploads/2019/08/Porridge-ricetta-1161.jpg'
    },
    {
      'id': 59,
      'isSelected': false,
      'isSaved': false,
      'name': 'Pancakes fit with chocolate',
      'calories': 100,
      'course': ['Breakfast'],
      'meal': ['Breakfast'],
      'ingredients': {
        'Oatmeal': '40 g',
        'Eggs': '1',
        'Dark chocolate': '10 g',
        'Yeast': '5 g',
      },
      'preparation':
          'Preheat a nonstick skillet over low heat. Chop the dark chocolate finely. Combine the oat flour, egg white and baking powder in a bowl and mix well, avoiding lumps. Finally, add the chopped dark chocolate, keeping a few grains aside for the final topping. Grease a washcloth with a little oil and wipe it over the hot pan to lightly grease it. Pour the pancakes mixture in small circles onto the pan and, when you see bubbles, flip it to the other side until it too is golden brown. Repeat the process until the batter is done. When ready, stack them to form a turret, and if you have any, garnish them using berries.',
      'url':
          'https://www.fitwithfun.it/wp-content/uploads/2019/12/Pancakes-con-Fiocchi-di-Latte-Proteici-e-Low-Carb-sito.jpg'
    },
    {
      'id': 60,
      'isSelected': false,
      'isSaved': false,
      'name': 'French Toast',
      'calories': 300,
      'course': ['Breakfast'],
      'meal': ['Breakfast'],
      'ingredients': {
        'Bread': '4 slices',
        'Eggs': '2',
        'Milk': '40 ml',
        'Cinnamon': '1 tbsp',
        'Yogurt': '4 tbsp',
        'Marmalade': 'to taste',
      },
      'preparation':
          'Mix egg whites, milk and cinnamon in a bowl. Pass the slices of whole wheat bread into the mixture on both sides. Put a drizzle of oil in a skillet and cook the bread for 3 minutes per side. Remove it from the pan and spread the white yogurt and jam on top. If you have any, complete your French Toast with fresh berries and top with the second slice of whole wheat bread.',
      'url':
          'https://www.tavolartegusto.it/wp/wp-content/uploads/2021/04/French-toast-ricetta.jpg'
    },
    {
      'id': 61,
      'isSelected': false,
      'isSaved': false,
      'name': 'Toasted bread with marmalade and walnuts',
      'calories': 300,
      'course': ['Breakfast'],
      'meal': ['Breakfast'],
      'ingredients': {
        'Toast': '4 slices',
        'Marmalade': 'to taste',
        'Walnuts': '3',
        'Yogurt': 'to taste',
      },
      'preparation':
          'Spread a layer of 100% fruit jam (no added sugar) on a slice of toast and add two or three nuts. This combination makes for a super energetic and nutritious breakfast. "Toast is an excellent source of complex carbohydrates with fiber, while walnuts provide polyunsaturated lipids that can add satiety and minerals that promote nervous system balance. Jam is a source of fast-absorbing simple sugars that give ready energy. Adding a white yogurt or a glass of milk will ensure the protein quota."',
      'url':
          'https://www.nutrizioneferrari.it/wp-content/uploads/2020/03/colazione-pane-marmellata-e-noci.jpeg'
    },
    {
      'id': 62,
      'isSelected': false,
      'isSaved': false,
      'name': 'Bread, tomato and aged cheese',
      'calories': 250,
      'course': ['Breakfast'],
      'meal': ['Breakfast'],
      'ingredients': {
        'Bread': '4 slices',
        'Tomatoes': 'to taste',
        'Matured cheese': 'to taste',
      },
      'preparation':
          'For those who prefer a savory breakfast to a sweet one, bread, tomato and aged cheese is a combination that can be prepared in a jiffy and ensures a nutritionally balanced meal. "Aged cheese is rich in vitamin D and calcium, which are necessary for bone health, and phosphorus and other minerals valuable for memory and proper brain function. Tomatoes, on the other hand, are a source of antioxidants and fiber, which help keep cholesterol levels down."',
      'url':
          'https://i0.wp.com/www.parliamodicucina.com/wp-content/uploads/2014/10/Pane-e-pomodoro-parliamo-di-cucina.jpg'
    },
    {
      'id': 63,
      'isSelected': false,
      'isSaved': false,
      'name': 'Ricotta cheese mousse, cocoa, orange',
      'calories': 220,
      'course': ['Breakfast'],
      'meal': ['Breakfast'],
      'ingredients': {
        'Ricotta': '100 g',
        'Cocoa': 'to taste',
        'Orange': '1',
      },
      'preparation':
          'Pour the ricotta cheese into a glass. Sprinkle some bitter cocoa on top and add orange segments. "With cottage cheese you ensure that in addition to essential fats, calcium and vitamin D, you also get glutamic acid, the precursor of GABA, the hormone that helps you feel more relaxed and in harmony. Orange, on the other hand, gives the first meal of the day high amounts of vitamin C and carotenoids that defend the body from external aggressions, while cocoa guarantees many flavonoids that protect the cardiovascular system and good amounts of iron that is easily assimilated by the body thanks to the presence of ascorbic acid in the fruit."',
      'url':
          'https://blog.giallozafferano.it/lebistro/wp-content/uploads/2017/01/DSC_0989.jpg'
    },
    {
      'id': 64,
      'isSelected': false,
      'isSaved': false,
      'name': 'Milk, cookies, fruit',
      'calories': 400,
      'course': ['Breakfast'],
      'meal': ['Breakfast'],
      'ingredients': {
        'Milk': '250 ml',
        'Whole grain cookies': '4',
        'Fruit': '1',
      },
      'preparation':
          'Classic breakfast of milk and cookies. Also supplement with a fruit of your choice (apple, banana, pear, peach....)',
      'url':
          'https://cdn.nonnapaperina.it/wp-content/uploads/2018/01/Colazione-con-biscotti-di-mandorla-w.jpg'
    },
    {
      'id': 65,
      'isSelected': false,
      'isSaved': false,
      'name': 'Porcini mushroom risotto',
      'calories': 488,
      'course': ['Main1'],
      'meal': ['Lunch', 'Dinner'],
      'ingredients': {
        'Rice': '70 g',
        'Porcini mushrooms': '100 g',
        'White onions': '1/2',
        'Butter': '20 g',
        'Grated cheese': '20 g',
        'Fine salt': 'to taste',
        'Parsley': 'to taste',
        'White wine': '20 g',
        'White pepper': 'to taste',
        'Extra virgin olive oil': 'to taste',
      },
      'preparation':
          'To prepare the mushroom risotto, start by cleaning the Porcini mushrooms. Remove the end part of the stem, then peel them using a small knife, to do this start from the base of the cap and gently pull the skin to the center. Then remove the stems as well and keep the scraps aside that will be used to make the broth. At this point take care of making the mushroom broth. Pour the scraps into a saucepan, add water and let them simmer for about 30 minutes. Meanwhile, dice the mushroom heads as well and finely chop a half onion. Take a large saucepan that will be used for cooking the risotto, add half the amount of butter (40 g) and let it melt gently. Then add the onion and let it brown before adding the mushrooms. Cook over medium-high heat for 5 minutes, stirring occasionally and making sure that the mushrooms do not release liquid. At this point add the rice and stir often so that it is toasted. After a few minutes, deglaze with the white wine and only when the alcohol part has completely evaporated add a couple of ladles of broth, straining it through a colander directly inside the pan. Adjust the salt and continue cooking for about 13 minutes, basting occasionally with the hot strained broth, until it is cooked through. Then turn off the heat and take care of stirring the risotto: first add the remaining 40 g of butter and stir until it is completely melted; then add the Parmigiano and stir again. Now finely chop the parsley; season the rice with ground white pepper, parsley and a drizzle of oil. Stir to blend the flavors and adjust the density of the risotto by adding more broth if necessary, stir again, and serve your mushroom risotto still hot.',
      'url':
          'https://www.chezuppa.com/wp-content/uploads/2021/10/risotto-funghi-porcini02.jpg'
    },
  ];
}//Ingredients

/*     {'id': num,
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
      'ingredient6': 'quantity6',
      'ingredient7': 'quantity7',
    },
    'preparation': '',
    'url': ''
    }, */