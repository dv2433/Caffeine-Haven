import 'package:coffeeapp/coffee.dart';
import 'package:coffeeapp/coffee_concept_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CoffeeConceptHome extends StatelessWidget {
  const CoffeeConceptHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: GestureDetector(
      onVerticalDragUpdate: (details) {
        if (details.primaryDelta! < -20) {
          Navigator.of(context).push(
            PageRouteBuilder(
                transitionDuration: const Duration(microseconds: 650),
                pageBuilder: (context, animation, _) {
                  return FadeTransition(
                    opacity: animation,
                    child: CoffeeConceptList(),
                  );
                }),
          );
        }
      },
      child: Stack(
        children: [
          SizedBox.expand(
            child: DecoratedBox(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Color(0XFFA89276),
                    Colors.white,
                  ])),
            ),
          ),
          Positioned(
              height: size.height * 0.4,
              left: 0,
              right: 0,
              top: size.height * 0.15,
              child: Hero(
                tag: coffees[6].name,
                child: Image.asset(
                  coffees[6].image,
                ),
              )),
          Positioned(
              height: size.height * 0.7,
              left: 0,
              right: 0,
              bottom: 0,
              child: Hero(
                tag: coffees[7].name,
                child: Image.asset(
                  coffees[7].image,
                  fit: BoxFit.cover,
                ),
              )),
          Positioned(
              height: size.height,
              left: 0,
              right: 0,
              bottom: -size.height * 0.8,
              child: Hero(
                tag: coffees[8].name,
                child: Image.asset(
                  coffees[8].image,
                  fit: BoxFit.cover,
                ),
              )),
          Positioned(
              height: 140,
              left: size.width * 0.19,
              right: 0,
              bottom: size.height * 0.27,
              child:
              Text(
                'Caffeine',
                style: GoogleFonts.leckerliOne(textStyle: TextStyle(color: Colors.white,fontSize: 60,fontWeight: FontWeight.w800)),
              ),
              // Image.asset('image/logo2.png'),
              ),
          Positioned(
            height: 140,
            left: size.width * 0.295,
            right: 0,
            bottom: size.height * 0.17,
            child:
            Text(
              'Haven',
              style: GoogleFonts.leckerliOne(textStyle: TextStyle(color: Colors.white,fontSize: 55,fontWeight: FontWeight.w800)),
            ),
            // Image.asset('image/logo2.png'),
          ),
        ],
      ),
    ));
  }
}
