import 'package:flutter/material.dart';

import 'detail_item_page.dart';
import 'product_image.dart';

const Color _lime = Color(0xFFC6F000);
const Color _lightGray = Color(0xFFF1F2F2);
const Color _darkText = Color(0xFF202124);

String formatRupiah(int amount) {
  final digits = amount.toString();
  final formatted = StringBuffer();

  for (var index = 0; index < digits.length; index++) {
    if (index > 0 && (digits.length - index) % 3 == 0) {
      formatted.write('.');
    }
    formatted.write(digits[index]);
  }

  return 'Rp${formatted.toString()}';
}

// Data produk disimpan dalam Map agar mudah diganti atau dikembangkan.
final List<Map<String, dynamic>> items = [
  {
    'id': 1,
    'nama': 'Nintendo Switch',
    'kategori': 'Consoles',
    'harga': 4299000,
    'hargaLama': 4799000,
    'rating': 4.8,
    'ulasan': 117,
    'deskripsi': 'Konsol hybrid untuk bermain di rumah maupun saat bepergian. Termasuk Joy-Con dan dock.',
    'icon': Icons.sports_esports,
    'imageUrl':
        'https://images.unsplash.com/photo-1606144042614-b2417e99c4e3?auto=format&fit=crop&w=800&q=80',
  },
  {
    'id': 2,
    'nama': 'Smartphone X',
    'kategori': 'Phones',
    'harga': 5999000,
    'hargaLama': null,
    'rating': 4.7,
    'ulasan': 203,
    'deskripsi': 'Smartphone dengan layar jernih, kamera tajam, dan baterai tahan lama untuk aktivitas harian.',
    'icon': Icons.smartphone,
    'imageUrl':
        'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?auto=format&fit=crop&w=800&q=80',
  },
  {
    'id': 3,
    'nama': 'Laptop Pro 14',
    'kategori': 'Laptops',
    'harga': 12999000,
    'hargaLama': 13999000,
    'rating': 4.9,
    'ulasan': 86,
    'deskripsi': 'Laptop ringan dengan performa kencang untuk belajar, bekerja, dan kebutuhan kreatif.',
    'icon': Icons.laptop_mac,
    'imageUrl':
        'https://images.unsplash.com/photo-1496181133206-80ce9b88a853?auto=format&fit=crop&w=800&q=80',
  },
  {
    'id': 4,
    'nama': 'Kamera Mirrorless',
    'kategori': 'Cameras',
    'harga': 8499000,
    'hargaLama': null,
    'rating': 4.6,
    'ulasan': 64,
    'deskripsi': 'Kamera mirrorless ringkas untuk mengabadikan foto dan video dengan kualitas detail.',
    'icon': Icons.camera_alt,
    'imageUrl':
        'https://images.unsplash.com/photo-1516035069371-29a1b244cc32?auto=format&fit=crop&w=800&q=80',
  },
  {
    'id': 5,
    'nama': 'Headphone Wireless',
    'kategori': 'Audio',
    'harga': 1299000,
    'hargaLama': 1599000,
    'rating': 4.5,
    'ulasan': 142,
    'deskripsi': 'Headphone nirkabel nyaman dipakai dengan suara jernih dan baterai yang awet.',
    'icon': Icons.headphones,
    'imageUrl':
        'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?auto=format&fit=crop&w=800&q=80',
  },
  {
    'id': 6,
    'nama': 'Game Console',
    'kategori': 'Consoles',
    'harga': 7499000,
    'hargaLama': null,
    'rating': 4.8,
    'ulasan': 91,
    'deskripsi': 'Konsol game generasi terbaru untuk menikmati berbagai permainan favorit.',
    'icon': Icons.videogame_asset,
    'imageUrl':
        'https://images.unsplash.com/photo-1486572788966-cfd3df1f5b42?auto=format&fit=crop&w=800&q=80',
  },
  {
    'id': 7,
    'nama': 'Smartphone Mini',
    'kategori': 'Phones',
    'harga': 3299000,
    'hargaLama': 3699000,
    'rating': 4.4,
    'ulasan': 75,
    'deskripsi': 'Ponsel praktis dengan desain ringkas, penyimpanan lega, dan kamera yang andal.',
    'icon': Icons.phone_android,
    'imageUrl':
        'https://images.unsplash.com/photo-1598327105666-5b89351aff97?auto=format&fit=crop&w=800&q=80',
  },
  {
    'id': 8,
    'nama': 'Speaker Bluetooth',
    'kategori': 'Audio',
    'harga': 899000,
    'hargaLama': null,
    'rating': 4.6,
    'ulasan': 58,
    'deskripsi': 'Speaker portabel dengan suara bertenaga, cocok untuk menemani perjalanan.',
    'icon': Icons.speaker,
    'imageUrl':
        'https://images.unsplash.com/photo-1608043152269-423dbba4e7e1?auto=format&fit=crop&w=800&q=80',
  },
];

