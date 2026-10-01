import 'package:flutter/material.dart';
import 'package:praktek/Latihan/Latihan4.dart';

// Import latihan lainnya
// import 'package:praktek/row_column/RowColumn.dart';
// import 'package:praktek/sized_box/StackWidget.dart';
// import 'package:praktek/container/LatihanContainer22.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Layouts'),
          backgroundColor: const Color.fromARGB(255, 0, 153, 255),
          
          centerTitle: true,
        ),

        // =========================
        // BODY
        // =========================
        body: const SafeArea(
          child: Latihan4(),
        ),
      ),
    );
  }
}

class HelloWidget extends StatelessWidget {
  const HelloWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Hello, I am a Flutter App!',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}