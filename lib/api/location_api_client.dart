import 'package:get/get.dart';

class LocationApiClient extends GetConnect implements GetxService{
 late String googleMapbaseUrl;
late Map<String, String> headers;
 LocationApiClient({required this.googleMapbaseUrl}){
  baseUrl=googleMapbaseUrl;
   timeout = const Duration(seconds: 30);
  headers ={
    'Content_type': 'application/json',
    "HttpHeaders.contentTypeHeader": "application/json"
  };
 }

 Future<Response> getData(url) async{
  try{
    Response response= await get(url);
    return response;
  }catch(e){
   return Response(statusCode: 1, statusText: e.toString());
  }
 }
}