
import 'package:ecommerce_app1/constants/colors/app_colors.dart';
import 'package:ecommerce_app1/pages/home/widgets.dart';
import 'package:ecommerce_app1/pages/signIn/sign_in_widget.dart';
import 'package:ecommerce_app1/pages/welcome/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../auth/auth_controller.dart';
import '../../models/user_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    UserModel userModel=  Get.find<AuthController>().getUserInfo();
    return  Scaffold(
                appBar: buildHomeAppBar(),
                body: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Container(
                        margin: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w, ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                buildText('Hi ', size: 28.0, fontWeight: FontWeight.w400),
                                buildText(userModel.name??'', size: 28.0, fontWeight: FontWeight.w400, color: AppColors.mainColor),
                              ],
                            ),
                            buildText('What do you want from us today?', size: 15.0),
                          ],
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child:searchView()
                    ),
                    SliverToBoxAdapter(
                      child: buildHomePageView(context, ),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        margin: EdgeInsets.only(top: 15.h, left: 20.w),
                        child: reuseableText('Recommended')),
                    ),
                    SliverPadding(
                      padding: EdgeInsets.only(left: 20.w, right:20.w, top: 10.h),
                      sliver: gridView()
                        )
                  ],
                )
              );
          
        
      }
}