import 'package:flutter/material.dart';
// import 'package:praktek/row_column/RowColumn.dart';
import 'package:praktek/container/LatihanContainer.dart';
// import 'package:praktek/container/LatihanContainer2.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Kartu Identias'),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: const Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            LatihanContainer(),
       
            SizedBox(height: 20),
            HelloWidget(),
          ],
        ),
        // body: Rowcolumn()
      ),
    );
  }
}

class HelloWidget extends StatelessWidget {
  const HelloWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Hello, I am a Flutter App!',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.white),
      ),
      
    );
  }
}