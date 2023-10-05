import 'package:ecommerce_app1/models/popular_product_model.dart';
import 'package:get/get.dart';

import '../../models/fav_model.dart';

class FavoriteController extends GetxController{

bool isFavorite=false;

Map<int, FavoriteModel> _favoriteItems={};

  addToFavourite(ProductModel product){
    
   if(isFavorite==false){
     _favoriteItems.putIfAbsent(product.id!, (){
      return FavoriteModel(
        id: product.id, 
        name: product.name, 
        img: product.img,
        isExist: true, 
        price: product.price, 
       
        );
        
    });
    isFavorite=true;
    print('added');
    update();
   }else if(isFavorite==true){
    removeFromFavourite(product);
   update();

   }
    isFavorite=true;
    update();
  }

  removeFromFavourite(ProductModel product){
    _favoriteItems.remove(product.id);
    isFavorite=false;
    print('removed');
    update();
  }
}