class SignUpModel{
  String name;
  String email;
  String password;
  String phoneNumber;

  SignUpModel({required this.email, required this.name, required this.password, required this.phoneNumber});

  Map<String, dynamic> toJson(){
    return{
     'f_name':name,
     'email':email,
     'phone':phoneNumber,
     'password':password
    };
  }
}