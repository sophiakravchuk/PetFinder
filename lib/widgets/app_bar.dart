

import 'package:flutter/material.dart';

Widget myAppBar(String title) {
  return
    AppBar(
      title:
      Padding(
        padding: EdgeInsets.only(top: 15),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.green,
      elevation: 0,
    );
}