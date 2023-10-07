import 'package:ecommerce_app1/auth/auth_controller.dart';
import 'package:ecommerce_app1/constants/colors/app_colors.dart';
import 'package:ecommerce_app1/models/user_model.dart';
import 'package:ecommerce_app1/pages/cart/controller.dart';
import 'package:ecommerce_app1/pages/signIn/sign_in_widget.dart';
import 'package:ecommerce_app1/route/app_route.dart';
import 'package:ecommerce_app1/user/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../favorite/fav_controller.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

 bool fromProfile = true;
  @override
  Widget build(BuildContext context) {
   UserModel userModel=  Get.find<AuthController>().getUserInfo();
    Map<IconData, String> data ={
    Icons.person: userModel.name!,
    Icons.phone:userModel.phone!,
    Icons.email:userModel.email!,
    Icons.location_on:'Enter your address',
    Icons.logout:'Logout'
 };
   List<String> names= data.entries.map((e){
    return e.value;
   }) .toList();
   List<IconData> icons= data.entries.map((e){
    return e.key;
   }) .toList();
   
    return GetBuilder<AuthController>(
      builder: (userController) {
        //usercontroller
        print(userModel.name);
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            //automaticallyImplyLeading: true,
            
            title: reuseableText('My Profile', color: Colors.white),
            centerTitle: true,
            backgroundColor: AppColors.mainColor,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
               margin: EdgeInsets.only(bottom: 30.h, top: 20.h),
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(200),
                  color: AppColors.mainColor
                ),
                child:const Icon(Icons.person, color: Colors.white, size: 80,)
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index){
                    return GestureDetector(
                      onTap: (){
                        Get.find<UserController>().getUserInfo();
                        if(icons[index]==Icons.location_on){
                            Get.toNamed(AppRoute.location);
                        }
                        if(icons[index]==Icons.logout){
                          Get.defaultDialog(
                            textCancel: 'cancel',
                            textConfirm: 'Yes',
                            title: 'Are you sure you want to log out?',
                            middleText: '',
                            backgroundColor: Colors.white,
                            confirmTextColor: Colors.white,
                            cancelTextColor: AppColors.mainColor,
                            buttonColor: AppColors.mainColor,
                            radius:15.0,
                            onConfirm: () {
                              
                              Get.find<AuthController>().logOut();
                              Get.find<CartController>().clearCartList();
                              Get.toNamed(AppRoute.signIn,
                                parameters: {
                                  'fromProfile': fromProfile.toString()
                                }
                              );
                              
                             },
                            
                          );
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.only(left: 20.w, right: 20.w,bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            
                            Container(
                              alignment: Alignment.center,
                              height: 60.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade100,
                                    spreadRadius: 1,
                                    blurRadius: 2,
                                    offset: const Offset(5, 5)
                                  ),
                                   BoxShadow(
                                    color: Colors.grey.shade100,
                                    spreadRadius: 1,
                                    blurRadius: 2,
                                    offset: const Offset(-5,- 5)
                                  )
                                ]
                              ),
                              child:Padding(
                                padding:  EdgeInsets.only(left: 5.w),
                                child: Row(
                                  children: [
                                    Container(
                                      height:50.h ,
                                      width: 50.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50.sp),
                                        color:index==4?Colors.red: AppColors.mainColor,
                                ),
                                   child: Icon(icons[index], color: Colors.white,),
                                    ),
                                    SizedBox(width: 10.w,),
                                    reuseableText(names[index], size: 18.sp),
                                  ],
                                ),
                              ) ,
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                )
            ],
          )
        );
      }
    );
  }
}