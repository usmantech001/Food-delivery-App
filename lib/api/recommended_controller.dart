import 'package:ecommerce_app1/api/recommended_repo.dart';
import 'package:ecommerce_app1/models/popular_product_model.dart';
import 'package:get/get.dart';

import '../pages/cart/controller.dart';

class RecommendedProductController extends GetxController{
  RecommendedProductRepo recommendedProductRepo;

  RecommendedProductController({required this.recommendedProductRepo});
  List<ProductModel> recommendedProductist=[];
   CartController _cart = Get.find<CartController>();
  int _quantity = 0;
  int get quantity => _quantity;
   bool isLoading=false;
  @override
  void onInit(){
    super.onInit();
    getRecommendedProductList();
  }

 Future<void> getRecommendedProductList() async {
  isLoading=true;
  update();
   Response response= await recommendedProductRepo.getRecommendedProductList();
   if(response.statusCode==200){
    recommendedProductist=[];
    recommendedProductist.addAll(Product.fromJson(response.body).products);
    isLoading=false;
    update();
   }else{
   }
  }

  // increment(bool isIncrease){
  //     if(isIncrease==true){
  //       _quantity++;
  //     }else if(isIncrease==false&&_quantity!=0){
  //       _quantity--;
  //     }else if(_quantity<0){
  //       _quantity=0;
  //     }
  //     update();
  //   }
    // initialProduct(ProductModel product, CartController cart){
    //   _quantity=0 ;
    //   _cart=cart;
    //  var isExist = cart.existInCartItem(product);
    //   if(isExist==true){
    //     _quantity=_cart.getInCartQuantity(product);
    //   } 
    // }

    // addToCart(ProductModel product, {fromPopular=true}){
    //   _cart.addToCart(product, _quantity, fromPopular: fromPopular);
    //   update();
    // }
}