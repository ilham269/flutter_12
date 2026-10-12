import 'package:flutter/material.dart';

void main() => runApp(const SingleScroll());

class SingleScroll extends StatelessWidget {
  const SingleScroll({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Contoh SingleChildScrollView')),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Profil Pengguna',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Container(height: 150, color: Colors.blue[100], child: const Center(child: Text('Kotak 1'))),
              const SizedBox(height: 20),
              Container(height: 150, color: Colors.green[100], child: const Center(child: Text('Kotak 2'))),
              const SizedBox(height: 20),
              Container(height: 150, color: Colors.orange[100], child: const Center(child: Text('Kotak 3'))),
              const SizedBox(height: 20),
              Container(height: 150, color: Colors.purple[100], child: const Center(child: Text('Kotak 4'))),
            ],
          ),
        ),
      ),
    );
  }
}