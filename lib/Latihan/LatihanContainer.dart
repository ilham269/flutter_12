import 'package:flutter/material.dart';

class LatihanContainer extends StatelessWidget {
  const LatihanContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 400,
      color: Colors.blue,
      margin: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: const Center(
              child: Image(
                image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRs7xhBASY3LncWOhthAcIrLhpN4DvUBGuFT8rJ9EMDlw&s=1024'),
                fit: BoxFit.cover,
              ),
            ),
          ),  
          const SizedBox(height: 90),
         Column(
          children: [
            Text("Nama : Muhamad Ilham"),
            Text("Kelas : XI RPL 1"),
            Text("Jurusan : RPL"),
            Text("Sekolah : SMK Assalaam Bandung"),
          ],
         ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}