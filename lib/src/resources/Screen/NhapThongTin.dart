import 'package:app/src/resources/Screen/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:qr_flutter/qr_flutter.dart';
class NhapThongTin extends StatefulWidget {
  const NhapThongTin({Key? key}) : super(key: key);

  @override
  _NhapThongTinState createState() => _NhapThongTinState();
}

class _NhapThongTinState extends State<NhapThongTin> {
  var countryValue;
  var stateValue;
  var cityValue;
  HomeScreen _homeScreen= new HomeScreen();
  TextEditingController name= new TextEditingController();
  TextEditingController cmmd= new TextEditingController();

  void dispose(){
    name.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body:SingleChildScrollView(
          padding: EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment:  CrossAxisAlignment.stretch,
            children: [
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                  child: TextField(
                    controller: name,
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
                    controller: cmmd,
                    style: TextStyle(fontSize: 16,color: Colors.black),
                    decoration: InputDecoration(
                      labelText: "Số CMND"
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
              genarateButton("Xác nhận",HomeScreen()),
              QrImage(data: "stringQr")
            ],
          ),
        )
      );
    }
  Widget genarateButton(String text, Widget widget){
    return FlatButton(
      padding: EdgeInsets.all(13.0),
      child: Text(text),
      onPressed: (){
        //Navigator.pop(context, MaterialPageRoute(builder: (context)=>widget));
        var stringQR=_homeScreen.getStringQR();
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0,),side: BorderSide(color: Colors.blue,width: 3.0)
      ),
    );
  }

}
