import 'package:ecommerce_app1/constants/colors/app_colors.dart';
import 'package:ecommerce_app1/pages/location/location_controller.dart';
import 'package:ecommerce_app1/pages/signIn/sign_in_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}
CameraPosition _cameraPosition = const CameraPosition(target: LatLng(7.3776, 3.9059), zoom: 17);
class _LocationPageState extends State<LocationPage> {
  @override
  Widget build(BuildContext context) {
    return  GetBuilder<LocationController>(
      builder: (locationController) {
        return Scaffold(
          appBar: AppBar(
            title:  reuseableText('Address Page', color: Colors.white),
            centerTitle: true,
            backgroundColor: AppColors.mainColor,
          ),
          body: Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 5.w, right: 5.w, top: 5.w),
                height: 140.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: 2.w,
                    color: AppColors.mainColor
                  )
                ),
                child: GoogleMap(
                  initialCameraPosition: const CameraPosition(target: LatLng(7.3776, 3.9059), zoom: 17),
                  zoomControlsEnabled: false,
                  compassEnabled: false,
                  indoorViewEnabled: true,
                  mapToolbarEnabled: false,
                  myLocationEnabled: true,
                  onCameraMove: (position) => _cameraPosition=position,
                  onMapCreated: (controller) {
                    locationController.setMapController(controller);
                  },
                  onCameraIdle: () {
                    locationController.updatePosition(_cameraPosition, true);
                  },
                   ),
              )
            ],
          ),
        );
      }
    );
  }
}