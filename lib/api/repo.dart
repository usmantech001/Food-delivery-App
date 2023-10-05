import 'package:ecommerce_app1/api/apiclient.dart';
import 'package:get/get.dart';

class PopularProductRepo extends GetxService{
  ApiClient apiClient;
  PopularProductRepo({required this.apiClient});

Future<Response>getPopoularProductList(uri) async{
  Response response =await apiClient.getData(uri);
  return response;
}
}