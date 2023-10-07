import 'package:ecommerce_app1/constants/colors/constants.dart';
import 'package:ecommerce_app1/models/popular_product_model.dart';
import 'package:ecommerce_app1/pages/cart/controller.dart';
import 'package:ecommerce_app1/pages/favorite/fav_controller.dart';
import 'package:get/get.dart';

import 'repo.dart';

class PopularProductController extends GetxController{
  PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  List<ProductModel> _popularProductList = <ProductModel>[];
  List<ProductModel> get popularProductList => _popularProductList;
  int _quantity = 0;
  int get quantity=> _quantity;
 CartController _cart = Get.find<CartController>();
 FavoriteController _favoriteController = Get.find<FavoriteController>();
  bool isLoading=false;
  @override
  void onInit(){
    super.onInit();
    getPopoularProductList();
   //_cart= Get.find<CartController>();

  }

  Future<void> getPopoularProductList() async{
     isLoading=true;
     update();
      Response response = await popularProductRepo.getPopoularProductList(AppConstants.ENDPOINTURL);
      if(response.statusCode==200){
       
        _popularProductList=[];
        _popularProductList.addAll(Product.fromJson(response.body).products);
        isLoading=false;
        update();
      }else{
    
      }    
    }
    
      increment(bool isIncrease){
      if(isIncrease==true){
        print('increment');
        //quantity.value++;
        _quantity++;
      }else if(isIncrease==false&&_quantity!=0){
        _quantity--;
      }else if(_quantity<0){
        _quantity=0;
      }
      update();
    }
    initialProduct(ProductModel product, CartController cart){
      _quantity=0 ;
      _favoriteController.isFavorite=false;
      _cart=cart;
     var isExist = cart.existInCartItem(product);
      if(isExist==true){
        _quantity=_cart.getInCartQuantity(product);
      }
      var existInFavourite = _favoriteController.existInFavourite(product);
      if(existInFavourite){
        print(existInFavourite);
        _favoriteController.isFavorite=true;
      }
   //   update();
    }

    addToCart(ProductModel product){
      _cart.addToCart(product, _quantity);
     // getItemsLenght();
      update();
    }
   
    
}