import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Completer<GoogleMapController> _googleMapController = Completer();
  List<Marker> markers = [];
  final List<Marker> _list = [
    const Marker(
        markerId: MarkerId('1'), position: LatLng(30.122490, 77.717216)),
    const Marker(
        markerId: MarkerId('2'), position: LatLng(40.122490, 77.717216)),
  ];
  final CameraPosition _kGoogleMap =
      const CameraPosition(target: LatLng(40.122490, 77.717216), zoom: 13);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    markers.addAll(_list);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.location_on),
          onPressed: () async {
            GoogleMapController googleController =
                await _googleMapController.future;
            googleController.animateCamera(CameraUpdate.newCameraPosition(
                const CameraPosition(
                    target: LatLng(40.122490, 77.717216), zoom: 14)));
            setState(() {});
          },
        ),
        body: GoogleMap(
          rotateGesturesEnabled: true,
          compassEnabled: true,
          initialCameraPosition: _kGoogleMap,
          markers: Set<Marker>.of(markers),
          onMapCreated: (controller) {
            _googleMapController.complete(controller);
          },
        ),
      ),
    );
  }
}
