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
    return GetBuilder<FavoriteController>(
      builder: (favController) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,
            title: reuseableText('My Favourite'),
            centerTitle: true,
            foregroundColor: Colors.white,
            backgroundColor: Colors.white,
            shadowColor: Colors.white,
          ),
          body:favController.getfavItems.isEmpty?Container(
             alignment: Alignment.center,
            child: reuseableText('Your favourite is empty'),): CustomScrollView(
                        slivers: [
                          SliverPadding(
                            padding: EdgeInsets.only(left: 0.w, right: 0.w, top: 0),
                            sliver: SliverList(
                                delegate: SliverChildBuilderDelegate(
                                  childCount: favController.getfavItems.length,
                                    (context, index) {
                                      var item = favController.getfavItems[index];
                                     
                              return favoriteContainer(item, favController);
                            })),
                          )
                        ],
                      )
        );
      }
    );
  }
}