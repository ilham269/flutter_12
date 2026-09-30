import 'package:flutter/material.dart';

class RowWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text("isi row 1"),
        Text("isi row 2"),
        Text("isi row 3"),
      ]
    );
  }
}