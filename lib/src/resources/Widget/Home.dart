import 'dart:convert';

import 'package:app/src/resources/Widget/CustomAppBar.dart';
import 'package:app/src/resources/Widget/worldwidepanel.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';

class TrangChu extends StatefulWidget {
  const TrangChu({Key? key}) : super(key: key);

  @override
  _TrangChuState createState() => _TrangChuState();
}

class _TrangChuState extends State<TrangChu> {
  var worldData;
  fetchWorldWideData() async {
    http.Response response = await http.get('https://corona.lmao.ninja/v2/all');
    setState(() {
      worldData = json.decode(response.body);
    });
  }

  Future fetchData() async {
    fetchWorldWideData();
    print('fetchData called');
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(
    //       title: Center(
    //           child: Text('Blue Station')),
    //       backgroundColor: Colors.black54,
    //   ),
    //   body: RefreshIndicator(
    //     onRefresh: fetchData,
    //     child: SingleChildScrollView(
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: <Widget>[
    //             Padding(
    //               padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
    //               child: Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 children: <Widget>[
    //                   Text(
    //                     'VIỆT NAM',
    //                     style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //             worldData == null
    //                 ? Center(
    //               child: CircularProgressIndicator(),
    //             )
    //                 : WorldwidePanel(
    //               worldData: worldData,
    //             ),
    //           ],
    //         )),
    //   ),
    // );
    //}

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.yellow,
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/anhcovid.jpg"),fit: BoxFit.cover
              )
            ),
          ),
          backgroundColor: Colors.teal,
          bottom:  TabBar(
            indicator: BubbleTabIndicator(
                tabBarIndicatorSize: TabBarIndicatorSize.tab,
                indicatorHeight: 40.0,
                indicatorColor: Colors.white),
            labelColor: Colors.black,
            labelStyle: TextStyle(fontSize: 16),
            tabs: [
              Tab(text: "Việt Nam",),
              Tab(text: "Thế giới",),
            ],
            unselectedLabelColor: Colors.white,
          ),
          titleTextStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold) ,
          centerTitle: true,
          title: const Text("Số ca nhiễm"),
        ),
        body: TabBarView(
          children: [
            _buildVietNamTabBar(),
            _buildWorldTabBar(),
          ],
        ),
      ),
    );
  }

  Widget _buildVietNamTabBar() {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0,4),
                  blurRadius: 30,
                  color: Colors.grey,
                )
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:<Widget> [
                Counter(
                  color: Colors.red,
                  number: 1111,
                  tittle: "Chết",
                ),
                Counter(
                  color: Colors.red,
                  number: 1111,
                  tittle: "Chết",
                ),
                Counter(
                  color: Colors.red,
                  number: 1111,
                  tittle: "Chết",
                ),
                Counter(
                  color: Colors.red,
                  number: 1111,
                  tittle: "Chết",
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0,4),
                  blurRadius: 30,
                  color: Colors.grey,
                )
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:<Widget> [
                Counter(
                  color: Colors.red,
                  number: 1111,
                  tittle: "Chết",
                ),
                Counter(
                  color: Colors.red,
                  number: 1111,
                  tittle: "Chết",
                ),
                Counter(
                  color: Colors.red,
                  number: 1111,
                  tittle: "Chết",
                ),
                Counter(
                  color: Colors.red,
                  number: 1111,
                  tittle: "Chết",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildWorldTabBar() {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0,4),
                  blurRadius: 30,
                  color: Colors.grey,
                )
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:<Widget> [
                Counter(
                  color: Colors.red,
                  number: 1111,
                  tittle: "Chết",
                ),
                Counter(
                  color: Colors.red,
                  number: 1111,
                  tittle: "Chết",
                ),
                Counter(
                  color: Colors.red,
                  number: 1111,
                  tittle: "Chết",
                ),
                Counter(
                  color: Colors.red,
                  number: 1111,
                  tittle: "Chết",
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0,4),
                  blurRadius: 30,
                  color: Colors.grey,
                )
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:<Widget> [
                Counter(
                  color: Colors.red,
                  number: 1111,
                  tittle: "Chết",
                ),
                Counter(
                  color: Colors.red,
                  number: 1111,
                  tittle: "Chết",
                ),
                Counter(
                  color: Colors.red,
                  number: 1111,
                  tittle: "Chết",
                ),
                Counter(
                  color: Colors.red,
                  number: 1111,
                  tittle: "Chết",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Counter extends StatelessWidget {
  final int number;
  final Color color;
  final String tittle;
  const Counter({
    Key? key, required this.number, required this.color, required this.tittle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children:<Widget> [
        Container(
          padding: EdgeInsets.all(6),
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color.withOpacity(.26)
          ),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(
                color:  color,
                width: 2,
              )
            ),
          ),
        ),
        SizedBox(height: 10,),
        Text(
          "$number",
          style: TextStyle(
            fontSize: 20,
            color: color
          ),
        ),
        SizedBox(height: 10,),
        Text(tittle, style:TextStyle(fontSize: 12) ,)
      ],
    );
  }
}
