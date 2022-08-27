import 'package:get/get.dart';
import '../product.dart';

class ShoppingController extends GetxController {
  var products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProduct();
  }

  void fetchProduct() async {
    await Future.delayed(const Duration(seconds: 1));
    var productResult = [
      Product(
          id: 1,
          productName: 'Mango',
          productImage: 'assets/images/blueberry.jpeg',
          productDescription: 'Fresh Mango',
          price: 50,
          ),
      Product(
          id: 2,
          productName: 'Grab',
          productImage: 'abd',
          productDescription: 'Second Prod',
          price: 60,
          ),
      Product(
          id: 3,
          productName: 'Apple',
          productImage: 'abd',
          productDescription: 'Third Prod',
          price: 55.50,
          ),
      Product(
          id: 4,
          productName: 'Banana',
          productImage: 'abd',
          productDescription: 'Fourth Prod',
          price: 30,
          ),
      Product(
          id: 5,
          productName: 'Tea',
          productImage: 'abd',
          productDescription: 'Fifth Prod',
          price: 40,
          ),
      Product(
          id: 6,
          productName: 'Melon',
          productImage: 'abd',
          productDescription: 'Prod',
          price: 45.50,
          ),
    ];
    products.value = productResult;
  }
}
