import 'package:flutter/material.dart';

void main() => runApp(const Listview());

class Listview extends StatelessWidget {
  const Listview({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> namaKontak = ['Andi', 'Budi', 'Caca', 'Dedi', 'Eka', 'Fajar', 'Gita'];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Contoh ListView')),
        body: ListView.builder(
          itemCount: namaKontak.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: const CircleAvatar(child: Icon(Icons.person)),
              title: Text(namaKontak[index]),
              subtitle: Text('Pesan terakhir dari ${namaKontak[index]}...'),
              trailing: const Text('12:00'),
            );
          },
        ),
      ),
    );
  }
}