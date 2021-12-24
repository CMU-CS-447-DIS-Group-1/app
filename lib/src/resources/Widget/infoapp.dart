import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
class infoApp extends StatefulWidget {
  const infoApp({Key? key}) : super(key: key);

  @override
  _infoAppState createState() => _infoAppState();
}

class _infoAppState extends State<infoApp> {
  String content="Blue Station-BS là một ứng dụng thu thập thông tin từ những người cần đi lại trong thành phố để mua thực phẩm và các nguồn cung cấp thiết yếu khác trong thời gian cách ly Covid và sẽ cung cấp cho mọi người một mã QR được coi như E-Pass để đăng ký tại mỗi lần kiểm dịch. trạm.";
  String content2='E-Pass này có thể giúp nhân viên kiểm tra tại mỗi trạm kiểm dịch có thể thu thập thông tin về người đi đường và có thể quyết định xem người đi đường có được phép đi qua trạm đó hay không dựa trên thông tin họ có.';
  String content3='Với các gợi ý về quy trình thông minh, BS có thể giúp những người đi đường tìm ra quy trình tốt nhất xung quanh thành phố để tránh khu vực màu đỏ hoặc khu vực màu vàng từ điểm xuất phát đến điểm họ muốn đi.';
  String content4='Kể từ khi đại dịch Covid xảy ra, nó đã tác động mạnh đến cuộc sống hàng ngày của người dân và gây ra rất nhiều phiền toái cho những người đi đường quanh thành phố vì ưu tiên của chúng tôi trong việc giảm thiểu tác động của Covid là giảm thiểu sự tiếp xúc giữa mọi người. Do đó, chính phủ đã cố gắng hết sức để giảm thiểu lượng người đi lại trong thành phố cùng lúc, vì vậy họ chỉ cho phép những người có giấy phép đi lại như một tờ giấy và đưa nó cho nhân viên kiểm tra của mỗi trạm để xin phép đi du lịch khắp nơi.';
  String content5='Tuy nhiên, việc xuất trình giấy phép đi lại tại mỗi trạm kiểm dịch cho mỗi lần bạn đi lại vẫn không phải là giải pháp tốt nhất trong lúc này. Để giải quyết vấn đề này, dựa trên kiến ​​thức của chúng tôi về kiểm dịch. Ứng dụng này có thể cung cấp một giải pháp thay thế cách làm thủ tục giấy tờ thông thường. Mã QR sẽ chứa tất cả các thông tin cần thiết của mỗi người đi đường để người kiểm tra tại mỗi trạm làm việc. Một mã QR đơn giản có thể thay thế tất cả những thứ bằng giấy khác.';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Thông tin về Blue Station"),backgroundColor: Colors.amber,),
      body: Container(
        color: Colors.orange[100],
        child:
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 100,
                  color: Colors.orange[100],
                  child: Text(content,style:TextStyle(color:Colors.orange[800],fontWeight: FontWeight.bold) ,),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 100,
                  color: Colors.orange[100],
                  child: Text(content2,style:TextStyle(color:Colors.orange[800],fontWeight: FontWeight.bold) ,),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 100,
                  color: Colors.orange[100],
                  child: Text(content3,style:TextStyle(color:Colors.orange[800],fontWeight: FontWeight.bold) ,),
                ),
              ],
            )
      ),
    );

  }
}
