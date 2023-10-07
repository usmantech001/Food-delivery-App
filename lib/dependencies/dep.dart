import 'package:ecommerce_app1/api/apiclient.dart';
import 'package:ecommerce_app1/api/controller.dart';
import 'package:ecommerce_app1/api/location_api_client.dart';
import 'package:ecommerce_app1/api/repo.dart';
import 'package:ecommerce_app1/auth/auth_controller.dart';
import 'package:ecommerce_app1/auth/auth_repo.dart';
import 'package:ecommerce_app1/constants/colors/constants.dart';
import 'package:ecommerce_app1/pages/cart/cart_repo.dart';
import 'package:ecommerce_app1/pages/cart/controller.dart';
import 'package:ecommerce_app1/pages/favorite/fav_controller.dart';
import 'package:ecommerce_app1/pages/favorite/fav_rep.dart';
import 'package:ecommerce_app1/pages/home/controller.dart';
import 'package:ecommerce_app1/pages/location/location_controller.dart';
import 'package:ecommerce_app1/pages/location/location_repo.dart';
import 'package:ecommerce_app1/user/userRepo.dart';
import 'package:ecommerce_app1/user/user_controller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/recommended_controller.dart';
import '../api/recommended_repo.dart';
import '../pages/detail/controller.dart';
import '../pages/welcome/controller.dart';

Future<void> init() async{
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);
   Get.lazyPut(()=>WelcomeController(sharedPreferences:Get.find()));
   Get.lazyPut(() => HomeController(), fenix: true);
  Get.lazyPut(() => ApiClient(appbaseUrl: AppConstants.BASEURL));
  Get.lazyPut(() => LocationApiClient(googleMapbaseUrl: AppConstants.GOOGLE_MAP_BASE_URL));
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(()=>  RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(()=> RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
  Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));
  Get.lazyPut(() => FavoriteController(favouriteRepo: Get.find()), fenix: true);
  Get.lazyPut(() => FavouriteRepo(sharedPreferences: Get.find()));
  Get.lazyPut(() => AuthController(authRepo: Get.find()));
  Get.lazyPut(() => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => UserController(userRepo: Get.find()));
  Get.lazyPut(() => UserRepo(apiClient: Get.find()));
  Get.lazyPut(() => LocationController(locationrepo: Get.find(),), fenix: true);
  Get.lazyPut(() => LocationRepo(locationApiClient: Get.find()));
  Get.lazyPut(() => DetailController(), fenix: true);
}