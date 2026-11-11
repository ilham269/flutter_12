import 'package:flutter/material.dart';

class Latihan3 extends StatelessWidget {
  const Latihan3({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            
            height: 80,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.black, width: 2),
            ),
            child: Text(
              "Pemasukan",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          flex: 1,
          child: Container(
            height: 80,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.black, width: 2),
            ),
            child: Text(
              "Pengeluaran",
              style: TextStyle(color: Colors.white),
            ),  
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          flex: 1,
          child: Container(
            height: 80,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.black, width: 2),
            ),
            child: Text(
              "Saldo",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
         
      ]
        )
    );
  }
}