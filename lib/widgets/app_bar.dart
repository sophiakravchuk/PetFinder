

import 'package:flutter/material.dart';

Widget myAppBar(String title) {
  return
    AppBar(
      automaticallyImplyLeading: false,
      title:
      Padding(
        padding: EdgeInsets.only(top: 15),
        child: Text(
          title,
          style: TextStyle(
            color: Color(0xFF000033),
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      centerTitle: true,
      backgroundColor: Color(0xFF63B4FF),
      elevation: 0,
    );
}