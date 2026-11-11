import 'package:flutter/material.dart';

void main() => runApp(const TokoElektronikApp());

// ====================== WARNA & HELPER ======================
const kLime = Color(0xFFC6F000);
const kGrey = Color(0xFFF1F2F2);
const kDark = Color(0xFF111111);

/// Format angka jadi rupiah: 1500000 -> Rp1.500.000
String rupiah(int v) {
  final s = v.toString();
  final b = StringBuffer();
  for (int i = 0; i < s.length; i++) {
    if (i > 0 && (s.length - i) % 3 == 0) b.write('.');
    b.write(s[i]);
  }
  return 'Rp$b';
}

String formatTanggal(DateTime d) {
  String dua(int n) => n.toString().padLeft(2, '0');
  return '${dua(d.day)}/${dua(d.month)}/${d.year} ${dua(d.hour)}:${dua(d.minute)}';
}

// ====================== MODEL DATA ======================
class Product {
  final int id;
  final String name;
  final String category;
  final int price;
  final int? oldPrice;
  final double rating;
  final int reviews;
  final String description;
  final IconData icon; // ganti dengan gambar asset kalau sudah ada

  const Product({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    this.oldPrice,
    required this.rating,
    required this.reviews,
    required this.description,
    required this.icon,
  });
}

const List<Product> dummyProducts = [
  Product(
    id: 1,
    name: 'Apple iPhone 15 Pro 128GB',
    category: 'Phones',
    price: 17999000,
    oldPrice: 19499000,
    rating: 4.9,
    reviews: 210,
    description: 'Smartphone flagship dengan chip terbaru, kamera tajam, dan bodi titanium yang ringan.',
    icon: Icons.smartphone,
  ),
  Product(
    id: 2,
    name: 'Samsung Galaxy Buds Pro',
    category: 'Audio',
    price: 1799000,
    oldPrice: 2199000,
    rating: 4.7,
    reviews: 98,
    description:
        'Earbuds wireless dengan noise cancelling dan baterai tahan seharian.',
    icon: Icons.headphones,
  ),
  Product(
    id: 3,
    name: 'Nintendo Switch, Gray',
    category: 'Consoles',
    price: 4299000,
    rating: 4.8,
    reviews: 117,
    description: 'Konsol game portabel yang bisa dibawa ke mana-mana, dilengkapi 2 gamepad (Joy-Con).',
    icon: Icons.sports_esports,
  ),
  Product(
    id: 4,
    name: 'Laptop Asus Vivobook 14',
    category: 'Laptops',
    price: 8499000,
    oldPrice: 9299000,
    rating: 4.6,
    reviews: 64,
    description: 'Laptop tipis untuk kuliah dan kerja harian, layar 14 inci dengan performa lancar.',
    icon: Icons.laptop_mac,
  ),
  Product(
    id: 5,
    name: 'Canon EOS M50 Mark II',
    category: 'Cameras',
    price: 9799000,
    rating: 4.8,
    reviews: 41,
    description: 'Kamera mirrorless ringkas, cocok untuk foto, vlog, dan konten kreator pemula.',
    icon: Icons.photo_camera,
  ),
  Product(
    id: 6,
    name: 'Xiaomi Redmi Note 13',
    category: 'Phones',
    price: 2999000,
    oldPrice: 3299000,
    rating: 4.5,
    reviews: 175,
    description: 'HP harga bersahabat dengan layar AMOLED dan kamera 108MP.',
    icon: Icons.smartphone,
  ),
];

const List<String> kategori = [
  'Semua',
  'Phones',
  'Consoles',
  'Laptops',
  'Cameras',
  'Audio',
];

IconData iconKategori(String k) {
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

// ====================== APP ======================
class TokoElektronikApp extends StatelessWidget {
  const TokoElektronikApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Toko Elektronik',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: kLime),
      ),
      home: const ProductListPage(),
    );
  }
}

