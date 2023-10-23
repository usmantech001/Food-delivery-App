import 'package:ecommerce_app1/constants/colors/constants.dart';
import 'package:ecommerce_app1/pages/detail/widgets.dart';
import 'package:ecommerce_app1/pages/search/widgets/widgets.dart';
import 'package:ecommerce_app1/pages/signIn/sign_in_widget.dart';
import 'package:ecommerce_app1/route/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce_app1/pages/search/controller/controller.dart';
import 'package:get/get.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: GetBuilder<SearchViewController>(
        builder: (searchviewcontroller) {
          return Column(
            children: [
              searchView(searchviewcontroller),
             searchviewcontroller.searchResults.isEmpty?Container(): Expanded(
                child:  CustomScrollView(
                  slivers: [
                    SliverPadding(
                      padding: EdgeInsets.only(left:20.w, right: 20.w, top: 20) ,
                      sliver: SliverGrid(
                      
                      delegate: SliverChildBuilderDelegate(
                        childCount:searchviewcontroller.searchResults.length,
                     (context, index) {
                        var searchProduct = searchviewcontroller.searchResults[index];
                return GestureDetector(
                  onTap: () {
                     searchviewcontroller.focusNode.unfocus();
                       Get.toNamed(
                       
                        AppRoute.detail, arguments: {'product': searchProduct});
                  },
                  child: 
                  Container(
                    //height: 250,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(10.sp)
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 150,
                          decoration: BoxDecoration(
                             // color: Colors.black, 
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.sp),
                                topRight: Radius.circular(10.sp)
                              ),
              
                              image: DecorationImage(
                               image: NetworkImage('${AppConstants.BASEURL}/uploads/${searchProduct.img!}'),
                                fit: BoxFit.cover
                                )
                                ),
                             
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10.w, right: 5.w, top: 10.h, bottom: 10),
                          //height: 50,
                          width: double.maxFinite,
                        // color: Colors.red,
                         child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             reuseableDetailText(searchProduct.name!, size: 18.0),
                             reuseableDetailText('\$ ${searchProduct.price}.00', size: 18.0)
                           ],
                         ),
                        )
                      ],
                    ),
                  ),
                );
                      }),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 15, crossAxisSpacing: 15, childAspectRatio: 0.74
                  //childAspectRatio:4
                  ),
                    ),
                      )
                  ],
                ),
              )
            ],
          );
        }
      )
      );

  }
}