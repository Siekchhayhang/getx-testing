
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_testting/controller/add_dart_list.dart';
import 'package:getx_testting/controller/cart_controller.dart';
import 'controller/shopping_controller.dart';

class ShoppingPage extends StatelessWidget {
  ShoppingPage({Key? key}) : super(key: key);
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // actions: [
        //   FloatingActionButton(
        //     onPressed: () {},
        //     elevation: 0,
        //     child: IconButton(
        //       onPressed: () {},
        //       icon: const Icon(Icons.arrow_back_ios_new),
        //     ),
        //   ),
        // ],
      ),
      body: SafeArea(
        child: Column(children: [
          Expanded(
            child: GetX<ShoppingController>(builder: (controller) {
              return ListView.builder(
                  itemCount: controller.products.length,
                  itemBuilder: ((context, index) {
                    return Card(
                      color: Colors.teal,
                      margin: const EdgeInsets.all(8),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        //Add to Cart
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(children: [
                                      //decription
                                      Column(children: [
                                        Row(children: [
                                          Container(
                                            height: 100,
                                            width: 150,
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/mango.jpeg'),
                                                  fit: BoxFit.fill),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          //Text Price, decriptions and Add to cart
                                          Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        controller
                                                            .products[index]
                                                            .productName,
                                                        style: const TextStyle(
                                                            fontSize: 16),
                                                      ),
                                                      Text(
                                                        controller
                                                            .products[index]
                                                            .productDescription,
                                                        style: TextStyle(
                                                            color: Colors
                                                                .grey[400]),
                                                      ),
                                                      Text(
                                                        '\$${controller.products[index].price}',
                                                        style: const TextStyle(
                                                            fontSize: 16),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 35,
                                                ),
                                                SizedBox(
                                                  child: (Column(children: [
                                                    ElevatedButton(
                                                      onPressed: () {
                                                        cartController.addToCart(
                                                            controller.products[
                                                                index]);
                                                      },
                                                      style:
                                                          const ButtonStyle(),
                                                      child: const Text(
                                                          'Add to Cart'),
                                                    ),
                                                  ])),
                                                ),
                                              ]),
                                        ]),
                                      ]),
                                    ]),
                                  ]),
                              // ignore: deprecated_member_use
                              //Images
                              Container(
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/images/'),
                                  ),
                                ),
                              ),
                            ]),
                      ),
                    );
                  }));
            }),
          ),
          GetX<CartController>(builder: (controller) {
            return Column(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Total Items : ${controller.count.toString()}',
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '\$ ${controller.totalPrice}',
                    style: const TextStyle(fontSize: 30, color: Colors.blue),
                  ),
                ],
              ),
            ]);
          }),
          const SizedBox(
            height: 100,
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.to(const AddCartListPage());
        },
        backgroundColor: Colors.amber,
        icon: const Icon(Icons.add_shopping_cart_outlined, color: Colors.black),
        label: GetX<CartController>(builder: (controller) {
          return Text(
            controller.count.toString(),
            style: const TextStyle(color: Colors.black, fontSize: 16),
          );
        }),
      ),
    );
  }
}
