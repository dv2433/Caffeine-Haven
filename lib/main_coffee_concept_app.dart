import 'package:coffeeapp/coffee_bloc.dart';
import 'package:coffeeapp/coffee_concept_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MainCoffeeConceptApp extends StatefulWidget {
  const MainCoffeeConceptApp({Key? key}) : super(key: key);

  @override
  State<MainCoffeeConceptApp> createState() => _MainCoffeeConceptAppState();
}

class _MainCoffeeConceptAppState extends State<MainCoffeeConceptApp> {
  final bloc = CoffeeBloC();

  @override
  void initState() {
    bloc.init();
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData.light(),
        child: CoffeeProvider(
          bloC: bloc,
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: CoffeeConceptHome(),
          ),
        ));
  }
}
