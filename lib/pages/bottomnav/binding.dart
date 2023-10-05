import 'package:ecommerce_app1/pages/bottomnav/controller.dart';
import 'package:get/get.dart';

class BottomNavBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<BottomNavController>(BottomNavController());
    // TODO: implement dependencies
  }

}