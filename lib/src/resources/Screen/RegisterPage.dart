import 'package:flutter/material.dart';
class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Đăng kí"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("background.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        constraints: BoxConstraints.expand(),
        //color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children:<Widget> [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: TextField(style: TextStyle(fontSize: 16,color: Colors.black),
                    decoration: InputDecoration(
                        labelText: "Họ và tên",
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
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: TextField(style: TextStyle(fontSize: 16,color: Colors.black),
                    decoration: InputDecoration(
                        labelText: "Địa chỉ",
                        prefixIcon: Icon(Icons.account_circle),
                        border: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.black12,width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(20))
                        )
                    )
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}
