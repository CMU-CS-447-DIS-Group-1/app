import 'package:app/src/resources/Screen/LoginHomePage.dart';
import 'package:app/src/resources/Widget/Home.dart';
import 'package:app/src/resources/Widget/Location.dart';
import 'package:app/src/resources/Widget/Map.dart';
import 'package:app/src/resources/Widget/QR.dart';
import 'package:app/src/resources/Widget/Setting.dart';
import 'package:app/src/resources/custom/bottomNavigationItem.dart';
import 'package:app/src/resources/fire_base/fire_base_auth.dart';
import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:gradient_bottom_navigation_bar/gradient_bottom_navigation_bar.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
  // //tao method lay string cua class
  //getStringQRcode()=> createState()._stringQrcode;
}

 class _HomeScreenState extends State<HomeScreen> {
  BottomNavigationItem _bottomNavigationItem=BottomNavigationItem();
  int _currentTab=0;
  bool pageActive1=false,pageActive2=false,pageActive3=false,pageActive4=false;
  var _pages=[TrangChu(),map(),QR(), Setting()];
  void _onTap(int index){
    setState(() {
      _currentTab=index;
    });

  }

  
  @override
  Widget build(BuildContext context) {
    setState(() {
      _currentTab==0? pageActive1=true:pageActive1=false;
      _currentTab==1? pageActive2=true:pageActive2=false;
      _currentTab==2? pageActive3=true:pageActive3=false;
      _currentTab==3? pageActive4=true:pageActive4=false;
    });
    return Scaffold(
      body:_pages.elementAt(_currentTab) ,
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: _currentTab,
        items: [
          _bottomNavigationItem.showItem(pageActive1, "1", 25),
          _bottomNavigationItem.showItem(pageActive2, "2", 25),
          _bottomNavigationItem.showItem(pageActive3, "3", 25),
          _bottomNavigationItem.showItem(pageActive4, "4", 25),
        ],
        onTap:_onTap ,
      ),
    );
  }
}



