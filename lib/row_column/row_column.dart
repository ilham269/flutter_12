import 'package:flutter/material.dart';

class Rowcolumn extends StatelessWidget {
  const Rowcolumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        height: 95,
        color: Colors.grey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.call,
                  size: 50,
                ),
                SizedBox(height: 10),
                Text('Call'),
              ],
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.message,
                  size: 50,
                ),
                SizedBox(height: 10),
                Text('Message'),
              ],
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.photo,
                  size: 50,
                ),
                SizedBox(height: 10),
                Text('Photo'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}