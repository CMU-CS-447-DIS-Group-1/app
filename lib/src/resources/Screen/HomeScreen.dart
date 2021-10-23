import 'package:app/src/resources/Screen/LoginHomePage.dart';
import 'package:app/src/resources/Widget/Map.dart';
import 'package:app/src/resources/fire_base/fire_base_auth.dart';
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
  // //tao method lay string cua class
  getStringQRcode()=> createState()._stringQrcode;
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController name= new TextEditingController();
  TextEditingController cmnd= new TextEditingController();
  String? countryValue;
  String? stateValue;
  String? cityValue;
  String _stringQrcode="";
  bool _qrcheck=true;
  String barcode = "";
  String qrCodeResult="Chưa quét" ;
  FirAuth firAuth= new FirAuth();




  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          bottomNavigationBar: BottomAppBar(
            color: Colors.blue,
            child: TabBar(
              indicatorColor: Colors.white,
              indicatorWeight: 1,
              tabs: [
                Tab(icon: Icon(Icons.home),text: "Trang chủ",),
                Tab(icon: Icon(Icons.map),text: "Bản đồ",),
                Tab(icon: Icon(Icons.qr_code_scanner),text:"Mã QR",),
                Tab(icon: Icon(Icons.settings),text: "Cài đặt",),
              ],
              unselectedLabelColor: Colors.black,
            ),
          ),
          body: TabBarView(
            children: [
              Text("Trang chủ"),
               map(),
              _tabQR(),
              settingTab(),
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
            iconTheme: IconThemeData(color: Colors.red),
            bottom: const TabBar(
              labelStyle: TextStyle(fontSize: 16),
              tabs: [
                Tab(text: "Cá nhân"),
                Tab(text: "Chốt kiểm dịch",),
              ],
              unselectedLabelColor: Colors.black,
            ),
            titleTextStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold) ,
            centerTitle: true,
            title: const Text("Mã QR"),
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
      padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //crossAxisAlignment:  CrossAxisAlignment.stretch,
        children: [
          _qrcheck==true?Text("Chưa có mã QR",textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),):
          QrImage(data: _stringQrcode,padding: EdgeInsets.all(100),),
          Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: TextField(
                controller: name,
                style: TextStyle(fontSize: 16,color: Colors.black),
                decoration: InputDecoration(
                    labelText: "Họ và tên",
                    labelStyle: TextStyle(fontSize: 16,color: Colors.black),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black12),
                    ),

                  // border: OutlineInputBorder(
                    //     borderSide:
                    //     BorderSide(color: Colors.red,width: 1),
                    //     borderRadius: BorderRadius.all(Radius.circular(30))
                    // )
                ),
              )
          ),
          Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: TextField(
                controller: cmnd,
                style: TextStyle(fontSize: 16,color: Colors.black),
                decoration: InputDecoration(
                  labelText: "Số CMND/CCCD", labelStyle: TextStyle(fontSize: 16,color: Colors.black),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black12),
                  ),
                  // border: OutlineInputBorder(
                  //     borderSide:
                  //     BorderSide(color: Colors.red,width: 1),
                  //     borderRadius: BorderRadius.all(Radius.circular(30))
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
                    labelStyle: TextStyle(fontSize: 16,color: Colors.black),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black12),
                    ),
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
          _stringQrcode="Name: "+name.text+"\n"+"CMND: "+cmnd.text+"\n"+"Address: "+cityValue.toString()+" "+stateValue.toString()+" "+countryValue.toString();
        });
      },
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0,),side: BorderSide(color: Colors.blue,width: 3.0)
      ),
    );
  }




  //widget Setting
  Widget settingTab(){
    return Center(
      child: Container(
        width:  300,
        height: 50,
        child: RaisedButton(
          onPressed: (){
            firAuth.logOut();
            Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginHomePage()));
          },
          child: Text(
              "Đăng xuất",
              style: TextStyle(color: Colors.white,fontSize: 16)
          ),
          color: Colors.red,
        ),
      ),
    );
  }
}


