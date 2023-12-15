import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  Location location = Location();
  LocationData? currentLocation; // Initialize to null

  @override
  void initState() {
    super.initState();
    _checkLocationPermission();
  }

  Future<void> _checkLocationPermission() async {
    var status = await Permission.location.status;
    if (status.isGranted) {
      _getLocation();
    } else {
      await Permission.location.request();
      // You can handle the permission result here
    }
  }

  Future<void> _getLocation() async {
    try {
      var userLocation = await location.getLocation();
      setState(() {
        currentLocation = userLocation;
      });
    } catch (e) {
      print("Error getting location: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Current Location'),
      ),
      body: Center(
        child: currentLocation != null
            ? Text(
            'Lat: ${currentLocation!.latitude}, Long: ${currentLocation!.longitude}')
            : const CircularProgressIndicator(),
      ),
    );
  }
}
