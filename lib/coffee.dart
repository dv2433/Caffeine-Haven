import 'dart:math';

final random = Random();
final x = 200;

final coffees = List.generate(
  _names.length,
  (index) => Coffee(
    image: 'image/${index + 1}.png',
    name: _names[index],
    price: (x + random.nextInt(1000)).toString(),
    info: _infos[index],
  ),
);

class Coffee {
  Coffee({
    required this.name,
    required this.image,
    required this.price,
    required this.info,

  });

  final String name;
  final String image;
  final String price;
  final String info;

}

final _names = [
  'Caramel Cold Drink',
  'Iced Coffe Mocha',
  'Caramelized Pecan Latte',
  'Toffee Nut Latte',
  'Capuchino',
  'Toffee Nut Iced Latte',
  'Americano',
  'Caramel Macchiato',
  'Vietnamese-Style Iced Coffee',
  'Black Tea Latte',
  'Classic Irish Coffee',
  'Toffee Nut Crunch Latte',
];

final _infos = [
  'Caramel Cold Drink: A delightful fusion of creamy caramel flavor and icy refreshment, indulging your taste buds with every sip.',
  'Iced Coffee Mocha: A heavenly blend of rich, velvety chocolate and bold coffee over ice, creating the perfect pick-me-up for coffee lovers.',
  'Caramelized Pecan Latte: A delectable blend of rich espresso, creamy caramel, and toasted pecans for a delightful nutty indulgence.',
  'Toffee Nut Latte: A luscious combination of smooth toffee, aromatic nuttiness, and velvety espresso for a blissful sip of warmth.',
  'Capuchino: Capuchino is a delicious coffee beverage made with espresso, steamed milk, and a frothy milk foam topping.',
  'Toffee Nut Iced Latte: Toffee Nut Iced Latte is a refreshing coffee drink featuring the rich flavors of toffee and nut combined with chilled milk and espresso.',
  'Americano: Americano is a classic espresso-based beverage made by diluting espresso shots with hot water, resulting in a bold and smooth coffee experience.',
  'Caramel Macchiato: Caramel Macchiato: Creamy espresso delight with a caramel twist.',
  'Vietnamese-Style Iced Coffee: Strong coffee, sweetened with condensed milk, poured over ice.',
  'Black Tea Latte: A velvety blend of black tea and steamed milk, offering a comforting and satisfying beverage.',
  'Classic Irish Coffee: Hot coffee, Irish whiskey, brown sugar, and whipped cream in perfect harmony.',
  'Toffee Nut Crunch Latte: Indulgent blend of toffee, nutty goodness, and smooth steamed milk.'
];

