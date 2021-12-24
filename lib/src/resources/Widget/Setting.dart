import 'package:app/src/resources/Screen/LoginHomePage.dart';
import 'package:app/src/resources/Widget/feedback.dart';
import 'package:app/src/resources/Widget/infoapp.dart';
import 'package:app/src/resources/fire_base/fire_base_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  FirAuth firAuth = new FirAuth();
  @override
  Widget build(BuildContext context) {
      return Container(
        color: Colors.amber.withOpacity(0.2),
        padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 50,
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => infoApp()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.info_rounded,
                      color: Colors.amber,
                    ),
                    SizedBox(width: 20,),
                    Center(
                      child:
                      Text("Thông tin về Blue Station",
                          style: TextStyle(color: Colors.white, fontSize: 16)),
                    ),
                  ],
                ),
                color: Colors.cyan,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              height: 50,
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => feedback()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.feedback,
                      color: Colors.pinkAccent,
                    ),
                    SizedBox(width: 20,),
                    Center(
                      child:
                      Text("Phản hồi",
                          style: TextStyle(color: Colors.white, fontSize: 16)),
                    ),

                  ],
                ),
                color: Colors.cyan,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              height: 50,
              child: RaisedButton(
                onPressed: () {
                  firAuth.logOut();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginHomePage()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                    SizedBox(width: 20,),
                    Center(
                      child:
                      Text("Đăng xuất",
                          style: TextStyle(color: Colors.white, fontSize: 16)),
                    ),
                  ],
                ),
                color: Colors.cyan,
              ),
            ),
          ],
        ),
      );
    }
  }
