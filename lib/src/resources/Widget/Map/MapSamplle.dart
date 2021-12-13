import 'dart:async';

import 'package:app/src/resources/Widget/Map/location_service.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  _MapSampleState createState() => _MapSampleState();
}

class _MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller= Completer();
  TextEditingController _searchController= TextEditingController();
  static final CameraPosition _kGooglePlex= CameraPosition(
      target: LatLng(35,-122),
    zoom: 15
  );
  static final Marker _kGoolePlexMarker= Marker(
    markerId: MarkerId('_kGooglePlex'),
    infoWindow: InfoWindow(title: "Google Plex"),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(37.2,-122),
  );
  static final CameraPosition _kLake=CameraPosition(
      target: LatLng(37,-122),
    zoom: 15
  );
  static final Marker _kLakeMarker= Marker(
    markerId: MarkerId('_kLakeMarker'),
    infoWindow: InfoWindow(title: "Lake"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    position: LatLng(37,-122),
  );
  static final Polyline _kPolyline= Polyline(
      polylineId: PolylineId('_kPolyline'),
    points: [
      LatLng(35,-122),
      LatLng(37,-122)
    ],
      width: 2,
  );
  static final Polygon _kPolygon= Polygon(
    polygonId: PolygonId('_kPolygon'),
    points: [
      LatLng(35,-122),
      LatLng(37,-122),
      LatLng(37.418, -122.092),
      LatLng(37.345, -122.092),
    ],
    strokeWidth: 5,
    fillColor: Colors.transparent
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title:Text("Map Covid") ,) ,
      body: Column(
        children: [
          Row(
            children: [
              Expanded(child: TextFormField(
                controller:  _searchController,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  hintText: "Nơi đi",
                ),
                onChanged: (value){
                  print(value);
                },
              )),
              IconButton(onPressed:(){
                LocationService().getPlaceId(_searchController.text);
              },icon:Icon(Icons.search) ,),
            ],
          ),
          Expanded(
            child: GoogleMap(
              mapType: MapType.normal,
              markers: {_kGoolePlexMarker,},
              // polylines: {
              //   _kPolyline
              // },
              // polygons: {_kPolygon},
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller){
                _controller.complete(controller);
              },
            ),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton.extended(onPressed: _goToTheLake, label: Text("Go to the lake"),icon: Icon(Icons.directions_boat),),
    );
  }
  Future<void> _goToTheLake() async{
    final GoogleMapController controller= await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
