// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

Widget scoreCard(String title, String info) {
  return Expanded(
    child: Container(
      margin: EdgeInsets.all(20.0),
      padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 26.0),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12.0)),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Play',
                fontSize: 22.0),
          ),
          SizedBox(
            height: 6.0,
          ),
          Text(
            info,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Play',
                fontSize: 32.0),
          )
        ],
      ),
    ),
  );
}
