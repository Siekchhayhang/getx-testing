import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_testting/shopping_page.dart';

class AddCartListPage extends StatelessWidget {
  const AddCartListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FloatingActionButton(
                        elevation: 0,
                        child: const Icon(Icons.search),
                        //go to new page (search page)
                        onPressed: () {
                          Get.to(ShoppingPage());
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body:ListView() ,
    );
  }
}
