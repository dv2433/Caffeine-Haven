import 'dart:math';

import 'package:coffeeapp/coffee_concept_list.dart';
import 'package:coffeeapp/payment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:slider_button/slider_button.dart';

import 'coffee_concept_details.dart';

class CoffeeCart extends StatefulWidget {
  // final TotalPrice;

  const CoffeeCart({Key? key}) : super(key: key);

  @override
  State<CoffeeCart> createState() => _CoffeeCartState();
}

class _CoffeeCartState extends State<CoffeeCart> {
  double TotalPrice = 0;
  double Discount = 0;
  double withGst = 0;
  double TotalAmount = 0;


  @override
  void initState() {
    for (int i = 0; i < CoffeeConceptDetails.cartItems.length; i++) {
      TotalPrice += double.parse(CoffeeConceptDetails.cartItems[i].price);
    }

    Discount = TotalPrice*0.1;
    withGst = (TotalPrice - Discount) * 0.02;
    TotalAmount = (TotalPrice - Discount) + ((TotalPrice - Discount) * 0.02);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    // if (CoffeeConceptDetails.cartItems.length == 0)
    //   return WillPopScope(
    //       child: Scaffold(
    //           backgroundColor: Colors.white,
    //           appBar: AppBar(
    //             title: Text(
    //               'Your Cart',
    //               style: TextStyle(color: Colors.brown),
    //             ),
    //             elevation: 0,
    //             backgroundColor: Colors.white,
    //             leading: IconButton(
    //               onPressed: () {
    //                 Navigator.pushReplacement(context,
    //                     MaterialPageRoute(builder: (_) => CoffeeConceptList()));
    //               },
    //               icon: Icon(
    //                 Icons.arrow_back_ios_outlined,
    //                 color: Colors.brown,
    //               ),
    //             ),
    //           ),
    //           body: Container(
    //             decoration: BoxDecoration(
    //               image: DecorationImage(
    //                 image: AssetImage("image/CartCoffee.png"),
    //                 colorFilter:
    //                 ColorFilter.mode(Colors.black.withOpacity(0.5),
    //                     BlendMode.dstATop),
    //                 fit: BoxFit.cover,
    //               ),
    //             ),
    //             child: Column(
    //               children: [
    //                 Expanded(
    //                   child: Center(
    //                       child: Text(''),
    //                       // Image.asset('image/CartCoffee.png', opacity: const AlwaysStoppedAnimation(.5),)
    //                   ),
    //                 ),
    //                 Container(
    //                   height: size.height * 0.209,
    //                   margin: EdgeInsets.all(15),
    //                   child: Column(
    //                     children: [
    //                       Row(
    //                         children: [
    //                           Text(
    //                             'Total MRP',
    //                             style: TextStyle(
    //                                 fontSize: 16, fontWeight: FontWeight.w500),
    //                           ),
    //                           SizedBox(
    //                             width: size.width * 0.4139,
    //                           ),
    //                           Text('₹ ${TotalPrice}'),
    //                         ],
    //                       ),
    //                       Row(
    //                         children: [
    //                           Text('Discount on MRP'),
    //                           SizedBox(
    //                             width: size.width * 0.318,
    //                           ),
    //                           if (CoffeeConceptDetails.cartItems.length == 0)
    //                             Text('₹ 0')
    //                           else
    //                             Text('₹ 300'),
    //                         ],
    //                       ),
    //                       Row(
    //                         children: [
    //                           Text('Add GST 2%'),
    //                           SizedBox(
    //                             width: size.width * 0.41,
    //                           ),
    //                           if (CoffeeConceptDetails.cartItems.length == 0)
    //                             Text('₹ 0')
    //                           else
    //                             Text('₹ ${withGst}'),
    //                         ],
    //                       ),
    //                       Divider(),
    //                       Row(
    //                         children: [
    //                           Text(
    //                             'Total Amount',
    //                             style: TextStyle(
    //                                 fontSize: 20, fontWeight: FontWeight.w800),
    //                           ),
    //                           SizedBox(
    //                             width: size.width * 0.28,
    //                           ),
    //                           if (CoffeeConceptDetails.cartItems.length == 0)
    //                             Text(
    //                               '₹ 0',
    //                               style: TextStyle(
    //                                   fontSize: 20,
    //                                   fontWeight: FontWeight.w800),
    //                             )
    //                           else
    //                             Text(
    //                               '₹ ${TotalAmount}',
    //                               style: TextStyle(
    //                                   fontSize: 20,
    //                                   fontWeight: FontWeight.w800),
    //                             ),
    //                         ],
    //                       ),
    //                       SizedBox(
    //                         height: size.height * 0.01,
    //                       ),
    //                       Row(
    //                         mainAxisAlignment: MainAxisAlignment.center,
    //                         children: [
    //                           Expanded(
    //                             child: SliderButton(
    //                               action: () {
    //                                 Fluttertoast.showToast(
    //                                     msg: 'Payment Successful',
    //                                     toastLength: Toast.LENGTH_SHORT,
    //                                     gravity: ToastGravity.BOTTOM,
    //                                     timeInSecForIosWeb: 1,
    //                                     backgroundColor: Colors.red,
    //                                     textColor: Colors.yellow);
    //                               },
    //                               label: Text(
    //                                 "Swipe for Pay\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t",
    //                                 style: TextStyle(
    //                                     color: Colors.white,
    //                                     fontWeight: FontWeight.w500,
    //                                     fontSize: 17),
    //                               ),
    //                               icon: Center(
    //                                   child: Icon(
    //                                 Icons.shopping_cart_sharp,
    //                                 color: Colors.white,
    //                                 size: 40.0,
    //                                 semanticLabel:
    //                                     'Text to announce in accessibility modes',
    //                               )),
    //
    //                               ///Change All the color and size from here.
    //                               height: size.height * 0.08,
    //                               // width: size.width*0.9,
    //                               radius: 12,
    //                               buttonSize: 60,
    //                               buttonColor:
    //                                   Color.fromARGB(189, 255, 207, 161),
    //                               backgroundColor:
    //                                   Color.fromARGB(255, 255, 138, 43),
    //                               highlightedColor: Colors.black12,
    //                               baseColor: Colors.white,
    //                             ),
    //                           )
    //                         ],
    //                       )
    //                     ],
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           )),
    //       onWillPop: () async {
    //         Navigator.pushReplacement(context,
    //             MaterialPageRoute(builder: (_) => CoffeeConceptList()));
    //         return true;
    //       });
    // else
    return WillPopScope(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text(
                'Your Cart',
                style: TextStyle(color: Colors.brown),
              ),
              elevation: 0,
              backgroundColor: Colors.white,
              leading: IconButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) => CoffeeConceptList()));
                },
                icon: Icon(
                  Icons.arrow_back_ios_outlined,
                  color: Colors.brown,
                ),
              ),
            ),
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("image/CartCoffee.png"),
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.5), BlendMode.dstATop),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: CoffeeConceptDetails.cartItems.length,
                      itemBuilder: (context, index) {
                        final item = CoffeeConceptDetails.cartItems[index].name;
                        return Padding(
                          padding: const EdgeInsets.all(12),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color.fromARGB(189, 255, 146, 43),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Dismissible(
                              // Each Dismissible must contain a Key. Keys allow Flutter to
                              // uniquely identify widgets.
                              key: Key(item),
                              // Provide a function that tells the app
                              // what to do after an item has been swiped away.
                              onDismissed: (direction) {
                                // Remove the item from the data source.
                                setState(() {
                                  CoffeeConceptDetails.cartItems
                                      .removeAt(index);
                                  TotalPrice = 0;
                                  Discount = 0;
                                  withGst = 0;
                                  TotalAmount = 0;

                                  for (int i = 0; i < CoffeeConceptDetails.cartItems.length; i++) {
                                    TotalPrice += double.parse(
                                        CoffeeConceptDetails
                                            .cartItems[i].price);
                                  }
                                  Discount = TotalPrice*0.1;
                                  withGst = (TotalPrice - Discount) * 0.02;
                                  TotalAmount = (TotalPrice - Discount) + ((TotalPrice - Discount) * 0.02);
                                });

                                // Then show a snackbar.
                                // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                //     content: Text(
                                //         '${CoffeeConceptDetails.cartItems[index]
                                //             .name} remove from your Cart')));
                              },
                              // Show a red background as the item is swiped away.
                              background: Container(color: Colors.red),
                              child: ListTile(
                                  leading: Image.asset(
                                    CoffeeConceptDetails.cartItems[index].image,
                                    height: 36,
                                  ),
                                  title: Text(item),
                                  subtitle: Row(
                                    children: [
                                      Icon(
                                        Icons.currency_rupee,
                                        size: 20,
                                      ),
                                      Text(
                                        CoffeeConceptDetails
                                            .cartItems[index].price
                                            .toString(),
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    height: size.height * 0.15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white.withOpacity(0.5),
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 12,vertical: 1),
                    padding: EdgeInsets.all(12),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Total MRP',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              width: size.width * 0.3339,
                            ),
                            Text('₹ ${TotalPrice.toStringAsFixed(2)}'),
                          ],
                        ),
                        Row(
                          children: [
                            Text('Discount on MRP 10%'),
                            SizedBox(
                              width: size.width * 0.154,
                            ),
                            Text('₹ ${Discount.toStringAsFixed(2)}'),
                            //
                            // if (CoffeeConceptDetails.cartItems.length == 0)
                            //   Text('₹ 0')
                            // else
                            //   Text('₹ $Discount'),
                          ],
                        ),
                        Row(
                          children: [
                            Text('Add GST 2%'),
                            SizedBox(
                              width: size.width * 0.33,
                            ),
                            Text('₹ ${withGst.toStringAsFixed(2)}'),
                            // if (CoffeeConceptDetails.cartItems.length == 0)
                            //   Text('₹ 0')
                            // else
                            //   Text('₹ ${withGst}'),
                          ],
                        ),
                        Divider(),
                        Row(
                          children: [
                            Text(
                              'Total Amount',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w800),
                            ),
                            SizedBox(
                              width: size.width * 0.2,
                            ),
                            Text(
                              '₹ ${TotalAmount.toStringAsFixed(2)}',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w800),
                            ),
                            // if (CoffeeConceptDetails.cartItems.length == 0)
                            //   Text(
                            //     '₹ 0',
                            //     style: TextStyle(
                            //         fontSize: 20, fontWeight: FontWeight.w800),
                            //   )
                            // else
                            //   Text(
                            //     '₹ ${TotalAmount}',
                            //     style: TextStyle(
                            //         fontSize: 20, fontWeight: FontWeight.w800),
                            //   ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.005,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10,vertical: 6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: SliderButton(
                            action: () {
                              Navigator.pushReplacement(
                                  context, MaterialPageRoute(builder: (_) => HomePage()));
                              Fluttertoast.showToast(
                                  msg: 'Payment Successful',
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.yellow);
                            },
                            label: Text(
                              "Swipe for Pay\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17),
                            ),
                            icon: Center(
                                child: Icon(
                                  Icons.currency_rupee,
                                  color: Colors.white,
                                  size: 40.0,
                                  semanticLabel:
                                  'Text to announce in accessibility modes',
                                )),

                            ///Change All the color and size from here.
                            height: size.height * 0.08,
                            // width: size.width*0.9,
                            radius: 12,
                            buttonSize: 60,
                            buttonColor: Color.fromARGB(189, 255, 207, 161),
                            backgroundColor:
                            Color.fromARGB(255, 255, 138, 43),
                            highlightedColor: Colors.black12,
                            baseColor: Colors.white,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )),
        onWillPop: () async {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => CoffeeConceptList()));
          return true;
        });
  }
}
