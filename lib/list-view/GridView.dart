import 'package:flutter/material.dart';

void main() => runApp(const Gridview());

// Model sederhana untuk data produk
class Produk {
  final String judul;
  final String gambar;
  final int harga;

  const Produk({
    required this.judul,
    required this.gambar,
    required this.harga,
  });
}

class Gridview extends StatelessWidget {
  const Gridview({super.key});

  // Data produk (ganti dengan data milikmu)
  static const List<Produk> daftarProduk = [
    Produk(
      judul: 'Nasi Goreng',
      gambar: 'https://picsum.photos/id/1080/400/300',
      harga: 15000,
    ),
    Produk(
      judul: 'Mie Ayam',
      gambar: 'https://picsum.photos/id/292/400/300',
      harga: 12000,
    ),
    Produk(
      judul: 'Sate Ayam',
      gambar: 'https://picsum.photos/id/312/400/300',
      harga: 20000,
    ),
    Produk(
      judul: 'Es Teh Manis',
      gambar: 'https://picsum.photos/id/1060/400/300',
      harga: 5000,
    ),
    Produk(
      judul: 'Bakso',
      gambar: 'https://picsum.photos/id/493/400/300',
      harga: 13000,
    ),
    Produk(
      judul: 'Kopi Susu',
      gambar: 'https://picsum.photos/id/425/400/300',
      harga: 10000,
    ),
  ];

  // Format harga: 15000 -> Rp 15.000
  String formatHarga(int harga) {
    final teks = harga.toString().replaceAllMapped(
          RegExp(r'(\d)(?=(\d{3})+$)'),
          (m) => '${m[1]}.',
        );
    return 'Rp $teks';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Contoh GridView')),
        body: GridView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: daftarProduk.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.8, // Dibuat agak tinggi agar muat gambar + teks
          ),
          itemBuilder: (context, index) {
            final produk = daftarProduk[index];
            return Card(
              elevation: 3,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Gambar mengisi sisa ruang bagian atas
                  Expanded(
                    child: Image.network(
                      produk.gambar,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, progress) {
                        if (progress == null) return child;
                        return const Center(child: CircularProgressIndicator());
                      },
                      errorBuilder: (context, error, stackTrace) =>
                          const Center(child: Icon(Icons.broken_image, size: 40)),
                    ),
                  ),
                  // Judul dan harga
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          produk.judul,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          formatHarga(produk.harga),
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.teal[700],
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}