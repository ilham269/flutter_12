import 'package:flutter/material.dart';

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

class StrukPage extends StatelessWidget {
  StrukPage({
    super.key,
    required this.item,
    required this.quantity,
    required this.paymentMethod,
    required this.shippingAddress,
    required this.courierName,
    required this.shippingCost,
    required this.useInsurance,
    required this.usePoin,
  })  : transactionTime = DateTime.now(),
        orderNumber = 'EL-${DateTime.now().millisecondsSinceEpoch}';

  final Map<String, dynamic> item;
  final int quantity;
  final String paymentMethod;
  final Map<String, dynamic> shippingAddress;
  final String courierName;
  final int shippingCost;
  final bool useInsurance;
  final bool usePoin;
  final DateTime transactionTime;
  final String orderNumber;

  static const int _insuranceCost = 5000;
  static const int _poinDiscount = 1500;

  @override
  Widget build(BuildContext context) {
    final unitPrice = item['harga'] as int;
    final subtotal = unitPrice * quantity;
    final insurance = useInsurance ? _insuranceCost : 0;
    final poin = usePoin ? _poinDiscount : 0;
    final total = subtotal + shippingCost + insurance - poin;

    return Scaffold(
      backgroundColor: _lightGray,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Struk Pembayaran'),
        backgroundColor: _lightGray,
        surfaceTintColor: Colors.transparent,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // ─ Header sukses ─
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 34,
                      backgroundColor: _lime,
                      child: Icon(Icons.check, color: _darkText, size: 40),
                    ),
                    const SizedBox(height: 14),
                    const Text(
                      'Pembayaran Berhasil',
                      style: TextStyle(
                        color: _darkText,
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      _formatDateTime(transactionTime),
                      style: const TextStyle(color: Colors.black54),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // ─ Info Pesanan ─
              _buildCard(
                children: [
                  _receiptRow('Nomor Pesanan', orderNumber),
                  const SizedBox(height: 14),
                  _receiptRow('Metode Pembayaran', paymentMethod),
                  const SizedBox(height: 14),
                  _receiptRow('Kurir', courierName),
                  const Divider(height: 28),

                  // Rincian Barang
                  const Text(
                    'Rincian Barang',
                    style: TextStyle(
                      color: _darkText,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _receiptRow(
                    '${item['nama']}  ($quantity x ${_formatRupiah(unitPrice)})',
                    _formatRupiah(subtotal),
                  ),
                  const Divider(height: 28),

                  _receiptRow('Subtotal', _formatRupiah(subtotal)),
                  const SizedBox(height: 12),
                  _receiptRow('Ongkos Kirim', _formatRupiah(shippingCost)),
                  if (useInsurance) ...[
                    const SizedBox(height: 12),
                    _receiptRow('Asuransi', _formatRupiah(_insuranceCost)),
                  ],
                  if (usePoin) ...[
                    const SizedBox(height: 12),
                    _receiptRow(
                      'Diskon Poin',
                      '-${_formatRupiah(_poinDiscount)}',
                    ),
                  ],
                  const Divider(height: 28),
                  _receiptRow('Total', _formatRupiah(total),
                      isEmphasized: true),
                ],
              ),
              const SizedBox(height: 16),

              // ─ Alamat Pengiriman ─
              _buildCard(
                children: [
                  const Text(
                    'Alamat Pengiriman',
                    style: TextStyle(
                      color: _darkText,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _addressRow(
                      Icons.person_outline, shippingAddress['nama'] as String),
                  _addressRow(
                      Icons.phone_outlined, shippingAddress['hp'] as String),
                  _addressRow(
                    Icons.location_on_outlined,
                    '${shippingAddress['alamatLengkap']}\n'
                        '${shippingAddress['kecamatan']}, ${shippingAddress['kota']}\n'
                        '${shippingAddress['provinsi']} ${shippingAddress['kodePos']}',
                  ),
                  if ((shippingAddress['patokan'] as String).isNotEmpty)
                    _addressRow(Icons.flag_outlined,
                        'Patokan: ${shippingAddress['patokan']}'),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: _lime,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          shippingAddress['label'] as String,
                          style: const TextStyle(
                            color: _darkText,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      if (shippingAddress['alamatUtama'] == true) ...[
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            'Alamat Utama',
                            style: TextStyle(
                              color: Colors.blue.shade700,
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // ─ Tombol kembali ─
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () =>
                      Navigator.popUntil(context, (route) => route.isFirst),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _lime,
                    foregroundColor: _darkText,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    'Kembali ke Beranda',
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

  Widget _buildCard({required List<Widget> children}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }

  Widget _receiptRow(String label, String value, {bool isEmphasized = false}) {
    final textStyle = TextStyle(
      color: _darkText,
      fontWeight: isEmphasized ? FontWeight.w800 : FontWeight.w500,
      fontSize: isEmphasized ? 16 : 14,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: Text(label, style: textStyle)),
        const SizedBox(width: 12),
        Text(value, style: textStyle),
      ],
    );
  }

  Widget _addressRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 18, color: Colors.black54),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(color: _darkText, height: 1.4),
            ),
          ),
        ],
      ),
    );
  }

  String _formatDateTime(DateTime dateTime) {
    String twoDigits(int value) => value.toString().padLeft(2, '0');

    return '${twoDigits(dateTime.day)}/${twoDigits(dateTime.month)}/${dateTime.year} '
        '${twoDigits(dateTime.hour)}:${twoDigits(dateTime.minute)}';
  }
}
