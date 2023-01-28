// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

class ContainerBox extends StatelessWidget {
  const ContainerBox({super.key, required this.boxColor, this.childWidget});

  final Color boxColor;
  final Widget? childWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: childWidget,
      margin: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: boxColor,
      ),
    );
  }
}
