import 'dart:convert';

import 'package:ecommerce_app1/constants/colors/constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/fav_model.dart';

class FavouriteRepo extends GetxService{
  SharedPreferences sharedPreferences;
  FavouriteRepo({required this.sharedPreferences});
  List<String> favLists =[];

  saveFavouriteItems(List<FavoriteModel> favList){
  favLists=[];
  favList.forEach((e) { 
   favLists.add(jsonEncode(e));
  });
    sharedPreferences.setStringList(AppConstants.SAVE_FAV_LIST, favLists);
  }

 List<FavoriteModel> getSavedFavList(){
  List<FavoriteModel> favouriteList =[];
  List<String> fav =[];
    if(sharedPreferences.containsKey(AppConstants.SAVE_FAV_LIST)){
    fav = sharedPreferences.getStringList(AppConstants.SAVE_FAV_LIST)!;
    }
    fav.forEach((e) { 
     favouriteList.add(FavoriteModel.fromJson(jsonDecode(e)));
    });
    return favouriteList;
  }
}