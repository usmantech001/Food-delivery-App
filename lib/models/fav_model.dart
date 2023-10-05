class FavoriteModel {
  int? id;
  String? name;
  int? price;
  String? img;
  bool? isExist;
 
  FavoriteModel(
      {required this.id,
      required this.name,
      required this.img,
      required this.isExist,
      required this.price,

      });
  FavoriteModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    img = json['img'];
    price = json['price'];
    isExist = json['isExist'];

  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (img != null) 'img': img,
      if (isExist != null) 'isExist': isExist,
      if (price != null) 'price': price,

    };
  }
}