import 'package:ecommerce_app1/constants/colors/constants.dart';
import 'package:ecommerce_app1/models/popular_product_model.dart';
import 'package:ecommerce_app1/pages/favorite/fav_rep.dart';
import 'package:get/get.dart';

import '../../models/fav_model.dart';
import '../../widgets/snackbar.dart';

class FavoriteController extends GetxController{
FavouriteRepo favouriteRepo;
FavoriteController({required this.favouriteRepo});
bool isFavorite=false;

Map<int, FavoriteModel> _favoriteItems={};
Map<int, FavoriteModel> get favoriteItems => _favoriteItems={};
List<FavoriteModel> storedFavItems = [];
int itemLenght = 0;

  addToFavourite(ProductModel product){
    
   if(isFavorite==false){
    
     _favoriteItems.putIfAbsent(product.id!, (){
      return FavoriteModel(
        id: product.id, 
        name: product.name, 
        img: product.img,
        isExist: true, 
        price: product.price,
        product: product,
       
        );
        
    });
    showSnackBar(title: 'Added', text: 'Added to favourite');
    getItemsLenght();

    isFavorite=true;
    update();
   } else if(_favoriteItems.containsKey(product.id)){
    removeFromFavourite(product);
    showSnackBar(title: 'Removed', text: 'Removed From favourite');
    // isFavorite=!isFavorite;
    getfavItems;
   
   
     update();

   }
    favouriteRepo.saveFavouriteItems(getfavItems);
    update();
  }

  removeFromFavourite(ProductModel product){
    _favoriteItems.remove(product.id);
    isFavorite=!isFavorite;
    getItemsLenght();
    favouriteRepo.saveFavouriteItems(getfavItems);
     getfavItems;
    update();
  }
  bool existInFavourite(ProductModel product){
    if(_favoriteItems.containsKey(product.id)){
      return true;
    }else{
      return false;
    }
  }

  getItemsLenght(){
    itemLenght=_favoriteItems.length;
    update();
    
    }
    List<FavoriteModel> get getfavItems{
      List<FavoriteModel>  favItems = [];
      _favoriteItems.forEach((key, value) {
        favItems.add(value);
      });
      return favItems;
    }
  
  List<FavoriteModel> getSavedFavList(){
     setFavouritemList = favouriteRepo.getSavedFavList();
     return storedFavItems;
  }

  set setFavouritemList(List<FavoriteModel> favList){
    storedFavItems = favList;
    for(int i=0; i<storedFavItems.length; i++){
      _favoriteItems.putIfAbsent(storedFavItems[i].id!, () => storedFavItems[i]);
      getItemsLenght();
     // getfavItems;
      update();
    }
  }

}