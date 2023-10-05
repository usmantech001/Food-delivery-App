class Product {
  int? total_size;
  int? type_id;
  int? offset;
  List<ProductModel> products = [];
  Product(
      {required this.total_size,
      required this.type_id,
      required this.offset,
      required this.products});
  Product.fromJson(Map<String, dynamic> json) {
    total_size = json['total_size'];
    type_id = json['type_id'];
    offset = json['offset'];
    if (json['products'] != null) {
      products = <ProductModel>[];
      json['products'].forEach((e) {
        products.add(ProductModel.fromJson(e));
      });
    }
  }
}

class ProductModel {
  int? id;
  String? name;
  String? description;
  int? price;
  int? stars;
  String? img;
  String? location;
  String? created_at;
  String? updated_at;
  int? type_id;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.stars,
    required this.img,
    required this.location,
    required this.created_at,
    required this.updated_at,
    required this.type_id,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    stars = json['stars'];
    img = json['img'];
    location = json['location'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
    type_id = json['type_id'];
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (price != null) 'price': price,
      if (stars != null) 'stars': stars,
      if (img != null) 'img': img,
      if (location != null) 'location': location,
      if (created_at != null) 'created_at': created_at,
      if (updated_at != null) 'updated_at': updated_at,
      if (type_id != null) 'type_id': type_id
    };
  }
}