// ====================== HALAMAN 1: DAFTAR ITEM ======================
class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  String _kategoriAktif = 'Semua';
  String _keyword = '';

  List<Product> get _hasil {
    return dummyProducts.where((p) {
      final cocokKategori =
          _kategoriAktif == 'Semua' || p.category == _kategoriAktif;
      final cocokCari = p.name.toLowerCase().contains(_keyword.toLowerCase());
      return cocokKategori && cocokCari;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final items = _hasil;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              const Text(
                'Halo 👋',
                style: TextStyle(color: Colors.black54, fontSize: 13),
              ),
              const Text(
                'Toko Elektronik',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 14),

              // Search bar
              TextField(
                onChanged: (v) => setState(() => _keyword = v),
                decoration: InputDecoration(
                  hintText: 'Cari produk...',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: kGrey,
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Kategori
              SizedBox(
                height: 84,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: kategori.length,
                  separatorBuilder: (_, _) => const SizedBox(width: 12),
                  itemBuilder: (context, i) {
                    final k = kategori[i];
                    final aktif = k == _kategoriAktif;
                    return GestureDetector(
                      onTap: () => setState(() => _kategoriAktif = k),
                      child: Column(
                        children: [
                          Container(
                            width: 56,
                            height: 56,
                            decoration: BoxDecoration(
                              color: aktif ? kLime : kGrey,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(iconKategori(k), color: kDark),
                          ),
                          const SizedBox(height: 6),
                          Text(k, style: const TextStyle(fontSize: 12)),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Daftar Produk',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 10),

              // Grid produk
              Expanded(
                child: items.isEmpty
                    ? const Center(child: Text('Produk tidak ditemukan'))
                    : GridView.builder(
                        itemCount: items.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 12,
                              crossAxisSpacing: 12,
                              childAspectRatio: 0.68,
                            ),
                        itemBuilder: (context, i) =>
                            ProductCard(product: items[i]),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => ProductDetailPage(product: product)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: kGrey,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Icon(product.icon, size: 64, color: Colors.black54),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            product.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Text(
                rupiah(product.price),
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 14,
                ),
              ),
              const SizedBox(width: 6),
              if (product.oldPrice != null)
                Flexible(
                  child: Text(
                    rupiah(product.oldPrice!),
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.black38,
                      fontSize: 11,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

// ====================== HALAMAN 2: DETAIL ITEM ======================
class ProductDetailPage extends StatefulWidget {
  final Product product;
  const ProductDetailPage({super.key, required this.product});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int _qty = 1;
  String _metode = 'Transfer Bank';
  final _metodeList = const ['Transfer Bank', 'E-Wallet', 'COD'];
  bool _favorit = false;

  @override
  Widget build(BuildContext context) {
    final p = widget.product;
    return Scaffold(
      backgroundColor: kGrey,
      body: SafeArea(
        child: Column(
          children: [
            // Top bar + gambar
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _CircleBtn(
                    icon: Icons.arrow_back_ios_new,
                    onTap: () => Navigator.pop(context),
                  ),
                  _CircleBtn(
                    icon: _favorit ? Icons.favorite : Icons.favorite_border,
                    color: _favorit ? Colors.red : kDark,
                    onTap: () => setState(() => _favorit = !_favorit),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 180,
              child: Center(
                child: Icon(p.icon, size: 130, color: Colors.black45),
              ),
            ),

            // Panel putih bawah
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        p.name,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          _InfoChip(
                            icon: Icons.star,
                            text: '${p.rating}  (${p.reviews} ulasan)',
                          ),
                          const SizedBox(width: 8),
                          _InfoChip(icon: Icons.category, text: p.category),
                        ],
                      ),
                      const SizedBox(height: 14),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: kGrey,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Text(
                          rupiah(p.price),
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      const SizedBox(height: 14),
                      Text(
                        p.description,
                        style: const TextStyle(
                          color: Colors.black54,
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 18),

                      // Jumlah
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Jumlah',
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          Row(
                            children: [
                              _CircleBtn(
                                icon: Icons.remove,
                                size: 34,
                                onTap: () {
                                  if (_qty > 1) setState(() => _qty--);
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 14,
                                ),
                                child: Text(
                                  '$_qty',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              _CircleBtn(
                                icon: Icons.add,
                                size: 34,
                                onTap: () => setState(() => _qty++),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // Metode bayar
                      const Text(
                        'Metode Pembayaran',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8,
                        children: _metodeList.map((m) {
                          return ChoiceChip(
                            label: Text(m),
                            selected: _metode == m,
                            selectedColor: kLime,
                            onSelected: (_) => setState(() => _metode = m),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 20),

                      // Tombol beli
                      SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kLime,
                            foregroundColor: kDark,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => ReceiptPage(
                                  product: p,
                                  qty: _qty,
                                  metode: _metode,
                                ),
                              ),
                            );
                          },
                          child: Text(
                            'Beli Sekarang • ${rupiah(p.price * _qty)}',
                            style: const TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CircleBtn extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final double size;
  final Color color;
  const _CircleBtn({
    required this.icon,
    required this.onTap,
    this.size = 44,
    this.color = kDark,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.black12),
        ),
        child: Icon(icon, size: size * 0.45, color: color),
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String text;
  const _InfoChip({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: Colors.teal),
          const SizedBox(width: 4),
          Text(text, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}

// ====================== HALAMAN 3: STRUK PEMBAYARAN ======================
class ReceiptPage extends StatelessWidget {
  final Product product;
  final int qty;
  final String metode;
  const ReceiptPage({
    super.key,
    required this.product,
    required this.qty,
    required this.metode,
  });

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final subtotal = product.price * qty;
    const ongkir = 20000;
    final total = subtotal + ongkir;
    final noOrder =
        'INV-${now.year}${now.month.toString().padLeft(2, '0')}${now.day.toString().padLeft(2, '0')}-${product.id.toString().padLeft(4, '0')}';

    return Scaffold(
      backgroundColor: kGrey,
      appBar: AppBar(
        backgroundColor: kGrey,
        elevation: 0,
        title: const Text(
          'Struk Pembayaran',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: 64,
                          height: 64,
                          decoration: const BoxDecoration(
                            color: kLime,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.check, size: 36),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Pembayaran Berhasil!',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          formatTanggal(now),
                          style: const TextStyle(color: Colors.black54),
                        ),
                        const SizedBox(height: 16),
                        const _DashedLine(),
                        const SizedBox(height: 12),
                        _row('No. Pesanan', noOrder),
                        _row('Metode Bayar', metode),
                        const SizedBox(height: 8),
                        const _DashedLine(),
                        const SizedBox(height: 12),

                        // Detail barang
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            product.name,
                            style: const TextStyle(fontWeight: FontWeight.w700),
                          ),
                        ),
                        const SizedBox(height: 6),
                        _row(
                          '$qty x ${rupiah(product.price)}',
                          rupiah(subtotal),
                        ),
                        const SizedBox(height: 8),
                        const _DashedLine(),
                        const SizedBox(height: 12),
                        _row('Subtotal', rupiah(subtotal)),
                        _row('Ongkos Kirim', rupiah(ongkir)),
                        const SizedBox(height: 6),
                        _row('TOTAL', rupiah(total), bold: true),
                        const SizedBox(height: 16),
                        const Text(
                          'Terima kasih sudah belanja! 🙏',
                          style: TextStyle(color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kLime,
                    foregroundColor: kDark,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () =>
                      Navigator.popUntil(context, (route) => route.isFirst),
                  child: const Text(
                    'Kembali ke Beranda',
                    style: TextStyle(fontWeight: FontWeight.w800),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _row(String kiri, String kanan, {bool bold = false}) {
    final style = TextStyle(
      fontWeight: bold ? FontWeight.w800 : FontWeight.w500,
      fontSize: bold ? 16 : 14,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(kiri, style: style),
          const SizedBox(width: 12),
          Flexible(
            child: Text(kanan, style: style, textAlign: TextAlign.right),
          ),
        ],
      ),
    );
  }
}

class _DashedLine extends StatelessWidget {
  const _DashedLine();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, c) {
        final jumlah = (c.maxWidth / 8).floor();
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            jumlah,
            (_) => Container(width: 4, height: 1.5, color: Colors.black26),
          ),
        );
      },
    );
  }
}
