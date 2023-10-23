// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// import 'location_repo.dart';

// class LocationController extends GetxController{
//   LocationRepo locationrepo;
//   LocationController({required this.locationrepo});
// late  Position _position;
// late Position _pickPosition;
//  late GoogleMapController _mapController;
//  bool updateAddress = true;

//  setMapController(GoogleMapController controller){
//    _mapController=controller;
//    update();
//  }

//   Future<void> updatePosition(CameraPosition cameraPosition, bool fromAddress) async {

//     if(fromAddress){
//      try{
//        _position = Position(
//         longitude: cameraPosition.target.longitude, 
//         latitude: cameraPosition.target.latitude, 
//         timestamp: DateTime.now(), 
//         accuracy: 1, 
//         altitude: 1, 
//         altitudeAccuracy: 1, 
//         heading: 1, 
//         headingAccuracy: 1, 
//         speed: 1, 
//         speedAccuracy: 1
//         );
//      }catch(e){
//          print(e);
//      }
//     }else{
//       _pickPosition =  Position(
//         longitude: cameraPosition.target.longitude, 
//         latitude: cameraPosition.target.latitude, 
//         timestamp: DateTime.now(), 
//         accuracy: 1, 
//         altitude: 1, 
//         altitudeAccuracy: 1, 
//         heading: 1, 
//         headingAccuracy: 1, 
//         speed: 1, 
//         speedAccuracy: 1
//         );
//     }
//     if(updateAddress){
//       String _address = await getAddressFromGeocode(
//         LatLng(cameraPosition.target.latitude, cameraPosition.target.longitude)
//       );
//       print(_address);
//     }

//   }
//    Future<String> getAddressFromGeocode(LatLng latlng) async{
//     Response response= await locationrepo.getAddressFromGeocode(latlng);
//     String _address ='';
//     print(response.body);
//     if(response.body['status']=='OK'){
//      _address = response.body["results"][0]["formatted_results"].toString();
//      print(_address);
//     }else{
//       print('failed to get the address');
//     }
//     return _address;
//     }
  
// }