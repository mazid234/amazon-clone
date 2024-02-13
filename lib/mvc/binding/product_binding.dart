import 'package:amazon_clone_app/mvc/controller/porduct_controller.dart';
import 'package:get/get.dart';

class ProductBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductController>(() => ProductController());
  }
}
