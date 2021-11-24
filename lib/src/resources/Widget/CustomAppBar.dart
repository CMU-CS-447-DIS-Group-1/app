import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(backgroundColor: Colors.deepPurple,);
  }
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);}
