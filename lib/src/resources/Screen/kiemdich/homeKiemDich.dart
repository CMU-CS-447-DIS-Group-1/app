import 'dart:convert';

import 'package:app/src/resources/Widget/Loading.dart';
import 'package:app/src/resources/fire_base/fire_base_auth.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
class HomeKiemDich extends StatefulWidget {
  const HomeKiemDich({Key? key}) : super(key: key);

  @override
  _HomeKiemDichState createState() => _HomeKiemDichState();
}

class _HomeKiemDichState extends State<HomeKiemDich> {
  var qrCodeResult;
  String barcode="";
  String? countryValue;
  String? stateValue;
  String? cityValue;
  var UID;
  FirAuth firebase_auth = new FirAuth();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "Thông tin người đi đường",
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: CSCPicker(
                showStates: true,
                showCities: true,
                flagState: CountryFlag.DISABLE,
                dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.shade300, width: 1)),
                disabledDropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.grey.shade300,
                    border: Border.all(color: Colors.grey.shade300, width: 1)),
                countrySearchPlaceholder: "Quốc gia",
                stateSearchPlaceholder: "Tỉnh",
                citySearchPlaceholder: "Quận/Huyện",
                countryDropdownLabel: "Quốc gia",
                stateDropdownLabel: "Thành phố",
                cityDropdownLabel: "Huyện",
                defaultCountry: DefaultCountry.Vietnam,
                disableCountry: true,
                selectedItemStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
                dropdownHeadingStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
                dropdownItemStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
                dropdownDialogRadius: 10.0,
                searchBarRadius: 10.0,
                onCountryChanged: (value) {
                  setState(() {
                    countryValue = value;
                  });
                },
                onStateChanged: (value) {
                  setState(() {
                    stateValue = value;
                  });
                },
                onCityChanged: (value) {
                  setState(() {
                    cityValue = value;
                  });
                },
              ),
            ),
            Text(
              "",
              style: TextStyle(
                fontSize: 20.0,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20.0,
            ),
            FlatButton(
              padding: EdgeInsets.all(15.0),
              onPressed: () async {
                String barcode  = await FlutterBarcodeScanner.scanBarcode(
                    '#ff6666', 'Cancel', true, ScanMode.QR); //barcode scnner
                setState(() {
                  this.barcode  = barcode ;
                  qrCodeResult =jsonDecode(barcode) ;
                });
              },
              child: Text(
                "Quét mã QR",
                style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.blue, width: 2.0),
                  borderRadius: BorderRadius.circular(20.0)),
            ),
            qrCodeResult==null?Loading():Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(qrCodeResult["Họ và tên"].toString()),
                  Text(qrCodeResult['Giới tính'].toString()),
                  Text(qrCodeResult['CMND'].toString()),
                  Text(qrCodeResult['Số điện thoại'].toString()),
                  Text(qrCodeResult['Địa chỉ'].toString()),
                  Text(qrCodeResult['Nơi bắt đầu đi'].toString()),
                  Text(qrCodeResult['Nơi đến'].toString()),
                ],
              ),
            ),
            qrCodeResult==null?Text(""):
            FlatButton(
              padding: EdgeInsets.all(15.0),
              onPressed: updateData("201812773",qrCodeResult['Nơi đến'].toString()),
              child: Text(
                "APPROVAL",
                style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.blue, width: 2.0),
                  borderRadius: BorderRadius.circular(20.0)),
            ),
          ],
        ),
      ),
    );
  }
  updateData(String uid,String NoiDen){
    var ref= FirebaseDatabase.instance.reference().child("RoadsterList");
    ref.child(uid).update({"Nơi đã qua":NoiDen});
  }
}
