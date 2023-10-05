import 'package:ecommerce_app1/constants/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildThirdParty(String image){
  return Container(
    
    height: 40.h,
    width: 40.w,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(40),
      boxShadow: [
        BoxShadow(
          blurRadius: 1,
          spreadRadius: 1,
          color: Colors.grey.shade100,
          offset:const Offset(2, 4)
        ),
        BoxShadow(
          blurRadius: 1,
          spreadRadius: 1,
          color: Colors.grey.shade100,
          offset:const Offset(-2, 4)
        )
      ],
    
     image: DecorationImage(
      fit: BoxFit.cover,
      image: AssetImage('images/$image.png')
      )
    ),
   
  );
}
Widget reuseableText(String text, {double size=25, fontWeight= FontWeight.normal, color= Colors.black, textdeco=TextDecoration.none}){
  return Text(text,
 
  style: TextStyle(
    
    color: color,
    fontSize: size,
    fontWeight: fontWeight,
    decoration: textdeco,
    
  ),);
}

Widget buildTextField(String text, IconData icon, TextEditingController controller, {String type=''}){
  return Container(
    margin: EdgeInsets.only(top: 5.h, ),
    height: 50.h,
    width: double.infinity,
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.black
      ),
      borderRadius: BorderRadius.circular(15)
    ),
    child: Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: 10.w),
          width: 16,
          child: Icon(icon)),
        Container(
          width: 260.w,
          height: 50.h,
          child:TextField(
            controller: controller,
            obscureText: type=='password'?true:false,
            keyboardType: TextInputType.multiline,
            
            decoration: InputDecoration(
              //errorText: errorText(text)??,
              
              hintText: text,
              hintStyle:const TextStyle(
                color: Colors.black38
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
                
              ),
              focusedBorder:const  OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
                
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
Widget loginAndSignUpButton(
  String text, Function() func, {color=Colors.white, bgColor = AppColors.mainColor}
  ){
  return GestureDetector(
    onTap: func,
    child: Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(left: 25.w, right: 25.w, ),
      height: 50.h,
      width: double.maxFinite,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 2,
            spreadRadius: 1,
            color: Colors.grey.shade400
          )
        ],
        color:bgColor,
        borderRadius: BorderRadius.circular(15)
      ),
      child: reuseableText(text, color: color, size: 22, fontWeight: FontWeight.w500),
    ),
  );
}
AppBar buildAppBar(String text,String fromProfile){
  return AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        automaticallyImplyLeading: fromProfile=='true'?false:true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.h),
          child: Container(
            height: 1.h,
            color: Colors.grey.withOpacity(0.3),
            
          ), 
          
          ),
        title: Text(text),
      );
}

