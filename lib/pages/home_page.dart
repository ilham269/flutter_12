import 'dart:async';

import 'package:flutter/material.dart';
import 'package:praktek/pages/elektronik/detail_item_page.dart';

// ====================== WARNA (samain sama home page lu) ======================
// Mau versi hijau lime kayak referensi? Ganti _aksen jadi Color(0xFFC6F000)
// dan _aksenTua jadi Color(0xFF111111).
const Color _aksen = Color(0xFF1976D2);
const Color _aksenTua = Color(0xFF0D47A1);
const Color _aksenSoft = Color(0xFFE3F0FF);
const Color _latar = Color(0xFFF6F9FF);
const Color _abu = Color(0xFFF1F3F6);

// ====================== DATA (masih Map, belum model) ======================
// GANTI isinya sesuai produk lu sendiri.
final List<Map<String, dynamic>> _semuaItem = [
  {
    'id': 1,
    'nama': 'iPhone 15 Pro 128GB',
    'kategori': 'Phones',
    'harga': 17999000,
    'hargaLama': 19499000,
    'rating': 4.9,
    'ulasan': 210,
    'deskripsi': 'Smartphone flagship dengan kamera tajam dan bodi titanium.',
    'icon': Icons.smartphone,
  },
  {
    'id': 2,
    'nama': 'Galaxy Buds Pro',
    'kategori': 'Audio',
    'harga': 1799000,
    'hargaLama': 2199000,
    'rating': 4.7,
    'ulasan': 98,
    'deskripsi': 'Earbuds wireless dengan noise cancelling.',
    'icon': Icons.headphones,
  },
  {
    'id': 3,
    'nama': 'Nintendo Switch Gray',
    'kategori': 'Consoles',
    'harga': 4299000,
    'hargaLama': null,
    'rating': 4.8,
    'ulasan': 117,
    'deskripsi': 'Konsol game portabel lengkap dengan 2 Joy-Con.',
    'icon': Icons.sports_esports,
  },
  {
    'id': 4,
    'nama': 'Asus Vivobook 14',
    'kategori': 'Laptops',
    'harga': 8499000,
    'hargaLama': 9299000,
    'rating': 4.6,
    'ulasan': 64,
    'deskripsi': 'Laptop tipis untuk kuliah dan kerja harian.',
    'icon': Icons.laptop_mac,
  },
  {
    'id': 5,
    'nama': 'Canon EOS M50 II',
    'kategori': 'Cameras',
    'harga': 9799000,
    'hargaLama': null,
    'rating': 4.8,
    'ulasan': 41,
    'deskripsi': 'Kamera mirrorless ringkas untuk foto dan vlog.',
    'icon': Icons.photo_camera,
  },
  {
    'id': 6,
    'nama': 'Redmi Note 13',
    'kategori': 'Phones',
    'harga': 2999000,
    'hargaLama': 3299000,
    'rating': 4.5,
    'ulasan': 175,
    'deskripsi': 'HP harga bersahabat dengan layar AMOLED.',
    'icon': Icons.smartphone,
  },
];

const List<String> _kategori = [
  'Semua',
  'Phones',
  'Consoles',
  'Laptops',
  'Cameras',
  'Audio',
];

IconData _iconKategori(String k) {
  switch (k) {
    case 'Phones':
      return Icons.smartphone;
    case 'Consoles':
      return Icons.sports_esports;
    case 'Laptops':
      return Icons.laptop_mac;
    case 'Cameras':
      return Icons.photo_camera;
    case 'Audio':
      return Icons.headphones;
    default:
      return Icons.apps;
  }
}

// Format rupiah manual: 1500000 -> Rp1.500.000
String _rupiah(int v) {
  final s = v.toString();
  final b = StringBuffer();
  for (int i = 0; i < s.length; i++) {
    if (i > 0 && (s.length - i) % 3 == 0) b.write('.');
    b.write(s[i]);
  }
  return 'Rp$b';
}

// ====================== HALAMAN ======================
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

typedef DaftarItemPage = HomePage;

class _HomePageState extends State<HomePage> {
  String _kategoriAktif = 'Semua';
  String _keyword = '';

  // Countdown flash sale
  Duration _sisa = const Duration(hours: 2, minutes: 59, seconds: 23);
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (_sisa.inSeconds <= 0) {
        _timer?.cancel();
        return;
      }
      setState(() => _sisa -= const Duration(seconds: 1));
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String get _teksTimer {
    String dua(int n) => n.toString().padLeft(2, '0');
    return '${dua(_sisa.inHours)}:${dua(_sisa.inMinutes % 60)}:${dua(_sisa.inSeconds % 60)}';
  }

  // Produk hasil filter kategori + search
  List<Map<String, dynamic>> get _hasil {
    return _semuaItem.where((item) {
      final cocokKategori =
          _kategoriAktif == 'Semua' || item['kategori'] == _kategoriAktif;
      final cocokCari = (item['nama'] as String).toLowerCase().contains(
        _keyword.toLowerCase(),
      );
      return cocokKategori && cocokCari;
    }).toList();
  }

