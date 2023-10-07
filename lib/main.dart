import 'package:ecommerce_app1/api/recommended_controller.dart';
import 'package:ecommerce_app1/auth/auth_controller.dart';
import 'package:ecommerce_app1/auth/auth_repo.dart';
import 'package:ecommerce_app1/pages/cart/controller.dart';
import 'package:ecommerce_app1/pages/favorite/fav_controller.dart';
import 'package:ecommerce_app1/pages/welcome/controller.dart';
import 'package:ecommerce_app1/route/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ecommerce_app1/dependencies/dep.dart'as dep;
import 'api/controller.dart';


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  Get.lazyPut<PopularProductController>(()=> PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut<WelcomeController>(()=>WelcomeController(sharedPreferences: Get.find()));
  
  Get.lazyPut(()=>AuthController(authRepo: Get.find()));
  Get.lazyPut(()=>AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   Get.find<CartController>().getSavedData();
   Get.find<FavoriteController>().getSavedFavList();

        return GetBuilder<PopularProductController>(
          builder: (context) {
            return GetBuilder<RecommendedProductController>(
              builder: (context) {
                return ScreenUtilInit(
                  child: GetMaterialApp(
                    title: 'Flutter Demo',
                    debugShowCheckedModeBanner: false,
                    theme: ThemeData(
                      appBarTheme: const AppBarTheme(
                        backgroundColor: Colors.white
                      ),
                      colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
                      useMaterial3: true,
                    ),
                   // home: WelcomePage(),
                   initialRoute: AppRoute.welcome,
                   
                    getPages: AppRoute.getPages
                  ),
                );
              }
            );
          }
        );
    
  }
}

