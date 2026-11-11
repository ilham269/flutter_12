import 'package:flutter/material.dart';

class Latihan5 extends StatelessWidget {
  const Latihan5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Ilham  ',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(icon: const Icon(Icons.add_box_outlined, color: Colors.black), onPressed: () {}),
          IconButton(icon: const Icon(Icons.menu, color: Colors.black), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey,
                    backgroundImage: NetworkImage('https://picsum.photos/200'), 
                  ),
                  _buildStatColumn('Posts', '42'),
                  _buildStatColumn('Followers', '10.5K'),
                  _buildStatColumn('Following', '300'),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Bro Programmer', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('Membangun aplikasi keren dengan Flutter 🚀\nNgoding tiap hari.'),
                  Text('www.github.com/programmerbro', style: TextStyle(color: Colors.blue)),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text('Edit Profile'),
                ),
              ),
            ),
            const SizedBox(height: 15),

            // Sorotan 
            SizedBox(
              height: 90,
              child: ListView.builder(
                scrollDirection: Axis.horizontal, 
                itemCount: 10,
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 32,
                          backgroundColor: Colors.grey[300],
                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage('https://picsum.photos/200?random=$index'),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text('Highlight ${index + 1}', style: const TextStyle(fontSize: 12)),
                      ],
                    ),
                  );
                },
              ),
            ),
            const Divider(height: 30),
          ],
        ),
      ),
    );
  }

  // 👇👇👇 TAMBAHKAN KODE INI DI SINI 👇👇👇
  // Fungsi ini bertugas untuk mencetak angka dan teks statisik (Posts, Followers, Following)
  Column _buildStatColumn(String label, String count) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(count, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Text(label, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
  // 👆👆👆 ============================== 👆👆👆
}