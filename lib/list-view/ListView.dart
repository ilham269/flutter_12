import 'package:flutter/material.dart';

class Listview extends StatelessWidget {
  const Listview({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> namaKontak = ['Andi', 'Budi', 'Caca', 'Dedi', 'Eka', 'Fajar', 'Gita'];

    return Scaffold(
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
    );
  }
}