import 'package:app/src/resources/Screen/LoginHomePage.dart';
import 'package:app/src/resources/fire_base/fire_base_auth.dart';
import 'package:flutter/material.dart';
class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  FirAuth firAuth= new FirAuth();
  @override
  Widget build(BuildContext context) {
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
                color: Colors.cyan,
              ),
            ),
          );
  }
}
