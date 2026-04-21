import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vardaan/dashboard/hospitals.dart';

class MapController extends GetxController {
  late Completer<GoogleMapController> _controller;
  final nearestHospitalDistances = <double>[].obs;
  final Rx<Position?> currentLocation = Rx<Position?>(null);
  final nearestHospitalLocations = <Marker>{}.obs;
  final TextEditingController search = TextEditingController();
  StreamSubscription<Position>? _locationSubscription;
  final nearestHospitalNames = <String>[].obs;
  int selectedIndex = 0;
  final RxList<Map<String, dynamic>> nearestHospitalDetails =
      <Map<String, dynamic>>[].obs;

  final Rx<Marker?> focusedMarker = Rx<Marker?>(null);

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    getLocationUpdates();
  }

  @override
  void onClose() {
    _locationSubscription?.cancel();
    super.onClose();
  }

  void onMapCreated(GoogleMapController controller) {
    _controller = Completer(); // reassign before completing
    _controller.complete(controller);
  }

  Future<void> launchUrlString(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> launchDialer(String phoneNumber) async {
    final Uri uri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch dialer';
    }
  }

  Future<void> getLocationUpdates() async {
    print("Called");
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print("Not enabled");
      Get.snackbar(
        "Location Services Disabled",
        "Please enable location services.",
      );
      return;
    }
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        Get.snackbar(
          "Permission Denied",
          "Location permission is required to use this feature.",
        );
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Get.defaultDialog(
        title: "Permission Required",
        middleText:
            "Location permission is permanently denied. Please enable it in settings.",
        textConfirm: "Open Settings",
        textCancel: "Cancel",
        onConfirm: () async {
          await Geolocator.openAppSettings();
          Get.back();
        },
      );
      return;
    }

    try {
      currentLocation.value = await Geolocator.getCurrentPosition(
        desiredAccuracy:
            LocationAccuracy.bestForNavigation, // Highest GPS accuracy
        forceAndroidLocationManager: true, // Bypasses FusedLocationProvider
      );

      print("service:" + currentLocation.value.toString());

      updateNearestHospitals();
    } catch (e) {
      print("Error getting location: $e");
    }
    print("Location is" + currentLocation.value!.latitude.toString());

    _locationSubscription?.cancel();

    _locationSubscription = Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 10,
      ),
    ).listen((Position position) {
      currentLocation.value = position;
      updateNearestHospitals();
    });
  }

  void updateNearestHospitals() {
    if (currentLocation.value != null) {
      RxList<Map<String, dynamic>> hospitals = searchedHospital(search.text);
      List<double> distances = [];
      List<String> names = [];
      List<Map<String, dynamic>> details = [];

      List<Map<String, dynamic>> hospitalsList =
          hospitals.map((hospital) {
            return {
              'latitude': (hospital['latitude'] as num).toDouble(),
              'longitude': (hospital['longitude'] as num).toDouble(),
              'Name': hospital['Name'] as String,
              'Treatment': hospital['Treatment'] as String,
              'Address': hospital['Address'] as String,
              'Facility': hospital['Facility'] as String,
              'Call': hospital['Call'] as String,
              'Scheme': hospital['Scheme'] as String,
              'Link': hospital['Link'] as String,
            };
          }).toList();

      List<Map<String, dynamic>> nearestHospitals = _findNearestHospitals(
        currentLocation.value!,
        hospitalsList,
        3, // Limit to 4 nearest hospitals
      );

      Set<Marker> markers =
          nearestHospitals.map((hospitalLocation) {
            double distance = _calculateDistance(
              currentLocation.value!.latitude,
              currentLocation.value!.longitude,
              hospitalLocation['latitude']!,
              hospitalLocation['longitude']!,
            );
            distances.add(distance);
            names.add(hospitalLocation['Name'].toString());
            details.add(hospitalLocation);

            Marker marker = Marker(
              markerId: MarkerId(hospitalLocation['Name'].toString()),
              position: LatLng(
                hospitalLocation['latitude']!,
                hospitalLocation['longitude']!,
              ),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueRed,
              ),
            );

            return marker;
          }).toSet();

      nearestHospitalNames.value = names;
      nearestHospitalDetails.value = details;
      nearestHospitalLocations.value = markers;
      nearestHospitalDistances.value = distances;
    }
  }

  RxList<Map<String, dynamic>> searchedHospital(String searchQuery) {
    if (searchQuery.toLowerCase() == "crack") {
      return crackLocation;
    } else {
      return hospitalLocations;
    }
  }

  List<Map<String, dynamic>> _findNearestHospitals(
    Position currentLocation,
    List<Map<String, dynamic>> hospitals,
    int count,
  ) {
    List<Map<String, dynamic>> nearestHospitals = [];
    hospitals.sort((a, b) {
      double distanceA = _calculateDistance(
        currentLocation.latitude,
        currentLocation.longitude,
        a['latitude']!,
        a['longitude']!,
      );
      double distanceB = _calculateDistance(
        currentLocation.latitude,
        currentLocation.longitude,
        b['latitude']!,
        b['longitude']!,
      );
      return distanceA.compareTo(distanceB);
    });
    for (int i = 0; i < math.min(count, hospitals.length); i++) {
      nearestHospitals.add(hospitals[i]);
    }
    return nearestHospitals;
  }

  double _calculateDistance(
    double fromLat,
    double fromLng,
    double toLat,
    double toLng,
  ) {
    const double earthRadius = 6371.0;
    double fromLatRadians = fromLat * math.pi / 180;
    double toLatRadians = toLat * math.pi / 180;
    double latDistance = toLatRadians - fromLatRadians;
    double lonDistance = (toLng - fromLng) * math.pi / 180;
    double a =
        math.sin(latDistance / 2) * math.sin(latDistance / 2) +
        math.cos(fromLatRadians) *
            math.cos(toLatRadians) *
            math.sin(lonDistance / 2) *
            math.sin(lonDistance / 2);
    double c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
    double distance = earthRadius * c;
    return distance;
  }

  Future<void> focusOnSelectedHospital(int itemIndex) async {
    if (!_controller.isCompleted) return;

    final controller = await _controller.future;

    if (itemIndex < nearestHospitalLocations.length) {
      final Marker selectedMarker = nearestHospitalLocations.elementAt(
        itemIndex,
      );

      final CameraPosition newPosition = CameraPosition(
        target: selectedMarker.position,
        zoom: 15.0,
      );

      try {
        await controller.animateCamera(
          CameraUpdate.newCameraPosition(newPosition),
        );
        controller.showMarkerInfoWindow(selectedMarker.markerId);
      } catch (e) {
        print("Error while animating camera: $e");
      }

      controller.showMarkerInfoWindow(selectedMarker.markerId);
    }
  }

  @override
  void dispose() {
    search.dispose();
    _locationSubscription?.cancel();
    // TODO: implement dispose
    super.dispose();
  }
}
