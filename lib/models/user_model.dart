class UserModel{
  String? id;
  String? name;
  String? email;
  String? phone;
  String? orderCount;

  UserModel({
    required this.email,
    required this.id,
    required this.name,
    required this.orderCount,
    required this.phone,
  });

  UserModel.fromJson(Map<String, dynamic> json){
   
      id=json['id'];
      name=json['f_name'];
      email=json['email'];
      phone=json['phone'];
      orderCount=json['order_count'];
    
  }

}