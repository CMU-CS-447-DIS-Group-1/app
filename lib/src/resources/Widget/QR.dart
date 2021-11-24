import 'package:app/src/resources/fire_base/fire_base_auth.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';
class QR extends StatefulWidget {
  const QR({Key? key}) : super(key: key);

  @override
  _QRState createState() => _QRState();
}

class _QRState extends State<QR> {
  TextEditingController name= new TextEditingController();
  TextEditingController cmnd= new TextEditingController();
  TextEditingController checkin= new TextEditingController();
  TextEditingController WhereStart= new TextEditingController();
  TextEditingController WhereEnd= new TextEditingController();

  String? countryValue;
  String? stateValue;
  String? cityValue;
  String _stringQrcode="";
  bool _qrcheck=true;
  String barcode = "";
  String qrCodeResult="Chưa quét" ;
  FirAuth firAuth= new FirAuth();
  List gender=["Male","Female"];
  String _selectedGender = 'male';
  FirAuth firebase_auth= new FirAuth();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          bottom:  TabBar(
            indicator: BubbleTabIndicator(
                tabBarIndicatorSize: TabBarIndicatorSize.tab,
                indicatorHeight: 40.0,
                indicatorColor: Colors.white),
            labelColor: Colors.black,
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
    );;
  }
  Widget _buildQRPersonal(){
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background2.jpg"),
            fit: BoxFit.cover,
            colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.1), BlendMode.dstATop),
          )
      ),
      child: SingleChildScrollView(
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
                  controller: WhereStart,
                  style: TextStyle(fontSize: 16,color: Colors.black),
                  decoration: InputDecoration(
                    labelText: "Nơi đi",
                    labelStyle: TextStyle(fontSize: 16,color: Colors.black),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black12),
                    ),
                  ),
                )
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: TextField(
                  controller: WhereEnd,
                  style: TextStyle(fontSize: 16,color: Colors.black),
                  decoration: InputDecoration(
                    labelText: "Nơi đến",
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
          _stringQrcode="Họ và tên: "+name.text+"\n"+"Số CMND/CCCD: "+cmnd.text+"\n"+"Địa chỉ: "+cityValue.toString()+" "+stateValue.toString()+" "+countryValue.toString()+"\n"+"Những nơi đã đi qua: "+checkin.text;
          firebase_auth.data(name.text, _selectedGender, cmnd.text, cityValue.toString()+" "+stateValue.toString()+" "+countryValue.toString(), WhereStart.text, WhereEnd.text);
        });

      },
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0,),side: BorderSide(color: Colors.blue,width: 3.0)
      ),
    );
  }
}
