import 'package:ecommerce_app1/pages/recommended/recommended_controller.dart';
import 'package:get/get.dart';

class RecommendedDetailBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<RecommendedDetailController>(() => RecommendedDetailController());
  }

}