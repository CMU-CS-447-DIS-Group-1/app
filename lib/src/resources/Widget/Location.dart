import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class LocationProvider {//with ChangeNotifier
  var _location;
  Location get location=> _location;
  var _locationPosition;
  LatLng get locationPosition=> _locationPosition;
  bool locationServiceActive= true;
  LocationProvider(){
    _location=new Location();
  }


  initalization()async{
    await getUserLocation();
  }
  getUserLocation() async{
    bool _serviceEnable;
    PermissionStatus _permissionGranted;
    _serviceEnable= await location.serviceEnabled();
    if(!_serviceEnable){
      _serviceEnable= await location.requestService();
      if(!_serviceEnable){
        return;
      }
    }
    _permissionGranted=await location.hasPermission();
    if(_permissionGranted== PermissionStatus.denied){
      _permissionGranted  =await location.requestPermission();
      if(_permissionGranted!=PermissionStatus.granted){
        return;
      }
    }
    location.onLocationChanged.listen((LocationData currentLocation) {
      _locationPosition= LatLng(currentLocation.latitude,currentLocation.longitude);
      print(_locationPosition);
      //notifyListeners();
    });
  }
}