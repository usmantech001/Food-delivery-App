import 'package:ecommerce_app1/user/userRepo.dart';
import 'package:get/get.dart';

import '../models/response_model.dart';
import '../models/user_model.dart';

class UserController extends GetxController{
  UserRepo userRepo;
  UserController({required this.userRepo});

  bool isLoading=false;
  late UserModel _userModel;
  UserModel get userModel => _userModel;

  Future<ResponseModel> getUserInfo() async {
   
   isLoading=true;
   update();
    ResponseModel responseModel;
   Response response= await userRepo.getUserInfo();
   if(response.statusCode==200){
    _userModel=UserModel.fromJson(response.body);
    print(_userModel.name);
    responseModel = ResponseModel(isSuccess: true, message: response.body['token']);
   
    isLoading=false;
    update();
    print('login sucessfull');
    return responseModel;
    
   }else{
    isLoading=false;
    update();
    print(response.statusCode);
    print(response.body);
    return ResponseModel(isSuccess: false, message: response.statusText.toString());
  
   }
  }
  
}