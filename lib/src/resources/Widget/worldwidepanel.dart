import 'package:flutter/material.dart';
class WorldwidePanel extends StatelessWidget {
  const WorldwidePanel({Key? key, required this.worldData}) : super(key: key);
  final Map worldData;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 2),
        children: <Widget>[
          StatusPanel(
            title: 'Tổng ca nhiễm',
            panelColor: Colors.red,
            textColor: Colors.black,
            count: worldData['cases'].toString(),
          ),
          StatusPanel(
            title: 'ACTIVE',
            panelColor: Colors.blue,
            textColor: Colors.black,
            count: worldData['active'].toString(),
          ),
          StatusPanel(
            title: 'RECOVERED',
            panelColor: Colors.green,
            textColor: Colors.black,
            count: worldData['recovered'].toString(),
          ),
          StatusPanel(
            title: 'DEATHS',
            panelColor: Colors.grey,
            textColor: Colors.black,
            count: worldData['deaths'].toString(),
          ),
        ],
      ),
    );
  }
}
class StatusPanel extends StatelessWidget {
  const StatusPanel({Key? key, required this.panelColor, required this.textColor, required this.title, required this.count}) : super(key: key);
  final Color panelColor;
  final Color textColor;
  final String title;
  final String count;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(10),
      height: 90,
      width: width / 2,
      // color: panelColor,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: panelColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16, color: textColor),
          ),
          Text(
            count,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: textColor),
          )
        ],
      ),
    );
  }
}

