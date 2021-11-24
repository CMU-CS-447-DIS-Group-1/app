import 'package:flutter/material.dart';
import 'package:gradient_text/gradient_text.dart';
import '';
class BottomNavigationItem{
  showItem(bool pageActive,String type,double sizeIcon){
    return BottomNavigationBarItem(
        icon: GradientText(type,
          gradient: LinearGradient(
            colors: pageActive? [Color(0xff2af598),Color(0xff22e4ac),Color(0xff1bd7bb),Color(0xff14c9cb),Color(0xff0fbed8),Color(0xff08b3e5)]:
                                [Color(0xffd8d8d8),Color(0xff939393)]
          ),
      style: TextStyle(fontFamily: 'iconpack',fontSize: sizeIcon),
      textAlign: TextAlign.center,
        )
    );
  }
}