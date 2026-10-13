import 'package:flutter/material.dart';

class Latihan6 extends StatelessWidget {
  const Latihan6({super.key});

  @override
  Widget build(BuildContext context) {
    return const InstagramHome();
  }
}

class InstagramHome extends StatefulWidget {
  const InstagramHome({super.key});

  @override
  State<InstagramHome> createState() => _InstagramHomeState();
}

class _InstagramHomeState extends State<InstagramHome> {
  int _selectedIndex = 0;

  // Fungsi untuk mengubah index menu bawah saat diklik
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Instagram',
          style: TextStyle(
            
            fontFamily: 'Billabong', // Gunakan font custom jika ada, ini fallback
            fontSize: 28,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.send_outlined, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      
      // Menampilkan halaman sesuai index yang dipilih di Bottom Navigation
      body: _selectedIndex == 0 ? const HomeFeed() : Center(
        child: Text('Halaman Menu ${_selectedIndex + 1}', style: const TextStyle(fontSize: 20)),
      ),

      // Navigasi Bawah
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed, // Agar warna icon tidak pudar
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.add_box_outlined), label: 'Add'),
          BottomNavigationBarItem(icon: Icon(Icons.video_library_outlined), label: 'Reels'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
      ),
    );
  }
}

// Widget khusus untuk isi Feed utama
class HomeFeed extends StatelessWidget {
  const HomeFeed({super.key});

  @override
  Widget build(BuildContext context) {
    // Kita pakai ListView agar bagian story dan feed bisa di-scroll bersamaan
    return ListView(
      children: [
        // 1. Bagian Stories (Horizontal ListView)
        SizedBox(
          height: 105,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 8,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(3),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [Colors.purple, Colors.orange, Colors.red],
                        ),
                      ),
                      child: CircleAvatar(
                        radius: 32,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage('https://picsum.photos/150?random=$index'),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      index == 0 ? 'Your Story' : 'User ${index + 1}',
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        const Divider(height: 1, color: Colors.grey),

        // 2. Bagian Postingan Feed (Vertikal)
        ListView.builder(
          shrinkWrap: true, // Wajib ada karena berada di dalam ListView utama
          physics: const NeverScrollableScrollPhysics(), // Matikan scroll internal
          itemCount: 5,
          itemBuilder: (context, index) {
            return PostItem(index: index);
          },
        ),
      ],
    );
  }
}

// Widget khusus untuk 1 buah postingan (Header, Foto, Aksi, Caption)
class PostItem extends StatelessWidget {
  final int index;
  const PostItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header Post (Avatar, Username, Menu)
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage('https://picsum.photos/150?random=${index + 10}'),
          ),
          title: Text('User ${index + 1}', style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: const Text('Bandung, Indonesia'),
          trailing: const Icon(Icons.more_vert),
          contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        ),
        
        // Foto Postingan
        Image.network(
          'https://picsum.photos/400?random=${index + 20}',
          width: double.infinity,
          height: 350,
          fit: BoxFit.cover,
        ),
        
        // Aksi (Like, Comment, Share, Save)
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(icon: const Icon(Icons.favorite_border), onPressed: () {}),
                IconButton(icon: const Icon(Icons.chat_bubble_outline), onPressed: () {}),
                IconButton(icon: const Icon(Icons.send_outlined), onPressed: () {}),
              ],
            ),
            IconButton(icon: const Icon(Icons.bookmark_border), onPressed: () {}),
          ],
        ),
        
        // Caption & Likes
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('1,234 likes', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              RichText(
                text: TextSpan(
                  style: const TextStyle(color: Colors.black),
                  children: [
                    TextSpan(text: 'User ${index + 1} ', style: const TextStyle(fontWeight: FontWeight.bold)),
                    const TextSpan(text: 'Menikmati pemandangan indah di hari yang cerah ini! 🌞✨ #holiday #vibes'),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              const Text('View all 45 comments', style: TextStyle(color: Colors.grey)),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ],
    );
  }
}