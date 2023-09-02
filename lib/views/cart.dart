import 'package:flutter/material.dart';
import 'package:learn_provider/constants/ProductList.dart';
import 'package:learn_provider/controllers/providerClass.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderClass>(builder: (context, value, widget) {
      return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'CART',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            // actions: [
            //   Padding(
            //     padding: const EdgeInsets.only(right: 12.0),
            //     child: Row(
            //       children: [

            //         Text(
            //           value.cartTotal.toString(),
            //           style: TextStyle(fontWeight: FontWeight.bold),
            //         ),
            //       ],
            //     ),
            //   )
            // ],
          ),
          body: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: GridView(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2),
                  children: value.cartlist.map<Widget>((data) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        child: SizedBox(
                          height: 200,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top:5.0),
                                child: ClipRRect(
                                     borderRadius: BorderRadius.circular(15),
                                  child: Image.network(data.image, height: 90)),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "${data.price} Rs",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "${data.quantity}",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Card(
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                child: Container(
                                  height: 35,
                                  width: 120,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            if (data.quantity >= 0) {
                                              value.increasequantity(data);
                                            }
                                          },
                                          icon: Icon(Icons.add)),
                                      Text(
                                        data.quantity.toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      IconButton(
                                          onPressed: data.quantity == 0
                                              ? null
                                              : () {
                                                  if (data.quantity > 0) {
                                                    value
                                                        .decreasequantity(data);
                                                  }
                                                },
                                          icon: Icon(Icons.remove))
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 25.0, horizontal: 12),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 70,
                    child: Card(
                      color: Colors.green,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [  Icon(Icons.shopping_cart_rounded),
                                Text(
                                  value.cartTotal.toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 18),
                                ),
                              ],
                            ),
                            MaterialButton(
                                onPressed: () {
                                  value.clearCart();
                                  
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.red.shade300,
                                  ),
                                  child: Icon(Icons.clear),
                                ))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ));
    });
  }
}
