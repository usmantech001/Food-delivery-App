import 'package:ecommerce_app1/api/apiclient.dart';
import 'package:get/get.dart';

import '../constants/colors/constants.dart';

class UserRepo extends GetxService{
  ApiClient apiClient;
  UserRepo({required this.apiClient});

   Future<Response> getUserInfo() async {
   return await apiClient.getData(AppConstants.USER_INFO_URL);
  }
}