import 'package:ecommerce_app1/pages/detail/controller.dart';
import 'package:get/get.dart';

class DetailBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<DetailController>(() => DetailController(), );
  }

}