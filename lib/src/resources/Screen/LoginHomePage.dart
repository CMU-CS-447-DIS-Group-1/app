import 'package:app/src/resources/Screen/HomeScreen.dart';
import 'package:app/src/resources/Screen/RegisterPage.dart';
import 'package:app/src/resources/auth_blocs/auth_blocs.dart';
import 'package:flutter/material.dart';
class LoginHomePage extends StatefulWidget {
  const LoginHomePage({Key? key}) : super(key: key);

  @override
  _LoginHomePageState createState() => _LoginHomePageState();
}

class _LoginHomePageState extends State<LoginHomePage> {
  Auth_blocs auth_blocs= new Auth_blocs();
  TextEditingController _phoneNumberController= new TextEditingController();
  @override
  void dispose(){
    auth_blocs.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomLeft,
              colors: [
                Colors.lightGreenAccent,
                Colors.deepPurpleAccent
              ],
            )
        ),
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        constraints: BoxConstraints.expand(),
        //color: Colors.white,
        child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Image.asset('logo.jpg'),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: StreamBuilder(
                    stream: auth_blocs.phoneStream,
                    builder: (context, snapshot) {
                      return TextField(
                        controller: _phoneNumberController,
                          style: TextStyle(fontSize: 16,color: Colors.black),
                        decoration: InputDecoration(
                            errorText: snapshot.hasError ? snapshot.error.toString(): null,
                            labelText: "Enter your phone number",
                            prefixIcon: Icon(Icons.phone),
                            border: OutlineInputBorder(
                            borderSide:
                              BorderSide(color: Colors.red,width: 1),
                              borderRadius: BorderRadius.all(Radius.circular(20))
                          )
                        )
                      );
                    }
                  ),
                ),


                Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: SizedBox(
                    width:  double.infinity,
                    height: 53,
                    child: RaisedButton(
                      onPressed: (){
                        var isPhoneNumber= auth_blocs.isValidPhoneNumber(_phoneNumberController.text);
                        if(isPhoneNumber){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                        }
                      },
                      child: Text(
                        "Đăng nhập",
                        style: TextStyle(color: Colors.white,fontSize: 16)
                      ),
                      color: Colors.blue,
                    ),
                  ),
                ),



                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: SizedBox(
                    width:  double.infinity,
                    height: 53,
                    child: RaisedButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterPage()));
                      },
                      child: Text(
                          "Đăng kí",
                          style: TextStyle(color: Colors.black,fontSize: 16)
                      ),
                      color: Colors.white,
                    ),
                  ),
                ),



              ],
            )
        ),
      ),
    );
  }
  _loginClick(){
    var isPhoneNumber= auth_blocs.isValidPhoneNumber(_phoneNumberController.text);
    if(isPhoneNumber){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
    }
  }
}
