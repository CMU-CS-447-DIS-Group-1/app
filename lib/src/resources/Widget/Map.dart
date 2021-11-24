import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart' as geolocator;
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:app/src/resources/Widget/Location.dart';
import 'package:flutter/material.dart';
import 'package:geolocator_platform_interface/src/enums/location_accuracy.dart'
    as a;
import 'Loading.dart';
import 'package:location_platform_interface/location_platform_interface.dart';

class map extends StatefulWidget {
  const map({Key? key}) : super(key: key);

  @override
  _mapState createState() => _mapState();
}

class _mapState extends State<map> {
  LatLng _initialcameraposition = LatLng(100.5937, 78.9629);
  var _controller;
  Location _location = Location();
  void _onMapCreated(GoogleMapController _cntlr) {
    _controller = _cntlr;
    _location.onLocationChanged.listen((l) {
      _controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(l.latitude, l.longitude),zoom: 15),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_location != null) {
      return Scaffold(
        body: Column(children: [
          Expanded(
            child: GoogleMap(
              zoomGesturesEnabled: true,
              // dang map
              initialCameraPosition:
                  CameraPosition(target: _initialcameraposition),
              mapType: MapType.normal,
              onMapCreated: _onMapCreated,
              myLocationEnabled: true,
              zoomControlsEnabled: true,
              myLocationButtonEnabled: true,
            ),
          ),
        ]),
      );
    }
    return Loading();
  }
}
