import 'package:flutter/material.dart';

class ExpandedWidget extends StatelessWidget {
  const ExpandedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 50,
          color: Colors.amber,
        ),
        Expanded(
          flex: 2,
          child: Container(
            height: 50,
            color: Colors.blue,
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            height: 50,
            color: Colors.green,
          ),
        ),
         
      ]
    );
  }
}