const List<String> _categories = [
  'Semua',
  'Phones',
  'Consoles',
  'Laptops',
  'Cameras',
  'Audio',
];

class DaftarItemPage extends StatefulWidget {
  const DaftarItemPage({super.key});

  @override
  State<DaftarItemPage> createState() => _DaftarItemPageState();
}

class _DaftarItemPageState extends State<DaftarItemPage> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedCategory = 'Semua';
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<Map<String, dynamic>> get _filteredItems {
    return items.where((item) {
      final matchesCategory =
          _selectedCategory == 'Semua' || item['kategori'] == _selectedCategory;
      final matchesSearch = (item['nama'] as String).toLowerCase().contains(
        _searchQuery.toLowerCase(),
      );
      return matchesCategory && matchesSearch;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final visibleItems = _filteredItems;

    return Scaffold(
      backgroundColor: _lightGray,
      appBar: AppBar(
        title: const Text(
          'Toko Elektronik',
          style: TextStyle(color: _darkText, fontWeight: FontWeight.w700),
        ),
        backgroundColor: _lightGray,
        surfaceTintColor: Colors.transparent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
            child: TextField(
              controller: _searchController,
              onChanged: (value) => setState(() => _searchQuery = value),
              decoration: InputDecoration(
                hintText: 'Cari produk...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _searchQuery.isEmpty
                    ? null
                    : IconButton(
                        onPressed: () {
                          _searchController.clear();
                          setState(() => _searchQuery = '');
                        },
                        icon: const Icon(Icons.close),
                      ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 48,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemCount: _categories.length,
              separatorBuilder: (context, index) => const SizedBox(width: 8),
              itemBuilder: (context, index) {
                final category = _categories[index];
                final selected = category == _selectedCategory;
                return ChoiceChip(
                  label: Text(category),
                  selected: selected,
                  onSelected: (_) =>
                      setState(() => _selectedCategory = category),
                  selectedColor: _lime,
                  backgroundColor: Colors.white,
                  side: BorderSide.none,
                  labelStyle: TextStyle(
                    color: _darkText,
                    fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: visibleItems.isEmpty
                ? const Center(child: Text('Produk tidak ditemukan.'))
                : GridView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: visibleItems.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 0.68,
                        ),
                    itemBuilder: (context, index) {
                      final item = visibleItems[index];
                      return _ProductCard(
                        item: item,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                              builder: (context) => DetailItemPage(item: item),
                            ),
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  const _ProductCard({required this.item, required this.onTap});

  final Map<String, dynamic> item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final oldPrice = item['hargaLama'] as int?;

    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ProductImage(
                  imageUrl: item['imageUrl'] as String,
                  fallbackIcon: item['icon'] as IconData,
                  iconSize: 58,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                item['kategori'] as String,
                style: const TextStyle(fontSize: 11, color: Colors.black54),
              ),
              const SizedBox(height: 4),
              Text(
                item['nama'] as String,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: _darkText,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                formatRupiah(item['harga'] as int),
                style: const TextStyle(
                  color: _darkText,
                  fontWeight: FontWeight.w700,
                ),
              ),
              if (oldPrice != null)
                Text(
                  formatRupiah(oldPrice),
                  style: const TextStyle(
                    color: Colors.black45,
                    fontSize: 12,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
