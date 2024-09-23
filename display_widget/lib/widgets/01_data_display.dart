// widgets/01_data_display.dart

import 'package:flutter/material.dart';

ListView dataDisplayPage() {
  return ListView(children: [
    // Text Widget
    Text(
      'This is Text',
      style: TextStyle(
        color: Colors.orangeAccent,
        fontSize: 30,
        backgroundColor: Colors.black,
      ),
      textAlign: TextAlign.right,
    ),
    // ImageView
    Image.asset('images/flower.jpg'),

    // IconWidget
    Icon(
      Icons.favorite,
      color: Colors.pink,
      size: 50,
    ),
    Icon(
      Icons.access_alarm,
      color: Colors.green,
      size: 50,
    ),
  ]);
}
