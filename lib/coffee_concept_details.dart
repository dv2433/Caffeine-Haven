import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:slider_button/slider_button.dart';


import 'coffee.dart';
class CoffeeConceptDetails extends StatefulWidget {
  final Coffee coffee;

  static List<Coffee> cartItems = [];


  static void addItemToCart(int index){
    cartItems.add(coffees[index]);
  }

  static void removeItemFromCart(int index){
    cartItems.removeAt(index);
  }

  // static double totalPrice = 0;
  // static double calculateTotal(){
  //   double total = 0;
  //   for(int i=0;i<cartItems.length;i++){
  //     total+=double.parse(cartItems[i].price);
  //   }
  //   return total;
  // }


  const CoffeeConceptDetails({Key? key, required this.coffee})
      : super(key: key);

  @override
  State<CoffeeConceptDetails> createState() =>
      _CoffeeConceptDetailsState(coffee: coffee);
}

class _CoffeeConceptDetailsState extends State<CoffeeConceptDetails> {
  Coffee coffee;
  int s = -1;
  int m = -1;
  int l = -1;

  _CoffeeConceptDetailsState({required this.coffee});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(
          color: Colors.black,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.2),
            child: Hero(
                tag: "text_${coffee.name}",
                child: Material(
                  child: Text(
                    coffee.name,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                )),
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            height: size.height * 0.4,
            child: Stack(
              children: [
                Positioned.fill(
                    child: Hero(
                  tag: coffee.name,
                  child: Image.asset(
                    coffee.image,
                    fit: BoxFit.fitHeight,
                  ),
                )),
                Positioned(
                  left: size.width * 0.05,
                  bottom: 0,
                  child: TweenAnimationBuilder<double>(
                      tween: Tween(begin: 1.0, end: 0.0),
                      builder: (context, value, child) {
                        return Transform.translate(
                          offset: Offset(-100 * value, 240 * value),
                          child: child,
                        );
                      },
                      duration: const Duration(milliseconds: 500),
                      child: Row(
                        children: [
                          Icon(Icons.currency_rupee,
                              size: 50,
                              color: Colors.white,
                              shadows: [
                                BoxShadow(
                                  color: Colors.brown,
                                  blurRadius: 18,
                                  spreadRadius: 20,
                                )
                              ]),
                          Text(
                            '${coffee.price.toString()}',
                            style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                                shadows: [
                                  BoxShadow(
                                    color: Colors.brown,
                                    blurRadius: 18,
                                    spreadRadius: 20,
                                  )
                                ]),
                          ),
                        ],
                      )),
                )
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.04,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    s = 0;
                    m = -1;
                    l = -1;
                  });
                },
                child: Container(
                    height: size.height * 0.12,
                    child: Column(
                      children: [
                        Image.asset(
                          'image/taza_s.png',
                          height:
                              s == 0 ? size.height * 0.035 : size.height * 0.03,
                        ),
                        SizedBox(
                          height: size.height * 0.032,
                        ),
                        Text(
                          'S',
                          style: TextStyle(
                              fontSize: s == 0 ? 22 : 20,
                              fontWeight:
                                  s == 0 ? FontWeight.w800 : FontWeight.w400,
                              color: Colors.brown),
                        ),
                      ],
                    )),
              ),
              SizedBox(
                width: size.width * 0.08,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    s = -1;
                    m = 0;
                    l = -1;
                  });
                },
                child: Container(
                    height: size.height * 0.12,
                    child: Column(
                      children: [
                        Image.asset(
                          'image/taza_m.png',
                          height:
                              m == 0 ? size.height * 0.045 : size.height * 0.04,
                        ),
                        SizedBox(
                          height: size.height * 0.023,
                        ),
                        Text(
                          'M',
                          style: TextStyle(
                              fontSize: m == 0 ? 22 : 20,
                              fontWeight:
                                  m == 0 ? FontWeight.w800 : FontWeight.w400,
                              color: Colors.brown),
                        ),
                      ],
                    )),
              ),
              SizedBox(
                width: size.width * 0.08,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    s = -1;
                    m = -1;
                    l = 0;
                  });
                },
                child: Container(
                    height: size.height * 0.12,
                    child: Column(
                      children: [
                        Image.asset(
                          'image/taza_l.png',
                          height:
                              l == 0 ? size.height * 0.055 : size.height * 0.05,
                        ),
                        SizedBox(
                          height: size.height * 0.015,
                        ),
                        Text(
                          'L',
                          style: TextStyle(
                              fontSize: l == 0 ? 22 : 20,
                              fontWeight:
                                  l == 0 ? FontWeight.w800 : FontWeight.w400,
                              color: Colors.brown),
                        ),
                      ],
                    )),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: Container(
                      margin: EdgeInsets.all(6),
                      padding: EdgeInsets.all(10),
                      height: size.height * 0.12,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(189, 255, 146, 43)
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              '${coffee.info}',
                              style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ))),
            ],
          ),
          Container(
            margin: EdgeInsets.all(6),
            child: SliderButton(
              action: () {
                Fluttertoast.showToast(
                    msg: 'Your Coffee has been Sucessfully added to Cart',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.yellow
                );

                setState(() {
                  CoffeeConceptDetails.cartItems.add(coffee);
                  // CoffeeConceptDetails.totalPrice = CoffeeConceptDetails.calculateTotal();
                });


                Navigator.pop(context);
              },
              label: Text(
                "Add to Cart\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 17),
              ),
              icon: Center(
                  child: Icon(
                    Icons.shopping_cart_sharp,
                    color: Colors.white,
                    size: 40.0,
                    semanticLabel: 'Text to announce in accessibility modes',
                  )),

              ///Change All the color and size from here.
              width: 230,
              radius: 12,
              buttonSize: 60,
              buttonColor: Color.fromARGB(189, 255, 207, 161),
              backgroundColor: Color.fromARGB(255, 255, 138, 43),
              highlightedColor: Colors.black12,
              baseColor: Colors.white,
            ),
          )

        ],
      ),
    );
  }
}
