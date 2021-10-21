import 'package:app/src/resources/Screen/NhapThongTin.dart';
import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
  //tao method lay string cua class
  getStringQR()=> createState().stringQrcode;
}

class _HomeScreenState extends State<HomeScreen> {
  String? countryValue;
  String? stateValue;
  String? cityValue;
  String _stringQrcode="";
  bool _qrcheck=true;
  String barcode = "";
  String qrCodeResult="Chưa quét" ;


  String get stringQrcode => _stringQrcode;

  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          bottomNavigationBar: BottomAppBar(
            color: Colors.blueAccent,
            child: TabBar(
              indicatorWeight: 4,
              tabs: [
                Tab(icon: Icon(Icons.home),text: "Trang chủ",),
                Tab(icon: Icon(Icons.map),text: "Bản đồ",),
                Tab(icon: Icon(Icons.qr_code_scanner),text:"Mã QR",),
                Tab(icon: Icon(Icons.settings),text: "Cài đặt",),
              ],
              unselectedLabelColor: Colors.black54,
            ),
          ),
          body: TabBarView(
            children: [
              Text("Trang chủ"),
              Text("Trang chủ"),
              _tabQR(),
              Text("Trang chủ"),
            ],
          ),
        ),
    );
  }








// xây dựng các thành phần trong QR
  Widget _tabQR(){
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              labelStyle: TextStyle(fontSize: 16),
              tabs: [
                Tab(text: "Cá nhân"),
                Tab(text: "Chốt kiểm dịch",),
              ],
            ),
            titleTextStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold) ,
            centerTitle: true,
            title: const Text("QR"),
          ),
          body: TabBarView(
            children: [
              _buildQRPersonal(),
               chotKiemDich(),
            ],
          ),
        ),
      );
  }

  //Phần widget nhập thông tin
  Widget _buildQRPersonal(){
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: Column(
        //crossAxisAlignment:  CrossAxisAlignment.stretch,
        children: [
          _qrcheck==true?Text("Chưa có mã QR",textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),):
          QrImage(data: stringQrcode,padding: EdgeInsets.all(100),),
          Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
              child: TextField(
                style: TextStyle(fontSize: 16,color: Colors.black),
                decoration: InputDecoration(
                  labelText: "Họ và tên",
                ),
              )
          ),
          Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
              child: TextField(
                style: TextStyle(fontSize: 16,color: Colors.black),
                decoration: InputDecoration(
                  labelText: "Số CMND",

                  // border: OutlineInputBorder(
                  //     borderSide:
                  //     BorderSide(color: Colors.red,width: 1),
                  //     borderRadius: BorderRadius.all(Radius.circular(20))
                  // )
                ),
              )
          ),
          SelectState(
              onCountryChanged: (value){
                setState(() {
                  countryValue = value;
                });
              },
              onStateChanged: (value){
                setState(() {
                  stateValue= value;
                });
              },
              onCityChanged: (value){
                setState(() {
                  cityValue=value;
                });
              }
          ),
          Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: TextField(
                style: TextStyle(fontSize: 16,color: Colors.black),
                decoration: InputDecoration(
                  labelText: "Những nơi đã đi qua trong 14 ngày",
                ),
              )
          ),
          genarateButton("Điền thông tin"),
        ],
      ),
    );
  }


  Widget chotKiemDich(){
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:<Widget> [
          Text(
            "Result",
            style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Text(
            "qrCodeResult",
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
            onPressed: () async  {
              String codeSanner = await FlutterBarcodeScanner.scanBarcode(
                  '#ff6666', 'Cancel', true, ScanMode.QR);    //barcode scnner
              setState(() {
                qrCodeResult = codeSanner;
              });
            },
            child: Text(
              "Quét mã QR",
              style:
              TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.blue, width: 3.0),
                borderRadius: BorderRadius.circular(20.0)),
          )

        ],
      ),
    );
  }




  Widget genarateButton(String text){
    return FlatButton(
      padding: EdgeInsets.all(13.0),
      child: Text(text),
      onPressed: (){
        setState(() {
          _qrcheck=false;
        });
      },
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0,),side: BorderSide(color: Colors.blue,width: 3.0)
      ),
    );
  }
}


