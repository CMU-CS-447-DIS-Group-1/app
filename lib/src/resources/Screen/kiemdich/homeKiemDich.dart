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
  String barcode = "";
  String? countryValue;
  String? stateValue;
  String? cityValue;
  var UID;
  var kq;
  bool check = false;
  FirAuth firebase_auth = new FirAuth();
  int _counter_approve = 0;
  int _counter_reject = 0;
  
  void _incrementCounterApprove() {
    setState(() {
      _counter_approve++;
    });
  }
  void _incrementCounterReject() {
    setState(() {
      _counter_approve++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "Chốt kiểm dịch",
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.cyan.withOpacity(.09),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Chọn chốt",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CSCPicker(
                      showStates: true,
                      showCities: true,
                      flagState: CountryFlag.DISABLE,
                      dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                          border: Border.all(
                              color: Colors.grey.shade300, width: 1)),
                      disabledDropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.grey.shade300,
                          border: Border.all(
                              color: Colors.grey.shade300, width: 1)),
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
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            child: Center(
                              child: Text(
                                "Phê duyệt: "+'$_counter_approve',style: TextStyle(fontSize: 16),),
                            ),
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(2)),
                          padding: EdgeInsets.all(5),
                          height: 30,
                            width: 150,
                        ),
                        Container(
                            child: Center(
                              child: Text(
                                "Từ chối: "+'$_counter_approve',style: TextStyle(fontSize: 16),),
                            ),
                            decoration: BoxDecoration(
                                color: Colors.pink,
                                borderRadius: BorderRadius.circular(2)),
                          padding: EdgeInsets.all(5),
                          height: 30,
                          width: 150,
                        ),
                      ],
                    ),

                  ],
                ),
              ),

              // FlatButton(
              //   padding: EdgeInsets.all(10.0),
              //   onPressed: () async {
              //     String barcode = await FlutterBarcodeScanner.scanBarcode(
              //         '#ff6666', 'Cancel', true, ScanMode.QR); //barcode scnner
              //     setState(() {
              //       this.barcode = barcode;
              //       qrCodeResult = jsonDecode(barcode);
              //       if (barcode.length>=0) {
              //         check = true;
              //         print(barcode.length);
              //       }
              //     });
              //   },
              //   child: Text(
              //     "Quét mã QR",
              //     style:
              //         TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              //   ),
              //   shape: RoundedRectangleBorder(
              //       side: BorderSide(color: Colors.blue, width: 2.0),
              //       borderRadius: BorderRadius.circular(20.0)),
              // ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Thông tin người đi đường",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              check == false
                  ? Container(
                      height: 50,
                      margin: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                          color: Colors.yellow.withOpacity(.09),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Center(child: Text("Quét để hiển thị dữ liệu")),
                    )
                  : Container(
                      height: 400,
                      decoration: BoxDecoration(
                          color: Colors.pinkAccent.withOpacity(.09),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      padding: EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Họ và tên: " +
                              qrCodeResult["Họ và tên"].toString()),
                          Text("Giới tính: " +
                              qrCodeResult['Giới tính'].toString()),
                          Text("Số CMND/CCCD: " +
                              qrCodeResult['CMND'].toString()),
                          Text("Số điện thoại: " +
                              qrCodeResult['Số điện thoại'].toString()),
                          Text(
                              "Địa chỉ: " + qrCodeResult['Địa chỉ'].toString()),
                          Text("Nơi bắt đầu đi: " +
                              qrCodeResult['Nơi bắt đầu đi'].toString()),

                        ],
                      ),
                    ),
              SizedBox(
                height: 5,
              ),
              check == false
                  ? Text("")
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 150,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: FlatButton(
                            onPressed: () {
                              _incrementCounterApprove();
                                updateData(
                                    qrCodeResult['UID'].toString(),
                                    cityValue.toString() +
                                        ", " +
                                        stateValue.toString());
                              },
                            child: Text("Chấp thuận"),
                          ),
                        ),
                        Container(
                          width: 150,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: FlatButton(
                            onPressed: () {
                              _incrementCounterApprove();
                              setState(() {
                                check = false;
                              });
                            },
                            child: Text("Từ chối"),
                          ),
                        ),
                      ],
                    )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.qr_code_scanner),
        onPressed: () async {
          String barcode = await FlutterBarcodeScanner.scanBarcode(
              '#ff6666', 'Cancel', true, ScanMode.QR); //barcode scnner
          setState(() {
            this.barcode = barcode;
            qrCodeResult = jsonDecode(barcode);
            if (barcode.length > 10) {
              check = true;
            }
          });
        },
        backgroundColor: Colors.teal,
      ),
    );
  }

  updateData(String uid, String NoiDen) {
    var ref = FirebaseDatabase.instance.reference().child("RoadsterList");
    ref.child(uid).update({"WhereCheck": NoiDen});
  }

  getData(String uid) {
    var ref = FirebaseDatabase.instance.reference().child("RoadsterList");
    ref.child(uid).child("WhereCheck").once().then((DataSnapshot dataSnapshot) {
      kq=dataSnapshot.value;
    });
    return kq;
  }
}
