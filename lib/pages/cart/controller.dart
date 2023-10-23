import 'package:get/get.dart';

import '../../models/cart_model.dart';
import '../../models/popular_product_model.dart';
import 'cart_repo.dart';

class CartController extends GetxController{
  CartRepo cartRepo;

  CartController({required this.cartRepo});
  Map<int, CartModel> _items={};
  Map<int, CartModel> get items => _items;
  int itemLenght = 0;
  List<CartModel> cartItems =[];
  List<CartModel> storageItems=[];

  addToCart(ProductModel product, quantity, {fromPopular=true}){
       
      if(quantity<=0){
        print(' the quantity is null');
        _items.remove(product.id);
         getItemsLenght();
        update();
      }else{    
      if(_items.containsKey(product.id)&&quantity!=0){
    
        _items.update(product.id!, (value){
      
          print('Quantity readded with prooduct id ${product.id} and qunatity ${quantity}');
          return CartModel(
            id: value.id, 
            name: value.name, 
            img: value.img, 
            isExist: true, 
            price: value.price, 
            quantity: quantity, 
            time: DateTime.now().toString(),
            product: product,
            fromPopular:fromPopular
            );
            
            
        });
         getItemsLenght();
        update();
      }
       _items.putIfAbsent(product.id!, () {
      
        print('Quantity added with prooduct id ${product.id} and qunatity ${quantity}');
        return CartModel(
          id: product.id, 
          name: product.name, 
          img: product.img, 
          isExist: true, 
          price: product.price, 
          quantity: quantity, 
          time: DateTime.now().toString(),
          product: product,
          fromPopular:fromPopular
          );
       });
        getItemsLenght();
        update();
     }
     cartRepo.saveCartList(getitems);
     update();
  }
      int getInCartQuantity(ProductModel product){
      var quantity=0;
      if(_items.containsKey(product.id)){
        _items.forEach((key, value) {
          if(key==product.id){
            quantity=value.quantity!;
          }
        });
      }
        return quantity;
      
    }

    bool existInCartItem(ProductModel product){
      if(_items.containsKey(product.id)){
        return true;
      }else{
        return false;
      }
    }

    List<CartModel> get getitems{
     return _items.entries.map((e) {
     
       return e.value;
       
      }
      
      ).toList();
      
    }
    getCartList(){
      _items.entries.map((e) {
        return cartItems.add(e.value);
      });
    }
    getItemsLenght(){
    itemLenght=_items.length;
    update();
    
    }

    int get totalPrice{
      var totalPrice=0;
      _items.forEach((key, value) {
        totalPrice+=value.price!*value.quantity!;
       });

       return totalPrice;
    }

    List<CartModel> getSavedData(){
      
     setCartList=cartRepo.getSavedCartList();
       return storageItems;
    }

    set setCartList(List<CartModel> cart){
      storageItems=cart;
      for(int i=0; i<storageItems.length; i++){
        _items.putIfAbsent(storageItems[i].product!.id!, () => storageItems[i]);
        getItemsLenght();
        update();
      }
    }
   
    clearCartList(){
      cartRepo.removeCart();
      _items={};
      update();
    }
  
}