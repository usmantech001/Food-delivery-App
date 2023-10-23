import 'package:ecommerce_app1/pages/search/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget searchView(SearchViewController searchViewController) {
  return Container(
    margin: EdgeInsets.only(left: 20.w, right: 20.0.w, top: 50.h),
  height: 60,
  width: double.infinity,
  
  //  width: 280.w,
    decoration: BoxDecoration(
      color: Colors.grey.withOpacity(0.1),
        border: Border.all(color: Colors.grey.withOpacity(0.1),),
        borderRadius: BorderRadius.circular(10)),
    child:  TextField(
      focusNode: searchViewController.focusNode,
      controller: searchViewController.searchtextcontroller,
      onChanged: searchViewController.searchProduct,
      keyboardType: TextInputType.multiline,
      decoration:  InputDecoration(
         hintText: 'Search your favorite food',
        prefixIcon: const Icon(Icons.search),
        suffixIcon: searchViewController.searchtextcontroller.text.isNotEmpty?GestureDetector(
          onTap: ()=> searchViewController.clearSearchResults(),
          child: const Icon(Icons.cancel, color: Colors.black,)):Container(width: 1,),
       
        hintStyle:const TextStyle(color: Colors.black38),
        enabledBorder:const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
        focusedBorder:const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
        border:const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
        disabledBorder:const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
      ),
    ),
  );
}