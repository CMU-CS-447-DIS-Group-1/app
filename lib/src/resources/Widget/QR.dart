import 'dart:convert';
import 'dart:ffi';

import 'package:app/src/resources/auth_blocs/auth_blocs.dart';
import 'package:app/src/resources/fire_base/fire_base_auth.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QR extends StatefulWidget {
  const QR({Key? key}) : super(key: key);

  @override
  _QRState createState() => _QRState();
}

class _QRState extends State<QR> {
  TextEditingController name = new TextEditingController();
  TextEditingController cmnd = new TextEditingController();
  TextEditingController checkin = new TextEditingController();
  TextEditingController WhereStart = new TextEditingController();
  TextEditingController WhereEnd = new TextEditingController();
  TextEditingController phone=new TextEditingController();
  TextEditingController address= new TextEditingController();
  Auth_blocs auth_blocs= new Auth_blocs();

  String? countryValue;
  String? stateValue;
  String? cityValue;
  var _stringQrcode;
  bool _qrcheck=true;
  String barcode = "";
  String qrCodeResult = "Chưa quét";
  FirAuth firAuth = new FirAuth();
  List gender = ["Male", "Female"];
  String _selectedGender = 'Male';
  List vungdich = ["Có", "Không"];
  String _selectedVungDich = 'Không';
  List tiepxuc = ["Có", "Không"];
  String _selectedTiepXuc = 'Không';
  List somui = [0,1,2];
  String _selectedSoMui = 'Không';
  FirAuth firebase_auth = new FirAuth();
  @override
  void dispose(){
    auth_blocs.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // return DefaultTabController(
    //   length: 2,
    //   child: Scaffold(
    //     appBar: AppBar(
    //       backgroundColor: Colors.blue,
    //       bottom: TabBar(
    //         indicator: BubbleTabIndicator(
    //             tabBarIndicatorSize: TabBarIndicatorSize.tab,
    //             indicatorHeight: 40.0,
    //             indicatorColor: Colors.white),
    //         labelColor: Colors.black,
    //         labelStyle: TextStyle(fontSize: 16),
    //         tabs: [
    //           Tab(text: "Cá nhân"),
    //           Tab(
    //             text: "Chốt kiểm dịch",
    //           ),
    //         ],
    //         unselectedLabelColor: Colors.black,
    //       ),
    //       titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    //       centerTitle: true,
    //       title: const Text("Mã QR"),
    //     ),
    //     body: TabBarView(
    //       children: [
    //         _buildQRPersonal(),
    //         chotKiemDich(),
    //       ],
    //     ),
    //   ),
    // );
    // ;
    return Scaffold(
      appBar: AppBar(title: Text("Nhập thông tin")),
      body: _buildQRPersonal(),
    );
  }

