import 'package:ecommerce_app1/api/location_api_client.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationRepo extends GetxService{
  LocationApiClient locationApiClient;

  LocationRepo({required this.locationApiClient});

 Future<Response> getAddressFromGeocode(LatLng latLng) async{
  return await locationApiClient.getData("/maps/api/geocode/json?latlng=${latLng.latitude},${latLng.longitude}&key=AIzaSyBfL-1rOTijNcZjikk_iWRQJkP1sZSWXCQ");
  }
}