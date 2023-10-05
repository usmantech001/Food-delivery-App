import 'package:ecommerce_app1/models/popular_product_model.dart';

class CartModel {
  int? id;
  String? name;
  int? price;
  String? img;
  int? quantity;
  bool? isExist;
  String? time;
  ProductModel? product;

  CartModel(
      {required this.id,
      required this.name,
      required this.img,
      required this.isExist,
      required this.price,
      required this.quantity,
      required this.time,
      required this.product});

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    img = json['img'];
    price = json['price'];
    quantity = json['quantity'];
    isExist = json['isExist'];
    time = json['time'];
    product = ProductModel.fromJson(json['product']);
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (img != null) 'img': img,
      if (isExist != null) 'isExist': isExist,
      if (price != null) 'price': price,
      if (quantity != null) 'quantity': quantity,
      if (time != null) 'time': time,
      'product': product!.toJson()
    };
  }
}
