import 'package:flutter/material.dart';

class ColumnWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text("isi column 1"),
        Text("isi column 2"),
        Text("isi column 3"),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("isi row 1"),
            Text("isi row 2"),
            Text("isi row 3"),
          ]
        ) 
      ]
    );
  }
}