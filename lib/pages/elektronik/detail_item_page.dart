import 'package:flutter/material.dart';

import 'checkout_page.dart';
import 'product_image.dart';

const Color _lime = Color(0xFFC6F000);
const Color _lightGray = Color(0xFFF1F2F2);
const Color _darkText = Color(0xFF202124);

String _formatRupiah(int amount) {
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

class DetailItemPage extends StatefulWidget {
  const DetailItemPage({super.key, required this.item});

  final Map<String, dynamic> item;

  @override
  State<DetailItemPage> createState() => _DetailItemPageState();
}

class _DetailItemPageState extends State<DetailItemPage> {
  int _quantity = 1;
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final item = widget.item;

    return Scaffold(
      backgroundColor: _lightGray,
      appBar: AppBar(
        title: const Text('Detail Produk'),
        backgroundColor: _lightGray,
        surfaceTintColor: Colors.transparent,
        actions: [
          IconButton(
            tooltip: 'Favorit',
            onPressed: () => setState(() => _isFavorite = !_isFavorite),
            icon: Icon(
              _isFavorite ? Icons.favorite : Icons.favorite_border,
              color: _isFavorite ? Colors.red : _darkText,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 230,
                width: double.infinity,
                child: ProductImage(
                  imageUrl: item['imageUrl'] as String,
                  fallbackIcon: item['icon'] as IconData,
                  iconSize: 112,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                item['kategori'] as String,
                style: const TextStyle(color: Colors.black54),
              ),
              const SizedBox(height: 6),
              Text(
                item['nama'] as String,
                style: const TextStyle(
                  color: _darkText,
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.star, color: Color(0xFFFFB300), size: 20),
                  const SizedBox(width: 4),
                  Text('${item['rating']}'),
                  const SizedBox(width: 6),
                  Text(
                    '(${item['ulasan']} ulasan)',
                    style: const TextStyle(color: Colors.black54),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Text(
                _formatRupiah(item['harga'] as int),
                style: const TextStyle(
                  color: _darkText,
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                item['deskripsi'] as String,
                style: const TextStyle(color: Colors.black87, height: 1.5),
              ),
              const SizedBox(height: 24),
              _sectionTitle('Jumlah'),
              const SizedBox(height: 10),
              Row(
                children: [
                  _quantityButton(
                    icon: Icons.remove,
                    onPressed: _quantity > 1
                        ? () => setState(() => _quantity--)
                        : null,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      '$_quantity',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  _quantityButton(
                    icon: Icons.add,
                    onPressed: () => setState(() => _quantity++),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (context) => CheckoutPage(
                          item: item,
                          quantity: _quantity,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _lime,
                    foregroundColor: _darkText,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    'Beli Sekarang',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: _darkText,
        fontWeight: FontWeight.w700,
        fontSize: 16,
      ),
    );
  }

  Widget _quantityButton({
    required IconData icon,
    required VoidCallback? onPressed,
  }) {
    return IconButton.filled(
      onPressed: onPressed,
      style: IconButton.styleFrom(
        backgroundColor: _lime,
        foregroundColor: _darkText,
      ),
      icon: Icon(icon),
    );
  }
}
