import 'package:flutter/material.dart';
import 'package:multi_navigation_flutter/widgets.dart';

class ColorsListPage extends StatelessWidget {
  ColorsListPage({
    Key? key,
    required this.color,
    required this.title,
    required this.onPush,
  }) : super(key: key);

  final MaterialColor color;
  final String title;
  final ValueChanged<int> onPush;

  final List<int> materialIndices = [
    900,
    800,
    700,
    600,
    500,
    400,
    300,
    200,
    100,
    50
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: titleStyle,
        ),
        backgroundColor: color,
      ),
      body: Container(
        color: Colors.white,
        child: _buildList(),
      ),
    );
  }

  Widget _buildList() {
    return ListView.builder(
      itemCount: materialIndices.length,
      itemBuilder: (BuildContext context, int index) {
        int materialIndex = materialIndices[index];

        return Container(
          color: color[materialIndex],
          child: ListTile(
            title:
                Text('$materialIndex', style: const TextStyle(fontSize: 24.0)),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => onPush(materialIndex),
          ),
        );
      },
    );
  }
}
