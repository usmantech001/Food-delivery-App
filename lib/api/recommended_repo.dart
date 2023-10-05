import 'package:ecommerce_app1/api/apiclient.dart';
import 'package:ecommerce_app1/constants/colors/constants.dart';
import 'package:get/get.dart';

class RecommendedProductRepo extends GetxService{
  ApiClient apiClient;
  RecommendedProductRepo({required this.apiClient});

 Future<Response> getRecommendedProductList() async{
   return await apiClient.getData(AppConstants.RECOMMENDED_PRODUCT_URL);
  }
}