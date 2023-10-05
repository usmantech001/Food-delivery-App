// import 'package:ecommerce_app1/constants/colors/app_colors.dart';
// import 'package:ecommerce_app1/pages/cart/controller.dart';
// import 'package:ecommerce_app1/pages/signIn/sign_in_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';

// class CartHistoryPage extends StatelessWidget {
//   const CartHistoryPage({super.key});

//   @override
//   Widget build(BuildContext context) {
   
//     Map<String, int> getItemsPerOrder = Map();
//      for(int i=0; i< cartHistoryList.length; i++){
//       if(getItemsPerOrder.containsKey(cartHistoryList[i].time)){
//         getItemsPerOrder.update(cartHistoryList[i].time!, (value) => ++value);
//       }else{
//         getItemsPerOrder.putIfAbsent(cartHistoryList[i].time!, () => 1);
//       }
  
     
//      }
//          List<int> itemsPerOrder() {
//       return getItemsPerOrder.entries.map((e) => e.value).toList();
//       }
//       List<int> orderTime = itemsPerOrder();
//       int counter =0;
//     return Scaffold(
//       body: Column(
//         children: [
//           Container(
//             padding: EdgeInsets.only(top: 30.h),
//             color: AppColors.mainColor,
//             height: 100.w,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 reuseableText('My Cart History',color: Colors.white, size: 22),
//                 Icon(Icons.shopping_cart, color: Colors.white,)
//               ],
//             ),
            
//           ),
//           Expanded(
//             child: ListView(
//               children: [
//                 for(int j=0; j<orderTime.length; j++)
//                 Container(
//                   child: Row(
//                     children: [
//                       Wrap(
//                         children: List.generate(orderTime[j], (index) {
//                           return Container(
//                             margin: EdgeInsets.only(right: 10),
//                             height: 80,
//                             width:80,
//                             color: Colors.red,
//                             child: reuseableText(cartHistoryList[counter++].name!),
//                           );
//                         }),
//                       )
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }