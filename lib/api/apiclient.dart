import 'package:ecommerce_app1/constants/colors/constants.dart';
import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService{
  late String appbaseUrl;
  late String token;
  late Map<String, String> mainHeader;
  ApiClient({required this.appbaseUrl}){
    baseUrl=appbaseUrl;
    timeout = Duration(seconds: 30);
    token=AppConstants.TOKEN;
    mainHeader={
      'Content-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
      "HttpHeaders.contentTypeHeader": "application/json"
    };
  }

  Future<Response> getData(String uri, {Map<String, String>? mainHeader}) async{
    try{
     
      print('trying.....');
      Response response= await get(uri, headers: mainHeader);
      return response;
    }catch(e){
      print(e.toString());
      return Response(statusCode: 1, statusText: e.toString());
    }
    
  }
  updateToken(token){
     mainHeader={
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
      "HttpHeaders.contentTypeHeader": "application/json"
    };
  }

 Future<Response> postData(String url, dynamic body) async{
   try{
     Response response= await post(url, body, headers:mainHeader);
     return response;
   }catch(e){
    return Response(statusCode: 1, statusText: e.toString());
   }
  }
}