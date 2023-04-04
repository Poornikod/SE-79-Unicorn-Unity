import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(6.8955, 79.8559),
    zoom: 14.4746,
  );

  // static const CameraPosition _kLake = CameraPosition(
  //     bearing: 192.8334901395799,
  //     target: LatLng(37.43296265331129, -122.08832357078792),
  //     tilt: 59.440717697143555,
  //     zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.hybrid,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
          Positioned(
            bottom: 50.0,
            left: 10.0,
            right: 250.0,
            child: FloatingActionButton.extended(
              onPressed: _goToTheLake,
              label: const Text('My Location'),
              icon: const Icon(Icons.location_on)
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;

    // Get the current location of the device
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    LatLng currentLocation = LatLng(position.latitude, position.longitude);

    // Create a new camera position with the current location as the target
    CameraPosition currentCameraPosition = CameraPosition(
      target: currentLocation,
      zoom: 14.0,
    );

    // Update the camera position of the map
    controller.animateCamera(
        CameraUpdate.newCameraPosition(currentCameraPosition));
  }
}