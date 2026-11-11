import 'package:flutter/material.dart';

class SizedBoxWidget extends StatelessWidget {
  const SizedBoxWidget({super.key});



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Baris 1"),
        const SizedBox(height: 20),
        const Text("Baris 2"),
        const SizedBox(height: 30),
        SizedBox(
          width: 200,
          height: 25,
          child: ElevatedButton(
            onPressed: () {},
            child: const Text("Tombol"),
          ),
        ),
      ],
    );
  }
}