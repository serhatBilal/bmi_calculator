import 'package:flutter/material.dart';

class DataContainer extends StatelessWidget {
  static const textStyle1 = TextStyle(
    color: Color(0xFFffffff),
    fontSize: 20.0,
  );

  static const textStyle2 = TextStyle(
      color: Color(0xFFffffff), fontSize: 60.0, fontWeight: FontWeight.w900);

  static const textStyle3 = TextStyle(
    color: Color(0xFFffffff),
    fontSize: 30.0,
  );

  const DataContainer({super.key, required this.icon, required this.title});

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      // ignore: prefer_const_literals_to_create_immutables
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
          color: Colors.white,
        ),
        // ignore: prefer_const_constructors
        SizedBox(height: 15.0),
        Text(
          title,
          // ignore: prefer_const_constructors
          style: TextStyle(
            color: const Color(0xFF000000),
            fontSize: 20.0,
          ),
        ),
      ],
    );
  }
}
