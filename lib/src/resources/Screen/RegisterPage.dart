import 'package:app/src/resources/Screen/kiemdich/homeKiemDich.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'HomeScreen.dart';
class kiemDichPage extends StatefulWidget {
  const kiemDichPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<kiemDichPage> {
  var final_auth= FirebaseAuth.instance;
  TextEditingController tendangnhap= new TextEditingController();
  TextEditingController password= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chốt kiểm dịch"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
          constraints: BoxConstraints.expand(),
          //color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children:<Widget> [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: TextField(style: TextStyle(fontSize: 16,color: Colors.black),
                      controller: tendangnhap,
                      decoration: InputDecoration(
                          labelText: "Tên đăng nhập",
                          prefixIcon: Icon(Icons.account_circle),
                          border: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.black12,width: 1),
                              borderRadius: BorderRadius.all(Radius.circular(20))
                          )
                      )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                  child: TextField(style: TextStyle(fontSize: 16,color: Colors.black),
                      controller: password,
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: "Mật khẩu",
                          prefixIcon: Icon(Icons.lock),
                          border: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.black12,width: 1),
                              borderRadius: BorderRadius.all(Radius.circular(20))
                          )
                      )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                  child: SizedBox(
                    width:  double.infinity,
                    height: 53,
                    child: RaisedButton(
                      onPressed: () async{
                        try{
                          await FirebaseAuth.instance
                              .signInWithEmailAndPassword(email: tendangnhap.text, password: password.text)
                              .then((value) => {
                            if(value.user!=null){
                              Navigator.of(context).push(MaterialPageRoute(builder: (c)=>HomeKiemDich()))
                            }
                          });

                        }
                        catch(e){
                          FocusScope.of(context).unfocus();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Tài khoản hoặc mật khẩu không đúng"),
                              duration: Duration(seconds: 3),
                            ),
                          );
                        }



                      },
                      child: Text(
                          "Đăng nhập",
                          style: TextStyle(color: Colors.white,fontSize: 16)
                      ),
                      color: Colors.cyan,
                    ),
                  ),
                ),
              ],
            ),
          )
        ),
      ),
    );
  }
}
