

import 'dart:convert';

import 'package:ecommerce_app1/models/response_model.dart';
import 'package:ecommerce_app1/models/user_model.dart';
import 'package:get/get.dart';
import '../models/sign_up_model.dart';
import 'auth_repo.dart';

class AuthController extends GetxController{
  AuthRepo authRepo;
  AuthController({required this.authRepo});
  bool isLoading = false;
//  late UserModel _userModel;
//  UserModel get userModel => _userModel;

 Future<ResponseModel> registerUser(SignUpModel body) async {
   isLoading=true;
   update();
    ResponseModel responseModel;
   Response response= await authRepo.registration(body);
   if(response.statusCode==200){
    //save user token
     print(response.body['id']);
    authRepo.saveUserToken(response.body['token']);
    //save user info
    authRepo.saveUserInfo(body);

    responseModel = ResponseModel(isSuccess: true, message: response.body['token']);
    isLoading=false;
    update();
    print('completed');
    return responseModel;
    
   }else{
     isLoading=false;
    update();
    return ResponseModel(isSuccess: false, message: response.statusText.toString());

   }
  }

  Future<ResponseModel> loginUser(String phone, String password) async {
   
   isLoading=true;
   update();
    ResponseModel responseModel;
   Response response= await authRepo.login(phone, password);
   print(response.body["errors"]);
   if(response.statusCode==200){
    //save user token
 // print('The id is' +response.body['id']);
    authRepo.saveUserToken(response.body['token']);
    responseModel = ResponseModel(isSuccess: true, message: response.body['token']);
    isLoading=false;
    update();
    print('login sucessfull');
    return responseModel;
    
   }else{
    isLoading=false;
    update();

    return ResponseModel(isSuccess: false, message: response.statusText.toString());
  
   }
  }
 
  logOut(){
    authRepo.logOut();
    
  }
  bool get isLoggedIn{
    return authRepo.isLoogedIn();
  }
 UserModel getUserInfo() {
  UserModel _userModel;
  String userInfo=  authRepo.getUserInfo();
 _userModel= UserModel.fromJson(jsonDecode(userInfo));
  return _userModel;
  }
}