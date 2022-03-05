import 'package:flutter/material.dart';
import 'package:multi_navigation_flutter/widgets.dart';

class ColorDetailsPage extends StatelessWidget {
  const ColorDetailsPage({
    Key? key,
    required this.color,
    required this.title,
    required this.materialIndex,
  }) : super(key: key);

  final MaterialColor color;
  final String title;
  final int materialIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: backButton,
        backgroundColor: color,
        title: Text(
          '$title[$materialIndex]',
          style: titleStyle,
        ),
      ),
      body: Container(
        color: color[materialIndex],
      ),
    );
  }
}
