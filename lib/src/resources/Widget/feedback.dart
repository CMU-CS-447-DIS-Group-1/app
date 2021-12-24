import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class feedback extends StatefulWidget {
  const feedback({Key? key}) : super(key: key);

  @override
  _feedbackState createState() => _feedbackState();
}

class _feedbackState extends State<feedback> {
  TextEditingController name = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController title = new TextEditingController();
  TextEditingController message = new TextEditingController();
  String sucess="";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phản hồi'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
              child: TextField(
                controller: name,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    // border: OutlineInputBorder(
                    //   borderSide:
                    //       BorderSide(color: Colors.grey.shade400, width: 1),
                    //   borderRadius: BorderRadius.all(Radius.circular(10)),
                    // ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey.shade400, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    hintText: "Họ và tên"),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
              child: TextField(
                controller: email,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    // border: OutlineInputBorder(
                    //   borderSide:
                    //       BorderSide(color: Colors.grey.shade400, width: 1),
                    //   borderRadius: BorderRadius.all(Radius.circular(10)),
                    // ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey.shade400, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    hintText: "Email"),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
              child: TextField(
                controller: title,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    // border: OutlineInputBorder(
                    //   borderSide:
                    //       BorderSide(color: Colors.grey.shade400, width: 1),
                    //   borderRadius: BorderRadius.all(Radius.circular(10)),
                    // ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey.shade400, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    hintText: "Tiêu đề"),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
              child: TextField(
                controller: message,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    // border: OutlineInputBorder(
                    //   borderSide:
                    //       BorderSide(color: Colors.grey.shade400, width: 1),
                    //   borderRadius: BorderRadius.all(Radius.circular(10)),
                    // ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey.shade400, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    hintText: "Nội dung"),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
              child: FlatButton(
                  padding: EdgeInsets.all(0),
                  child: Text('Gửi phản hồi'),
                  onPressed: () {
                    sendEmail(
                      name: name.text,
                      email: email.text,
                      subject: title.text,
                      message: message.text,
                    );
                    setState(() {
                      sucess="Gửi thành công";
                    });
                  },
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                20.0,
              ),
                side: BorderSide(color: Colors.blue, width: 2.0)),),
            ),
            sucess==null?Center(child: Text("")):Center(child: Text(sucess,style: TextStyle(color: Colors.red)))
          ],
        ),
      ),
    );

  }
   sendEmail({
    required String name,
    required String email,
    required String subject,
    required String message,
  }) async {
    final serviceId = 'service_znbfvtd';
    final templateId = 'template_rvl7yni';
    final userId = 'user_ZEw0UMUd0Fx7hwRFsQtMh';
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(
      url,
      headers: {
        'origin': 'http://localhost',
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': userId,
        'template_params': {
          'user_name': name,
          'user_email': email,
          'user_subject': subject,
          'user_message': message,
        }
      }),
    );
  }
}
