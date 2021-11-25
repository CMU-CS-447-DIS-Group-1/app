import 'dart:convert';
//import 'dart:html';

import 'package:app/src/resources/Widget/CustomAppBar.dart';
import 'package:app/src/resources/Widget/worldwidepanel.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';

import 'Loading.dart';

class TrangChu extends StatefulWidget {
  const TrangChu({Key? key}) : super(key: key);

  @override
  _TrangChuState createState() => _TrangChuState();
}

class _TrangChuState extends State<TrangChu> {
  var worldData;
  var vietnamData;
  fetchWorldWideData() async {
    http.Response response = await http.get('https://corona.lmao.ninja/v2/all');
    setState(() {
      worldData = json.decode(response.body);
    });
  }

  fetchVietNamData() async {
    http.Response response =
        await http.get('https://corona.lmao.ninja/v2/countries/vn?sort=cases');
    setState(() {
      vietnamData = json.decode(response.body);
    });
  }

  Future fetchData() async {
    fetchWorldWideData();
    fetchVietNamData();
    print('fetchData called');
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.yellow,
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/anhcovid.jpg"),
                    fit: BoxFit.cover)),
          ),
          backgroundColor: Colors.teal,
          bottom: TabBar(
            indicator: BubbleTabIndicator(
                tabBarIndicatorSize: TabBarIndicatorSize.tab,
                indicatorHeight: 40.0,
                indicatorColor: Colors.white),
            labelColor: Colors.black,
            labelStyle: TextStyle(fontSize: 16),
            tabs: [
              Tab(
                text: "Việt Nam",
              ),
              Tab(
                text: "Thế giới",
              ),
            ],
            unselectedLabelColor: Colors.white,
          ),
          titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          centerTitle: true,
          title: const Text("Số ca nhiễm"),
        ),
        body: TabBarView(
          children: [
            vietnamData == null
                ? Loading()
                : _buildVietNamTabBar(),
            worldData == null
                ? Loading()
                : _buildWorldTabBar(),
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
            padding: EdgeInsets.all(20),
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.cyan.withOpacity(.09),
                borderRadius: BorderRadius.all(Radius.circular(50))),
            child: Wrap(
              runSpacing: 20,
              spacing: 20,
              children: <Widget>[
                infoCard(
                  title: "Tổng số ca nhiễm",
                  infor: vietnamData["cases"].toString(),
                  color: Colors.red,
                ),
                infoCard(
                  title: "Tổng số ca hồi phục",
                  infor: vietnamData["recovered"].toString(),
                  color: Colors.green,
                ),
                infoCard(
                  title: "Tử vong",
                  infor: vietnamData["deaths"].toString(),
                  color: Colors.black,
                ),
                infoCard(
                  title: "Số ca hôm nay",
                  infor: vietnamData["todayCases"].toString(),
                  color: Colors.orangeAccent,
                )
              ],
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children:<Widget> [
                Text("THÔNG ĐIỆP 5K",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:<Widget> [
                    Column(
                      children:<Widget> [
                        Column(
                          children: [
                            Container(
                                width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/mask.png'),
                                  fit: BoxFit.cover
                                )
                              ),
                            ),
                            Text("Khẩu trang")
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/khaibaoyte.png'),
                                  fit: BoxFit.cover
                              )
                          ),
                        ),
                        Text("Khai báo y tế")
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/khoangcach.jpg'),
                                  fit: BoxFit.cover
                              )
                          ),
                        ),
                        Text("Khoảng cách")
                      ],
                    )
                  ],
                ),
                SizedBox(height: 40,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:<Widget> [
                    Column(
                      children:<Widget> [
                        Column(
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('assets/people.png'),
                                      fit: BoxFit.cover
                                  )
                              ),
                            ),
                            Text("Không tụ tập")
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/washhands.png'),
                                  fit: BoxFit.cover
                              )
                          ),
                        ),
                        Text("Khử khuẩn")
                      ],
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildWorldTabBar() {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.blue.withOpacity(.09),
                borderRadius: BorderRadius.all(Radius.circular(50))),
            child: Wrap(
              runSpacing: 20,
              spacing: 20,
              children: <Widget>[
                infoCard(
                  title: "Tổng số ca nhiễm",
                  infor: worldData["cases"].toString(),
                  color: Colors.red,
                ),
                infoCard(
                  title: "Tổng số ca hồi phục",
                  infor: worldData["recovered"].toString(),
                  color: Colors.green,
                ),
                infoCard(
                  title: "Tử vong",
                  infor: worldData["deaths"].toString(),
                  color: Colors.black,
                ),
                infoCard(
                  title: "Số ca hôm nay",
                  infor: worldData["todayCases"].toString(),
                  color: Colors.orangeAccent,
                )
              ],
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children:<Widget> [
                Text("THÔNG ĐIỆP 5K",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:<Widget> [
                    Column(
                      children:<Widget> [
                        Column(
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('assets/mask.png'),
                                      fit: BoxFit.cover
                                  )
                              ),
                            ),
                            Text("Khẩu trang")
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/khaibaoyte.png'),
                                  fit: BoxFit.cover
                              )
                          ),
                        ),
                        Text("Khai báo y tế")
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/khoangcach.jpg'),
                                  fit: BoxFit.cover
                              )
                          ),
                        ),
                        Text("Khoảng cách")
                      ],
                    )
                  ],
                ),
                SizedBox(height: 40,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:<Widget> [
                    Column(
                      children:<Widget> [
                        Column(
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('assets/people.png'),
                                      fit: BoxFit.cover
                                  )
                              ),
                            ),
                            Text("Không tụ tập")
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/washhands.png'),
                                  fit: BoxFit.cover
                              )
                          ),
                        ),
                        Text("Khử khuẩn")
                      ],
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class infoCard extends StatelessWidget {
  final String title;
  final Color color;
  final String infor;
  const infoCard(
      {Key? key, required this.color, required this.infor, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        width: constraints.maxWidth / 2 - 10,
        decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8)),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 14, color: color),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: RichText(
                      text: TextSpan(
                    style: TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                          text: infor,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  )),
                ),
              ],
            )
          ],
        ),
      );
    });
  }
}
