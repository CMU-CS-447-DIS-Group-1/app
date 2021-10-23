import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';
class map extends StatefulWidget {
  const map({Key? key}) : super(key: key);

  @override
  _mapState createState() => _mapState();
}

class _mapState extends State<map> {
  bool isSwitch=false;
  var textSwitch="Hình ảnh thường";
  MapType _currentMapType = MapType.normal;
  void checkSwitch(bool value){
    if(isSwitch == false)
    {
      setState(() {
        _currentMapType=MapType.satellite;
        isSwitch = true;
        textSwitch = 'Hình ảnh vệ tinh';
      });
    }
    else
    {
      setState(() {
        _currentMapType=MapType.normal;
        isSwitch = false;
        textSwitch = 'Hình ảnh thường';
      });

    }
  }
  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng( 15.97, 108.21),
    zoom: 10,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            // dang map
            mapType: _currentMapType,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
          Container(
            margin: EdgeInsets.fromLTRB(330, 40, 0, 0),
            child: Switch(
              onChanged: checkSwitch,
              value: isSwitch,
              activeColor: Colors.green,
              activeTrackColor: Colors.white,
              inactiveThumbColor: Colors.red,
              inactiveTrackColor: Colors.white,
            ),
          ),
          Container(
              margin: EdgeInsets.fromLTRB(320, 80, 0, 0),
              child: Text('$textSwitch', style: TextStyle(fontSize: 10,color: Colors.black54),))
        ],
      ),
    );
  }
  //Dời camera đến một nơi nào đó

  // Future<void> _goToTheLake() async {
  //   final GoogleMapController controller = await _controller.future;
  //   controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  //}
}

