import 'package:flutter/material.dart';
import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:qr_flutter/qr_flutter.dart';
class NhapThongTin extends StatefulWidget {
  const NhapThongTin({Key? key}) : super(key: key);

  @override
  _NhapThongTinState createState() => _NhapThongTinState();
}

class _NhapThongTinState extends State<NhapThongTin> {
  String? countryValue;
  String? stateValue;
  String? cityValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body:SingleChildScrollView(
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
        )
      );
    }
}
