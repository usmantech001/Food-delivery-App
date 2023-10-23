import 'dart:convert';

import 'package:ecommerce_app1/api/apiclient.dart';
import 'package:ecommerce_app1/constants/colors/constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/sign_up_model.dart';

class AuthRepo extends GetxService{
  ApiClient apiClient;
  SharedPreferences sharedPreferences;
  AuthRepo({required this.apiClient, required this.sharedPreferences});

 Future<Response> registration(SignUpModel body) async{
  return await apiClient.postData(AppConstants.REGISTRATION_URL, body.toJson());
  }
  Future<Response> login(String phone, String password) async{
  return await apiClient.postData(AppConstants.LOGIN_URL, {"phone":phone, "password":password});
  }
  saveUserToken(token) async {
    apiClient.token=token;
    apiClient.updateToken(token);
    await sharedPreferences.setString(AppConstants.TOKEN, token);
    
  }
  logOut(){
    sharedPreferences.remove(AppConstants.TOKEN);
    apiClient.token='';
    apiClient.updateToken('');
  
  }
  bool isLoogedIn()  {
    return  sharedPreferences.containsKey(AppConstants.TOKEN);
  }
  Future<bool>saveUserInfo(SignUpModel body ) async{
    return await sharedPreferences.setString(AppConstants.SAVE_USER_INFO, jsonEncode(body));
  }
 String getUserInfo() {
    String userInfo='';
    if(sharedPreferences.containsKey(AppConstants.SAVE_USER_INFO)){
    userInfo=  sharedPreferences.getString(AppConstants.SAVE_USER_INFO)??'';
    }
    return userInfo;
  }
}