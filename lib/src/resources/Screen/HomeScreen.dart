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
//   TextEditingController name= new TextEditingController();
//   TextEditingController cmnd= new TextEditingController();
//   TextEditingController checkin= new TextEditingController();
//   TextEditingController WhereStart= new TextEditingController();
//   TextEditingController WhereEnd= new TextEditingController();
//
//   String? countryValue;
//   String? stateValue;
//   String? cityValue;
//   String _stringQrcode="";
//   bool _qrcheck=true;
//   String barcode = "";
//   String qrCodeResult="Chưa quét" ;
//   FirAuth firAuth= new FirAuth();
//   List gender=["Male","Female"];
//   String _selectedGender = 'male';
//   FirAuth firebase_auth= new FirAuth();
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
    // return DefaultTabController(
    //     length: 4,
    //     child: Scaffold(
    //       bottomNavigationBar: BottomAppBar(
    //         color: Colors.red,
    //         child: TabBar(
    //           indicatorColor: Colors.amber,
    //           labelPadding: EdgeInsets.symmetric(horizontal: 4.0),
    //           indicatorWeight: 3,
    //           tabs: [
    //             Tab(icon: Icon(Icons.home),text: "Trang chủ",),
    //             Tab(icon: Icon(Icons.map),text: "Bản đồ",),
    //             Tab(icon: Icon(Icons.qr_code_scanner),text:"Mã QR",),
    //             Tab(icon: Icon(Icons.settings),text: "Cài đặt",),
    //           ],
    //           unselectedLabelColor: Colors.black,
    //         ),
    //       ),
    //       body: TabBarView(
    //         children: [
    //            TrangChu(),
    //            tabmap(),
    //           _tabQR(),
    //           settingTab(),
    //         ],
    //       ),
    //     ),
    // );

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










  // Widget tabmap(){
  //   return MultiProvider(
  //     providers: [
  //       ChangeNotifierProvider(create: (context)=>LocationProvider(),
  //         child: map(),
  //       )
  //     ],
  //     child: MaterialApp(
  //       title: "MAP",
  //       home: map(),
  //     ),
  //   );
  // }