  Widget _buildQRPersonal() {
    return Container(
      child: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _qrcheck == true
                ? Text(
                    "Chưa có mã QR",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20,),
                  )
                : QrImage(
                    data: _stringQrcode,
                    padding: EdgeInsets.all(80),
                  ),
            Container(
              margin: EdgeInsets.only(top:20),
                color: Colors.white,
                height: 42,
                child: StreamBuilder(
                  stream: auth_blocs.nameStream,
                  builder: (context, snapshot) {
                    return TextField(
                      controller: name,
                      style: TextStyle(fontSize: 16, color: Colors.black),
                      decoration: InputDecoration(
                          errorText: snapshot.hasError ? snapshot.error.toString(): null,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade400),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          // border: OutlineInputBorder(
                          //   borderSide:
                          //       BorderSide(color: Colors.grey.shade400, width: 1),
                          //   borderRadius: BorderRadius.all(Radius.circular(10)),
                          // ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey.shade400, width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          hintText: "Họ và tên"),
                    );
                  }
                )),
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    leading: Radio(
                      value: 'male',
                      groupValue: _selectedGender,
                      onChanged: (value) {
                        setState(() {
                          _selectedGender = value as String;
                        });
                      },
                    ),
                    title: Text('Nam'),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    leading: Radio(
                      value: 'female',
                      groupValue: _selectedGender,
                      onChanged: (value) {
                        setState(() {
                          _selectedGender = value as String;
                        });
                      },
                    ),
                    title: Text('Nữ'),
                  ),
                ),
              ],
            ),
            Container(
                color: Colors.white,
                height: 42,
                child: StreamBuilder(
                  stream: auth_blocs.cmndStream,
                  builder: (context, snapshot) {
                    return TextField(
                      controller: cmnd,
                      style: TextStyle(fontSize: 16, color: Colors.black),
                      decoration: InputDecoration(
                          errorText: snapshot.hasError ? snapshot.error.toString(): null,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade400),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          // border: OutlineInputBorder(
                          //   borderSide:
                          //       BorderSide(color: Colors.grey.shade400, width: 1),
                          //   borderRadius: BorderRadius.all(Radius.circular(10)),
                          // ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey.shade400, width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          hintText: "CMND/CCCD"),
                    );
                  }
                )),
            Container(
              color: Colors.white,
              margin: EdgeInsets.only(top: 20),
                height: 42,
                child: StreamBuilder(
                  stream: auth_blocs.phoneStream,
                  builder: (context, snapshot) {
                    return TextField(
                      controller: phone,
                      style: TextStyle(fontSize: 16, color: Colors.black),
                      decoration: InputDecoration(
                          errorText: snapshot.hasError ? snapshot.error.toString(): null,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade400),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          // border: OutlineInputBorder(
                          //   borderSide:
                          //   BorderSide(color: Colors.grey.shade400, width: 1),
                          //   borderRadius: BorderRadius.all(Radius.circular(10)),
                          // ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.grey.shade400, width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          hintText: "Số điện thoại"),
                    );
                  }
                )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10),
                    child: Text("Địa chỉ",style: TextStyle(fontSize: 16),
                    )
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
              ],
            ),
            Container(
                color: Colors.white,
                margin: EdgeInsets.only(top: 20),
                height: 42,
                child: StreamBuilder(
                  stream: auth_blocs.addressStream,
                  builder: (context, snapshot) {
                    return TextField(
                      controller: address,
                      style: TextStyle(fontSize: 16, color: Colors.black),
                      decoration: InputDecoration(
                          errorText: snapshot.hasError ? snapshot.error.toString(): null,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade400),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          // border: OutlineInputBorder(
                          //   borderSide:
                          //   BorderSide(color: Colors.grey.shade400, width: 1),
                          //   borderRadius: BorderRadius.all(Radius.circular(10)),
                          // ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.grey.shade400, width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          hintText: "Số nhà/Thôn/Xã"),
                    );
                  }
                )),
            Container(
                color: Colors.white,
                margin: EdgeInsets.only(top: 20),
                height: 42,
                child: StreamBuilder(
                  stream: auth_blocs.whereStartStream,
                  builder: (context, snapshot) {
                    return TextField(
                      controller: WhereStart,
                      style: TextStyle(fontSize: 16, color: Colors.black),
                      decoration: InputDecoration(
                          errorText: snapshot.hasError ? snapshot.error.toString(): null,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade400),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          // border: OutlineInputBorder(
                          //   borderSide:
                          //   BorderSide(color: Colors.grey.shade400, width: 1),
                          //   borderRadius: BorderRadius.all(Radius.circular(10)),
                          // ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.grey.shade400, width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          hintText: "Nơi bắt đầu đi"),
                    );
                  }
                )),
            Container(
                color: Colors.white,
                margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                height: 42,
                child: StreamBuilder(
                  stream: auth_blocs.whereEndStream,
                  builder: (context, snapshot) {
                    return TextField(
                      controller: WhereEnd,
                      style: TextStyle(fontSize: 16, color: Colors.black),
                      decoration: InputDecoration(
                          errorText: snapshot.hasError ? snapshot.error.toString(): null,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade400),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          // border: OutlineInputBorder(
                          //   borderSide:
                          //   BorderSide(color: Colors.grey.shade400, width: 1),
                          //   borderRadius: BorderRadius.all(Radius.circular(10)),
                          // ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.grey.shade400, width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          hintText: "Nơi đến"),
                    );
                  }
                )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Trong vùng dịch",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        leading: Radio(
                          value: 'Không',
                          groupValue: _selectedVungDich,
                          onChanged: (value) {
                            setState(() {
                              _selectedVungDich = value as String;
                            });
                          },
                        ),
                        title: Text('Không'),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        leading: Radio(
                          value: 'Có',
                          groupValue: _selectedVungDich,
                          onChanged: (value) {
                            setState(() {
                              _selectedVungDich = value as String;
                            });
                          },
                        ),
                        title: Text('Có'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Đã tiếp xúc với người nhiễm 7 ngày qua",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        leading: Radio(
                          value: 'Không',
                          groupValue: _selectedTiepXuc,
                          onChanged: (value) {
                            setState(() {
                              _selectedTiepXuc = value as String;
                            });
                          },
                        ),
                        title: Text('Không'),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        leading: Radio(
                          value: 'Có',
                          groupValue: _selectedTiepXuc,
                          onChanged: (value) {
                            setState(() {
                              _selectedTiepXuc = value as String;
                            });
                          },
                        ),
                        title: Text('Có'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Số mũi",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        leading: Radio(
                          value: "0",
                          groupValue: _selectedSoMui,
                          onChanged: (value) {
                            setState(() {
                              _selectedSoMui = value as String;
                            });
                          },
                        ),
                        title: Text('0'),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        leading: Radio(
                          value: "1",
                          groupValue: _selectedSoMui,
                          onChanged: (value) {
                            setState(() {
                              _selectedSoMui = value as String;
                            });
                          },
                        ),
                        title: Text('1'),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        leading: Radio(
                          value: "2",
                          groupValue: _selectedSoMui,
                          onChanged: (value) {
                            setState(() {
                              _selectedSoMui = value as String;
                            });
                          },
                        ),
                        title: Text('2'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            genarateButton("Điền thông tin"),
          ],
        ),
      ),
    );
  }

  Widget chotKiemDich() {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            "Thông tin người đi đường",
            style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
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
              String codeSanner = await FlutterBarcodeScanner.scanBarcode(
                  '#ff6666', 'Cancel', true, ScanMode.QR); //barcode scnner
              setState(() {
                qrCodeResult = codeSanner;
              });
            },
            child: Text(
              "Quét mã QR",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.blue, width: 3.0),
                borderRadius: BorderRadius.circular(20.0)),
          ),
        ],
      ),
    );
  }

  Widget genarateButton(String text) {
    return FlatButton(
      padding: EdgeInsets.all(13.0),
      child: Text(text),
      onPressed: () {
        var isEmpty=auth_blocs.emptyData(name.text, cmnd.text, address.text, WhereStart.text, WhereEnd.text,phone.text);
        if(isEmpty){
          setState(() {
            _qrcheck = false;
            var result={
              "UID":firebase_auth.currentUser().toString(),
              "Họ và tên": name.text,
              "Giới tính": _selectedGender.toString(),
              "CMND":cmnd.text,
              "Số điện thoại": phone.text,
              "Địa chỉ":address.text+", "+cityValue.toString()+", "+stateValue.toString()+", "+countryValue.toString(),
              "Nơi bắt đầu đi":WhereStart.text,
              "Nơi đến":WhereEnd.text,
              "Vùng dịch":_selectedVungDich.toString(),
              "Tiếp xúc":_selectedTiepXuc.toString(),
              "Số mũi":_selectedSoMui.toString(),
            };
            _stringQrcode=jsonEncode(result);
            // _stringQrcode = "Họ và tên: " + name.text + "\n" +
            //     "Giới tính: "+_selectedGender.toString()+"\n"+
            //     "Số CMND/CCCD: " + cmnd.text + "\n" +
            //     "Số điện thoại: " + phone.text +"\n"
            //     "Địa chỉ: " +
            //     cityValue.toString() + " " +
            //     stateValue.toString() + " " +
            //     countryValue.toString() + "\n" +
            //     "Nơi bắt đầu đi: " + WhereStart.text+"\n"+
            //     "Nơi đến: "+WhereEnd.text;
            firebase_auth.data(name.text, _selectedGender, cmnd.text, phone.text, address.text+", "+
                cityValue.toString() + ", " +
                stateValue.toString() + ", " +
                countryValue.toString(),
                WhereStart.text,
                WhereEnd.text,
              _selectedVungDich,
              _selectedTiepXuc,
              _selectedSoMui,
            );
          });
        }
      },
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            20.0,
          ),
          side: BorderSide(color: Colors.blue, width: 3.0)),
    );
  }
}
