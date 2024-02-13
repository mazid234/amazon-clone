import 'package:amazon_clone_app/mvc/controller/porduct_controller.dart';
import 'package:amazon_clone_app/mvc/model/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homepage extends GetView<ProductController> {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        controller.getProducts();
        return SafeArea(
          child: ListView.builder(
            padding: EdgeInsets.all(10),
            itemCount: controller.products.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(controller.products[index].name),
                subtitle: Text(
                    'Price: \$${controller.products[index].price.toString()}'),
                trailing: Column(children: [
                  ElevatedButton(onPressed: () {}, child: Text("Add to cart"))
                ]),
                // onTap: () {
                //   _showProductDetails(context, products[index]);
                // },
              );
            },
          ),
        );
      }),
    );
  }

  void _showProductDetails(BuildContext context, Product product) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(product.name),
          content: Text('Price: \$${product.price.toString()}'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