  // Produk yang punya harga coret = masuk flash sale
  List<Map<String, dynamic>> get _flashSale =>
      _semuaItem.where((item) => item['hargaLama'] != null).toList();

  void _bukaDetail(Map<String, dynamic> item) {
    Navigator.push(
      context,
      MaterialPageRoute<void>(builder: (_) => DetailItemPage(item: item)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final hasil = _hasil;
    return Scaffold(
      backgroundColor: _latar,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildAtas(),
            const SizedBox(height: 16),
            _buildKategori(),
            _buildFlashSale(),
            _buildSemuaProduk(hasil),
          ],
        ),
      ),
    );
  }

  // ---------- Bagian atas: header, search, banner ----------
  Widget _buildAtas() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 18),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(28),
          bottomRight: Radius.circular(28),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const SizedBox(height: 10),
            Row(
              children: [
                // Tombol back ke Home
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 46,
                    height: 46,
                    decoration: const BoxDecoration(
                      color: _aksen,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
                const Expanded(
                  child: Column(
                    children: [
                      Text(
                        'Dikirim ke',
                        style: TextStyle(fontSize: 11, color: Colors.black45),
                      ),
                      SizedBox(height: 2),
                      // GANTI alamat lu
                      Text(
                        'Jl. Merdeka No. 10, Banjar',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                // Lonceng notifikasi + titik
                Stack(
                  children: [
                    Container(
                      width: 46,
                      height: 46,
                      decoration: const BoxDecoration(
                        color: _abu,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.notifications_none),
                    ),
                    Positioned(
                      right: 4,
                      top: 4,
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 1.5),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 14),

            // Search bar
            TextField(
              onChanged: (v) => setState(() => _keyword = v),
              decoration: InputDecoration(
                hintText: 'Cari produk di toko...',
                hintStyle: const TextStyle(color: Colors.black38),
                prefixIcon: const Icon(Icons.search, color: Colors.black45),
                filled: true,
                fillColor: _abu,
                contentPadding: const EdgeInsets.symmetric(vertical: 14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 14),

            // Banner promo (GANTI teksnya)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [_aksenTua, _aksen],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Promo Akhir Tahun',
                          style: TextStyle(color: Colors.white70, fontSize: 12),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Gratis ongkir\nsampai 50%',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            height: 1.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: const BoxDecoration(
                      color: Colors.white24,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.local_shipping_outlined,
                      color: Colors.white,
                      size: 34,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---------- Kategori ----------
  Widget _buildKategori() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Kategori',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 86,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: _kategori.length,
              separatorBuilder: (_, _) => const SizedBox(width: 14),
              itemBuilder: (context, i) {
                final k = _kategori[i];
                final aktif = k == _kategoriAktif;
                return GestureDetector(
                  onTap: () => setState(() => _kategoriAktif = k),
                  child: Column(
                    children: [
                      Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          color: aktif ? _aksen : Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(color: _aksenSoft, width: 1.5),
                        ),
                        child: Icon(
                          _iconKategori(k),
                          color: aktif ? Colors.white : _aksen,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(k, style: const TextStyle(fontSize: 12)),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // ---------- Flash Sale ----------
  Widget _buildFlashSale() {
    final flash = _flashSale;
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                const Text(
                  'Flash Sale',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                ),
                const SizedBox(width: 10),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    _teksTimer,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 240,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemCount: flash.length,
              separatorBuilder: (_, _) => const SizedBox(width: 12),
              itemBuilder: (context, i) => SizedBox(
                width: 160,
                child: _KartuProduk(
                  item: flash[i],
                  onTap: () => _bukaDetail(flash[i]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ---------- Semua Produk (ikut filter & search) ----------
  Widget _buildSemuaProduk(List<Map<String, dynamic>> hasil) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Semua Produk',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 12),
          if (hasil.isEmpty)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: Center(child: Text('Produk tidak ditemukan')),
            )
          else
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: hasil.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.72,
              ),
              itemBuilder: (context, i) => _KartuProduk(
                item: hasil[i],
                onTap: () => _bukaDetail(hasil[i]),
              ),
            ),
        ],
      ),
    );
  }
}

// ====================== KARTU PRODUK ======================
class _KartuProduk extends StatelessWidget {
  final Map<String, dynamic> item;
  final VoidCallback onTap;

  const _KartuProduk({required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final int? hargaLama = item['hargaLama'] as int?;
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: _abu,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Stack(
                children: [
                  Center(
                    child: Icon(
                      item['icon'] as IconData,
                      size: 60,
                      color: Colors.black45,
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.favorite_border, size: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            item['nama'] as String,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
          ),
          const SizedBox(height: 4),
          Text(
            _rupiah(item['harga'] as int),
            style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 14),
          ),
          if (hargaLama != null)
            Text(
              _rupiah(hargaLama),
              style: const TextStyle(
                color: Colors.black38,
                fontSize: 11,
                decoration: TextDecoration.lineThrough,
              ),
            ),
        ],
      ),
    );
  }
}
