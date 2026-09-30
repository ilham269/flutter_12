import 'package:flutter/material.dart';

class LatihanContainer2 extends StatelessWidget {
  const LatihanContainer2({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 350,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.lightGreen.shade100,
          border: Border.all(
            color: Colors.green.shade800,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            const Text(
              'KARTU Tanda Pengenal',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Nama      : Muhamad Ilham'),
                      SizedBox(height: 10),
                      Text('Kelas     : XI RPL 1'),
                      SizedBox(height: 10),
                      Text('Jurusan   : RPL'),
                      SizedBox(height: 10),
                      Text('Sekolah   : SMK Assalaam Bandung'),
                    ],
                  ),
                ),

                const SizedBox(width: 15),

                Container(
                  width: 80,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Image(
                      image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRs7xhBASY3LncWOhthAcIrLhpN4DvUBGuFT8rJ9EMDlw&s=1024'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}