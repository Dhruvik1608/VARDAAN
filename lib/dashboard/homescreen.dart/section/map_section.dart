import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vardaan/dashboard/homescreen.dart/controller/map_controller.dart';

class MapSection extends StatelessWidget {
  const MapSection({super.key});

  @override
  Widget build(BuildContext context) {
    final MapController mapController = Get.find<MapController>();
    double screenWidth = ScreenUtil().screenWidth;
    return Obx(() {
      if (mapController.currentLocation.value == null) {
        return const Center(child: CircularProgressIndicator());
      }

      return SizedBox(
        width: screenWidth,
        child: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(
              mapController.currentLocation.value!.latitude,
              mapController.currentLocation.value!.longitude,
            ),
            zoom: 14.0,
          ),
          compassEnabled: true,
          zoomControlsEnabled: false,
          myLocationButtonEnabled: true,
          myLocationEnabled: true,
          mapType: MapType.normal,
          onMapCreated: mapController.onMapCreated,
          markers: mapController.nearestHospitalLocations.toSet(),
        ),
      );
    });
  }
}
