import 'package:amazon_clone_app/mvc/model/product.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  RxList products = [].obs;
  getProducts() {
    final List<Product> allProducts = [
      Product(name: 'Product 1', price: 10),
      Product(name: 'Product 2', price: 20),
      Product(name: 'Product 3', price: 30),
      Product(name: 'Product 4', price: 40),
      Product(name: 'Product 5', price: 50),
    ];
    Future.delayed(Duration(seconds: 2)).then((value) {
      products.value = allProducts;
    });
  }
}
