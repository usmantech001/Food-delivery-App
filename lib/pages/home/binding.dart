import 'package:ecommerce_app1/pages/home/controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
   
    // TODO: implement dependencies
  }

}