// xây dựng các thành phần trong QR
//   Widget _tabQR(){
//     return DefaultTabController(
//         length: 2,
//         child: Scaffold(
//           appBar: AppBar(
//             backgroundColor: Colors.red,
//
//             bottom: const TabBar(
//               labelStyle: TextStyle(fontSize: 16),
//               tabs: [
//                 Tab(text: "Cá nhân"),
//                 Tab(text: "Chốt kiểm dịch",),
//               ],
//               unselectedLabelColor: Colors.black,
//             ),
//             titleTextStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold) ,
//             centerTitle: true,
//             title: const Text("Mã QR"),
//           ),
//           body: TabBarView(
//             children: [
//               _buildQRPersonal(),
//                chotKiemDich(),
//             ],
//           ),
//         ),
//       );
//   }

  //Phần widget nhập thông tin
  // Widget _buildQRPersonal(){
  //   return Container(
  //     decoration: BoxDecoration(
  //         image: DecorationImage(
  //           image: AssetImage("assets/background2.jpg"),
  //           fit: BoxFit.cover,
  //           colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.1), BlendMode.dstATop),
  //         )
  //     ),
  //     child: SingleChildScrollView(
  //       padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         //crossAxisAlignment:  CrossAxisAlignment.stretch,
  //         children: [
  //           _qrcheck==true?Text("Chưa có mã QR",textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),):
  //           QrImage(data: _stringQrcode,padding: EdgeInsets.all(100),),
  //           Padding(
  //               padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
  //               child: TextField(
  //                 controller: name,
  //                 style: TextStyle(fontSize: 16,color: Colors.black),
  //                 decoration: InputDecoration(
  //                     labelText: "Họ và tên",
  //                     labelStyle: TextStyle(fontSize: 16,color: Colors.black),
  //                     enabledBorder: UnderlineInputBorder(
  //                       borderSide: BorderSide(color: Colors.black12),
  //                     ),
  //
  //                   // border: OutlineInputBorder(
  //                     //     borderSide:
  //                     //     BorderSide(color: Colors.red,width: 1),
  //                     //     borderRadius: BorderRadius.all(Radius.circular(30))
  //                     // )
  //                 ),
  //               )
  //           ),
  //           Row(
  //               children: [
  //                 Expanded(
  //                   child: ListTile(
  //                     leading: Radio(
  //                       value: 'male',
  //                       groupValue: _selectedGender,
  //                       onChanged: (value) {
  //                         setState(() {
  //                           _selectedGender = value as String;
  //                         });
  //                       },
  //                     ),
  //                     title: Text('Nam'),
  //                   ),
  //                 ),
  //                 Expanded(
  //                   child: ListTile(
  //                     leading: Radio(
  //                       value: 'female',
  //                       groupValue: _selectedGender,
  //                       onChanged: (value) {
  //                         setState(() {
  //                           _selectedGender = value as String;
  //                         });
  //                       },
  //                     ),
  //                     title: Text('Nữ'),
  //                   ),
  //                 ),
  //               ],
  //           ),
  //
  //
  //           Padding(
  //               padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
  //               child: TextField(
  //                 controller: cmnd,
  //                 style: TextStyle(fontSize: 16,color: Colors.black),
  //                 decoration: InputDecoration(
  //                   labelText: "Số CMND/CCCD", labelStyle: TextStyle(fontSize: 16,color: Colors.black),
  //                   enabledBorder: UnderlineInputBorder(
  //                     borderSide: BorderSide(color: Colors.black12),
  //                   ),
  //                   // border: OutlineInputBorder(
  //                   //     borderSide:
  //                   //     BorderSide(color: Colors.red,width: 1),
  //                   //     borderRadius: BorderRadius.all(Radius.circular(30))
  //                   // )
  //                 ),
  //               )
  //           ),
  //
  //           SelectState(
  //               onCountryChanged: (value){
  //                 setState(() {
  //                   countryValue = value;
  //                 });
  //               },
  //               onStateChanged: (value){
  //                 setState(() {
  //                   stateValue= value;
  //                 });
  //               },
  //               onCityChanged: (value){
  //                 setState(() {
  //                   cityValue=value;
  //                 });
  //               }
  //           ),
  //           Padding(
  //               padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
  //               child: TextField(
  //                 controller: WhereStart,
  //                 style: TextStyle(fontSize: 16,color: Colors.black),
  //                 decoration: InputDecoration(
  //                   labelText: "Nơi đi",
  //                     labelStyle: TextStyle(fontSize: 16,color: Colors.black),
  //                     enabledBorder: UnderlineInputBorder(
  //                         borderSide: BorderSide(color: Colors.black12),
  //                     ),
  //                 ),
  //               )
  //           ),
  //           Padding(
  //               padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
  //               child: TextField(
  //                 controller: WhereEnd,
  //                 style: TextStyle(fontSize: 16,color: Colors.black),
  //                 decoration: InputDecoration(
  //                   labelText: "Nơi đến",
  //                   labelStyle: TextStyle(fontSize: 16,color: Colors.black),
  //                   enabledBorder: UnderlineInputBorder(
  //                     borderSide: BorderSide(color: Colors.black12),
  //                   ),
  //                 ),
  //               )
  //           ),
  //           genarateButton("Điền thông tin"),
  //         ],
  //       ),
  //     ),
  //   );
  // }


  // Widget chotKiemDich(){
  //   return Container(
  //
  //     padding: EdgeInsets.all(20.0),
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       crossAxisAlignment: CrossAxisAlignment.stretch,
  //       children:<Widget> [
  //         Text(
  //           "Thông tin người đi đường",
  //           style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
  //           textAlign: TextAlign.center,
  //         ),
  //         Text(
  //           "",
  //           style: TextStyle(
  //             fontSize: 20.0,
  //           ),
  //           textAlign: TextAlign.center,
  //         ),
  //         SizedBox(
  //           height: 20.0,
  //         ),
  //         FlatButton(
  //           padding: EdgeInsets.all(15.0),
  //           onPressed: () async  {
  //             String codeSanner = await FlutterBarcodeScanner.scanBarcode(
  //                 '#ff6666', 'Cancel', true, ScanMode.QR);    //barcode scnner
  //             setState(() {
  //               qrCodeResult = codeSanner;
  //             });
  //           },
  //           child: Text(
  //             "Quét mã QR",
  //             style:
  //             TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
  //           ),
  //           shape: RoundedRectangleBorder(
  //               side: BorderSide(color: Colors.blue, width: 3.0),
  //               borderRadius: BorderRadius.circular(20.0)),
  //         )
  //
  //       ],
  //     ),
  //   );
  // }




  // Widget genarateButton(String text){
  //   return FlatButton(
  //     padding: EdgeInsets.all(13.0),
  //     child: Text(text),
  //     onPressed: (){
  //       setState(() {
  //         _qrcheck=false;
  //         _stringQrcode="Họ và tên: "+name.text+"\n"+"Số CMND/CCCD: "+cmnd.text+"\n"+"Địa chỉ: "+cityValue.toString()+" "+stateValue.toString()+" "+countryValue.toString()+"\n"+"Những nơi đã đi qua: "+checkin.text;
  //         firebase_auth.data(name.text, _selectedGender, cmnd.text, cityValue.toString()+" "+stateValue.toString()+" "+countryValue.toString(), WhereStart.text, WhereEnd.text);
  //       });
  //
  //     },
  //     shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(20.0,),side: BorderSide(color: Colors.blue,width: 3.0)
  //     ),
  //   );
  // }




  //widget Setting
  // Widget settingTab(){
  //   return Center(
  //     child: Container(
  //       width:  300,
  //       height: 50,
  //       child: RaisedButton(
  //         onPressed: (){
  //           firAuth.logOut();
  //           Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginHomePage()));
  //         },
  //         child: Text(
  //             "Đăng xuất",
  //             style: TextStyle(color: Colors.white,fontSize: 16)
  //         ),
  //         color: Colors.red,
  //       ),
  //     ),
  //   );
  // }

}



