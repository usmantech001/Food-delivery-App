import 'package:ecommerce_app1/pages/favorite/widgets.dart';
import 'package:ecommerce_app1/pages/signIn/sign_in_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                              childCount: 10,
                                (context, index) {
                                 // var item = controller.getitems[index];
                                 
                          return favoriteContainer();
                        })),
                      )
                    ],
                  )
    );
  }
}