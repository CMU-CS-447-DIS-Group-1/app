import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(

          bottomNavigationBar: BottomAppBar(
            color: Colors.blue,
            child: TabBar(
              indicatorColor: Colors.redAccent,
              indicatorWeight: 4,
              tabs: [
                Tab(icon: Icon(Icons.home),text: "Trang chủ",),
                Tab(icon: Icon(Icons.map),text: "Bản đồ",),
                Tab(icon: Icon(Icons.notifications_none),text: "Thông báo",),
                Tab(icon: Icon(Icons.settings),text: "Cài đặt",),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child:Icon(Icons.qr_code),onPressed: (){} ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          ),
        );
  }
}

