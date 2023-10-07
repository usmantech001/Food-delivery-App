import 'package:ecommerce_app1/pages/favorite/fav_controller.dart';
import 'package:ecommerce_app1/pages/favorite/widgets.dart';
import 'package:ecommerce_app1/pages/signIn/sign_in_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
   // print(Get.find<FavoriteController>().favoriteItems.length);
    return GetBuilder<FavoriteController>(
      builder: (favController) {
        print(favController.itemLenght);
        print('The cartmodel lenght is' + favController.getfavItems.length.toString());
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,
            title: reuseableText('My Favourite'),
            centerTitle: true,
            foregroundColor: Colors.white,
            backgroundColor: Colors.white,
            shadowColor: Colors.white,
          ),
          body:CustomScrollView(
                        slivers: [
                          SliverPadding(
                            padding: EdgeInsets.only(left: 0.w, right: 0.w, top: 0),
                            sliver: SliverList(
                                delegate: SliverChildBuilderDelegate(
                                  childCount: favController.itemLenght,
                                    (context, index) {
                                      var item = favController.getfavItems[index];
                                     
                              return favoriteContainer(item);
                            })),
                          )
                        ],
                      )
        );
      }
    );
  }
}