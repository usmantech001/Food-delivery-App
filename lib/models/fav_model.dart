import 'popular_product_model.dart';

class FavoriteModel {
  int? id;
  String? name;
  int? price;
  String? img;
  int? quantity;
  bool? isExist;
  String? time;
  ProductModel? product;

  FavoriteModel(
      {required this.id,
      required this.name,
      required this.img,
      required this.isExist,
      required this.price,
      required this.product,
      });

  FavoriteModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    img = json['img'];
    price = json['price'];
    isExist = json['isExist'];
    product = ProductModel.fromJson(json['product']);
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (img != null) 'img': img,
      if (isExist != null) 'isExist': isExist,
      if (price != null) 'price': price,
      'product': product!.toJson()
    };
  }
}