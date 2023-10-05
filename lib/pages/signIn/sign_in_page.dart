import 'package:ecommerce_app1/constants/colors/app_colors.dart';
import 'package:ecommerce_app1/models/login_model.dart';
import 'package:ecommerce_app1/pages/signIn/sign_in_widget.dart';
import 'package:ecommerce_app1/route/app_route.dart';
import 'package:ecommerce_app1/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../auth/auth_controller.dart';

class SignInPage extends StatelessWidget {
  SignInPage( {super.key});
   TextEditingController passwordController= TextEditingController();
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    String fromProfile = Get.parameters['fromProfile']??'';
    
    var authController = Get.find<AuthController>();
     login(){
      String phone = phoneController.text.trim();
      String password = passwordController.text.trim();

       if(phone.isEmpty){
        Get.snackbar('Empty', 'your phone number is empty',
         backgroundColor: AppColors.mainColor,
         colorText: Colors.white,
         
        );
       
      }else if(password.isEmpty){
         Get.snackbar('Empty', 'your password is empty',
         backgroundColor: AppColors.mainColor,
         colorText: Colors.white,
         
        );
      }else{
        LoginModel loginModel = LoginModel(email: phone, password: password);
        authController.loginUser(phone, password).then((status) {
          if(status.isSuccess==true){
            print('Registration Successfull');
            Get.toNamed(AppRoute.bottomNav);
          }else{
            print(status.message);
          }
        });
        
      }

    }
    return GetBuilder<AuthController>(
      builder: (authController) {
        return Scaffold(
          
          appBar:buildAppBar('Log In', fromProfile),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Column(
          
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 35.w, right: 35.w, top: 30.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          buildThirdParty('googleic'),
                          buildThirdParty('ios'),
                          buildThirdParty('facebook')
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10.h),
                      child: reuseableText('Or use your email account log in', size: 18, color: Colors.black38)
                      ),
                      Container(
                         margin: EdgeInsets.only(top: 50.h, left: 25.w, right: 25.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            reuseableText('Phone Number', size: 16,color: Colors.black54),
                            buildTextField('Enter your phone number', Icons.person, phoneController),
                            SizedBox(height: 20.h,),
                            reuseableText('Password', size: 16,color: Colors.black54),
                            buildTextField('Enter your password', Icons.lock,passwordController, type: 'password'),
                            SizedBox(height: 10.h,),
                            reuseableText('Forgot password?', size: 17, textdeco: TextDecoration.underline, fontWeight: FontWeight.w500)
                          ],
                        ),
                      ),
                     Container(
                      margin: EdgeInsets.only(top: 50.h),
                       child: Column(
                         children: [
                           loginAndSignUpButton('Log In',(){
                            login();
                           } ),
                           SizedBox(height: 20.h,),
                           loginAndSignUpButton('Sign Up', (){
                           Get.toNamed(AppRoute.signUp);
                           },
                           bgColor: Colors.white,
                           color: Colors.black)
                         ],
                       ),
                     )
                  ],
                ),
              authController.isLoading==true?  Positioned(
                  top: (MediaQuery.of(context).size.height/2)-120,
                  left: (MediaQuery.of(context).size.width/2)-25,
                  child: customLoader()
                  ):Container()
              ],
            ),
          ),
        );
      }
    );
  }
}