import 'package:flutter/material.dart';

class KartuProfile2 extends StatelessWidget {
  const KartuProfile2({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(Icons.image, size: 50, color: Colors.grey[600]),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: Container(
              padding: EdgeInsets.all(4),
              color: Colors.red,
              child: Text('-20%')
            ),
          ),
          Positioned(bottom: 8, right: 8, child: Icon(Icons.favorite_border)),
        ],
      ),
    );
  }
}