import 'package:flutter/material.dart';

class SizedBoxWidget extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text("Baris 1"),
          SizedBox(height: 20),
          Text("Baris 2"),
          SizedBox(height: 30),

        SizedBox(
          width: 200,
          height: 25,
          child: ElevatedButton(
            onPressed: () {
            },
            child: Text("Tombol"),
          ), 
        ),
        ],
      )
    );
  }
}