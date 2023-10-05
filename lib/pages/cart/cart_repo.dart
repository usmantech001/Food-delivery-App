import 'dart:convert';

import 'package:ecommerce_app1/constants/colors/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/cart_model.dart';

class CartRepo{
  SharedPreferences sharedPreferences;
  CartRepo({required this.sharedPreferences});

  List<String> cart=[];
  List<String> cartHistory=[];

  saveCartList(List<CartModel> cartList){
    cart=[];
    cartList.forEach((e) { 
    return cart.add(jsonEncode(e));
    });
     sharedPreferences.setStringList(AppConstants.Cart_List, cart);
    getSavedCartList();
    
  }
  List<CartModel> getSavedCartList(){
   List<String> carts=[];
    if(sharedPreferences.containsKey(AppConstants.Cart_List)){

      carts= sharedPreferences.getStringList(AppConstants.Cart_List)!;
    }
  
    List<CartModel> cartList=[];

   carts.forEach((element) { 
   // print(element);
    cartList.add(CartModel.fromJson(jsonDecode(element)));
   });

    return cartList;
  }

//   void saveCartHistoryList() {
 
//     List<CartModel> cartsHistory=[];
//     if(sharedPreferences.containsKey(AppConstants.Cart_History_List)){
      
//       cartHistory= sharedPreferences.getStringList(AppConstants.Cart_History_List)!;
//     }
    
//   // for(int i=0; i<cart.length; i++){
//   //   cartHistory.add(jsonEncode(cart[i]));
//   // }
//       cartsHistory=getSavedCartList();
//       cartsHistory.forEach((element) {
//         cartHistory.add(jsonEncode(element));
//        });
//  // removeCart(); 
  
//    sharedPreferences.setStringList(AppConstants.Cart_History_List, cartHistory);
//     removeCart();
//     getCartHistoryList();
    
     
   
//   }
  removeCart(){
    cart=[];
    sharedPreferences.remove(AppConstants.Cart_List);
  }
  // List<CartModel> getCartHistoryList() {

  //   if(sharedPreferences.containsKey(AppConstants.Cart_History_List)){
  //     cartHistory=[];
  //      cartHistory= sharedPreferences.getStringList(AppConstants.Cart_History_List)!;
  //    }
    
  //   List<CartModel> cartsHistory=[];
 
  //   cartHistory.forEach((element) {

  //     cartsHistory.add(CartModel.fromJson(jsonDecode(element)));
  //   });

  //     print('The history lenght is '+ cartsHistory.length.toString());
  //   return cartsHistory;
    
  // }
  
}