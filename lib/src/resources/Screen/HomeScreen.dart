import 'package:app/src/resources/Screen/NhapThongTin.dart';
import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? countryValue;
  String? stateValue;
  String? cityValue;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          bottomNavigationBar: BottomAppBar(
            color: Colors.blueAccent,
            child: TabBar(
              indicatorWeight: 3,
              tabs: [
                Tab(icon: Icon(Icons.home),text: "Trang chủ",),
                Tab(icon: Icon(Icons.map),text: "Bản đồ",),
                Tab(icon: Icon(Icons.settings),text: "Cài đặt",),
              ],
              unselectedLabelColor: Colors.black54,
            ),
          ),
          body: TabBarView(
            children: [
              _btnDienThongTin(),
              Text("Trang chủ"),
              Text("Trang chủ"),
            ],
          ),
        ),
    );
  }
  Widget _buildQR(){
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
            child: TextField(
              style: TextStyle(fontSize: 16,color: Colors.black),
              decoration: InputDecoration(
                  labelText: "Họ và tên",
                  // border: OutlineInputBorder(
                  //     borderSide:
                  //     BorderSide(color: Colors.red,width: 1),
                  //     borderRadius: BorderRadius.all(Radius.circular(20))
                  // )
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
          QrImage(data: countryValue.toString(),
            size: 200,
          )
        ],
      ),
    );
  }
  Widget _btnDienThongTin(){
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
          child: SizedBox(
            width:  double.infinity,
            height: 53,
            child: RaisedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>NhapThongTin()));
              },
              child: Text(
                  "Nhập thông tin",
                  style: TextStyle(color: Colors.black,fontSize: 16)
              ),
              color: Colors.white,
            ),
          ),
        ),
    );
  }
}

