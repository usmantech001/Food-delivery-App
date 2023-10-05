import 'package:ecommerce_app1/models/popular_product_model.dart';
import 'package:get/get.dart';

class RecommendedDetailController extends GetxController{
  RecommendedDetailController();
  late ProductModel product;
 // ScrollController scrollController = ScrollController();
  //var popularProductController= Get.find<RecommendedController>();
  
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    product = Get.arguments['product'];
  }
 
  
}