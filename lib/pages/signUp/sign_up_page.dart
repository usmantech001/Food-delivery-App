import 'package:ecommerce_app1/auth/auth_controller.dart';
import 'package:ecommerce_app1/models/sign_up_model.dart';
import 'package:ecommerce_app1/route/app_route.dart';
import 'package:ecommerce_app1/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../signIn/sign_in_widget.dart';

class SignUpPage extends StatelessWidget {
   SignUpPage({super.key});
  TextEditingController namecontroller = TextEditingController();
  TextEditingController passwordController= TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var authController = Get.find<AuthController>();
    registration(){
      String name = namecontroller.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();
      String phone = phoneController.text.trim();

      if(name.isEmpty){
       print('name is empty');
      }else if(email.isEmpty){
        print('email is empty');
      }else if(password.isEmpty){
         print('password is empty');
      }else if(phone.isEmpty){
        print('phoneNumber is empty');
      }else{
        SignUpModel signUpBody = SignUpModel(email: email, name: name, password: password, phoneNumber: phone);
        authController.registerUser(signUpBody).then((status) {
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
          
          appBar:AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,

        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.h),
          child: Container(
            height: 1.h,
            color: Colors.grey.withOpacity(0.3),
            
          ), 
          
          ),
        title:const Text('Sign Up'),
      ),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Column(
          
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    
                    Container(
                      padding: EdgeInsets.only(top: 30.h, left: 25.w, right: 25.w),
                      child: reuseableText('Enter your details below for free signup', size: 18, color: Colors.black38)
                      ),
                      Container(
                         margin: EdgeInsets.only(top: 40.h, left: 25.w, right: 25.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            reuseableText('Username', size: 16,color: Colors.black54),
                            buildTextField('Enter your user name', Icons.person, namecontroller),
                            SizedBox(height: 20.h,),
                            reuseableText('Email', size: 16,color: Colors.black54),
                            buildTextField('Enter your email address', Icons.person, emailController),
                            SizedBox(height: 20.h,),
                            reuseableText('Password', size: 16,color: Colors.black54),
                            buildTextField('Enter your password', Icons.lock, passwordController, type: 'password', ),
                            SizedBox(height: 20.h,),
                            reuseableText('Phone Number', size: 16,color: Colors.black54),
                            buildTextField('Enter your phone number', Icons.lock, phoneController),
                          ],
                        ),
                      ),
                     Container(
                      margin: EdgeInsets.only(top: 50.h, bottom: 40.h),
                       child:  loginAndSignUpButton('Sign Up',(){
                        registration();
                       }, color: Colors.white)
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