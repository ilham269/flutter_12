import 'package:flutter/material.dart';

class StackWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 200,
          height: 200,
          color: Colors.red,
        ),
        Positioned(bottom: 10, 
        right: 10, 
        child: Icon(Icons.favorite, 
        color: Colors.white,
        size: 30
        )),
        Positioned(
          top: 10,
          left: 10,
          child: Container(
            width: 100,
            height: 100,
            color: Colors.blue,
            child: Text(
              "Hello",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ]
    );
  }
}