import 'package:flutter/material.dart';

import 'struk_page.dart';

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

// ─── Data kurir ───────────────────────────────────────────────────────
class _CourierOption {
  const _CourierOption(this.name, this.cost, this.estimate);
  final String name;
  final int cost;
  final String estimate;
}

const List<_CourierOption> _couriers = [
  _CourierOption('JNE Reguler', 15000, '2-3 hari'),
  _CourierOption('J&T Express', 18000, '1-2 hari'),
  _CourierOption('SiCepat', 20000, '1-2 hari'),
  _CourierOption('GoSend Instant', 25000, 'Hari ini'),
];

const List<String> _provinces = [
  'DKI Jakarta',
  'Jawa Barat',
  'Jawa Tengah',
  'Jawa Timur',
  'Banten',
  'Bali',
];

const int _insuranceCost = 5000;
const int _poinDiscount = 1500;

// ─── Checkout Page ────────────────────────────────────────────────────
class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key, required this.item, required this.quantity});

  final Map<String, dynamic> item;
  final int quantity;

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final _formKey = GlobalKey<FormState>();

  // Alamat
  final _namaController = TextEditingController();
  final _hpController = TextEditingController();
  final _kotaController = TextEditingController();
  final _kecamatanController = TextEditingController();
  final _kodePosController = TextEditingController();
  final _alamatController = TextEditingController();
  final _patokanController = TextEditingController();
  String? _selectedProvinsi;
  String _labelAlamat = 'Rumah';
  bool _isAlamatUtama = false;

  // Kurir
  int _selectedCourierIndex = 0;

  // Pembayaran
  String _paymentMethod = 'Transfer Bank';

  // Kartu
  final _nomorKartuController = TextEditingController();
  final _namaKartuController = TextEditingController();
  final _masaBerlakuController = TextEditingController();
  final _cvvController = TextEditingController();

  // Voucher & Poin
  final _voucherController = TextEditingController();
  bool _usePoin = false;

  // Asuransi
  bool _useInsurance = false;

  @override
  void dispose() {
    _namaController.dispose();
    _hpController.dispose();
    _kotaController.dispose();
    _kecamatanController.dispose();
    _kodePosController.dispose();
    _alamatController.dispose();
    _patokanController.dispose();
    _nomorKartuController.dispose();
    _namaKartuController.dispose();
    _masaBerlakuController.dispose();
    _cvvController.dispose();
    _voucherController.dispose();
    super.dispose();
  }

  _CourierOption get _selectedCourier => _couriers[_selectedCourierIndex];

  int get _subtotal => (widget.item['harga'] as int) * widget.quantity;
  int get _shippingCost => _selectedCourier.cost;
  int get _insuranceTotal => _useInsurance ? _insuranceCost : 0;
  int get _poinTotal => _usePoin ? _poinDiscount : 0;
  int get _total => _subtotal + _shippingCost + _insuranceTotal - _poinTotal;

  void _submitOrder() {
    if (!_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Mohon lengkapi data yang diperlukan'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    if (_selectedProvinsi == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Mohon pilih provinsi'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (context) => StrukPage(
          item: widget.item,
          quantity: widget.quantity,
          paymentMethod: _paymentMethod,
          shippingAddress: {
            'nama': _namaController.text,
            'hp': _hpController.text,
            'provinsi': _selectedProvinsi!,
            'kota': _kotaController.text,
            'kecamatan': _kecamatanController.text,
            'kodePos': _kodePosController.text,
            'alamatLengkap': _alamatController.text,
            'patokan': _patokanController.text,
            'label': _labelAlamat,
            'alamatUtama': _isAlamatUtama,
          },
          courierName: _selectedCourier.name,
          shippingCost: _shippingCost,
          useInsurance: _useInsurance,
          usePoin: _usePoin,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _lightGray,
      appBar: AppBar(
        title: const Text(
          'Checkout',
          style: TextStyle(color: _darkText, fontWeight: FontWeight.w700),
        ),
        backgroundColor: _lightGray,
        surfaceTintColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
            child: Column(
              children: [
                _buildRingkasanProduk(),
                const SizedBox(height: 16),
                _buildAlamatPengiriman(),
                const SizedBox(height: 16),
                _buildPilihKurir(),
                const SizedBox(height: 16),
                _buildMetodePembayaran(),
                const SizedBox(height: 16),
                _buildVoucherPoin(),
                const SizedBox(height: 16),
                _buildAsuransi(),
                const SizedBox(height: 16),
                _buildRincianPembayaran(),
                const SizedBox(height: 24),
                _buildBayarButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ─── Section builders ─────────────────────────────────────────────

  Widget _sectionCard({required String title, required List<Widget> children}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: _darkText,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 14),
          ...children,
        ],
      ),
    );
  }

  // 1 ─ Ringkasan Produk
  Widget _buildRingkasanProduk() {
    final item = widget.item;
    final unitPrice = item['harga'] as int;

    return _sectionCard(
      title: 'Ringkasan Produk',
      children: [
        Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: _lightGray,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(item['icon'] as IconData, color: _darkText, size: 30),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['nama'] as String,
                    style: const TextStyle(
                      color: _darkText,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${widget.quantity}x ${_formatRupiah(unitPrice)}',
                    style: const TextStyle(color: Colors.black54),
                  ),
                ],
              ),
            ),
            Text(
              _formatRupiah(_subtotal),
              style: const TextStyle(
                color: _darkText,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ],
    );
  }

  // 2 ─ Alamat Pengiriman
  Widget _buildAlamatPengiriman() {
    return _sectionCard(
      title: 'Alamat Pengiriman',
      children: [
        _textField(
          controller: _namaController,
          label: 'Nama Penerima',
          icon: Icons.person_outline,
          validator: _requiredValidator('Nama penerima wajib diisi'),
        ),
        const SizedBox(height: 12),
        _textField(
          controller: _hpController,
          label: 'Nomor HP',
          icon: Icons.phone_outlined,
          keyboardType: TextInputType.phone,
          validator: _requiredValidator('Nomor HP wajib diisi'),
        ),
        const SizedBox(height: 12),
        DropdownButtonFormField<String>(
          initialValue: _selectedProvinsi,
          decoration: InputDecoration(
            labelText: 'Provinsi',
            prefixIcon: const Icon(Icons.location_on_outlined),
            filled: true,
            fillColor: _lightGray,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide.none,
            ),
          ),
          items: _provinces
              .map((p) => DropdownMenuItem(value: p, child: Text(p)))
              .toList(),
          onChanged: (value) => setState(() => _selectedProvinsi = value),
          validator: (value) => value == null ? 'Pilih provinsi' : null,
        ),
        const SizedBox(height: 12),
        _textField(
          controller: _kotaController,
          label: 'Kota / Kabupaten',
          icon: Icons.location_city_outlined,
          validator: _requiredValidator('Kota wajib diisi'),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _textField(
                controller: _kecamatanController,
                label: 'Kecamatan',
                icon: Icons.map_outlined,
                validator: _requiredValidator('Kecamatan wajib diisi'),
              ),
            ),
            const SizedBox(width: 12),
            SizedBox(
              width: 130,
              child: _textField(
                controller: _kodePosController,
                label: 'Kode Pos',
                icon: Icons.markunread_mailbox_outlined,
                keyboardType: TextInputType.number,
                validator: _requiredValidator('Wajib diisi'),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        _textField(
          controller: _alamatController,
          label: 'Alamat Lengkap',
          icon: Icons.home_outlined,
          maxLines: 3,
          validator: _requiredValidator('Alamat lengkap wajib diisi'),
        ),
        const SizedBox(height: 12),
        _textField(
          controller: _patokanController,
          label: 'Patokan (opsional)',
          icon: Icons.flag_outlined,
          hint: 'Contoh: Sebelah minimarket',
        ),
        const SizedBox(height: 16),
        const Text(
          'Label Alamat',
          style: TextStyle(
            color: _darkText,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            ChoiceChip(
              label: const Text('Rumah'),
              selected: _labelAlamat == 'Rumah',
              onSelected: (_) => setState(() => _labelAlamat = 'Rumah'),
              selectedColor: _lime,
              backgroundColor: _lightGray,
              side: BorderSide.none,
              labelStyle: TextStyle(
                color: _darkText,
                fontWeight: _labelAlamat == 'Rumah'
                    ? FontWeight.w700
                    : FontWeight.w500,
              ),
            ),
            const SizedBox(width: 10),
            ChoiceChip(
              label: const Text('Kantor'),
              selected: _labelAlamat == 'Kantor',
              onSelected: (_) => setState(() => _labelAlamat = 'Kantor'),
              selectedColor: _lime,
              backgroundColor: _lightGray,
              side: BorderSide.none,
              labelStyle: TextStyle(
                color: _darkText,
                fontWeight: _labelAlamat == 'Kantor'
                    ? FontWeight.w700
                    : FontWeight.w500,
              ),
            ),
          ],
        ),
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text(
            'Jadikan alamat utama',
            style: TextStyle(color: _darkText),
          ),
          value: _isAlamatUtama,
          activeThumbColor: _darkText,
          activeTrackColor: _lime,
          onChanged: (value) => setState(() => _isAlamatUtama = value),
        ),
      ],
    );
  }

  // 3 ─ Pilih Kurir
  Widget _buildPilihKurir() {
    return _sectionCard(
      title: 'Pilih Kurir / Pengiriman',
      children: [
        RadioGroup<int>(
          groupValue: _selectedCourierIndex,
          onChanged: (value) {
            if (value != null) {
              setState(() => _selectedCourierIndex = value);
            }
          },
          child: Column(
            children: [
              for (var i = 0; i < _couriers.length; i++)
                RadioListTile<int>(
                  value: i,
                  activeColor: _darkText,
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    _couriers[i].name,
                    style: const TextStyle(
                      color: _darkText,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(
                    '${_formatRupiah(_couriers[i].cost)} • ${_couriers[i].estimate}',
                    style: const TextStyle(color: Colors.black54, fontSize: 13),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  // 4 ─ Metode Pembayaran
  Widget _buildMetodePembayaran() {
    const methods = <Map<String, dynamic>>[
      {'value': 'Transfer Bank', 'icon': Icons.account_balance},
      {'value': 'E-Wallet', 'icon': Icons.account_balance_wallet_outlined},
      {'value': 'COD', 'icon': Icons.local_shipping_outlined},
      {'value': 'Kartu Kredit/Debit', 'icon': Icons.credit_card},
    ];

    return _sectionCard(
      title: 'Metode Pembayaran',
      children: [
        RadioGroup<String>(
          groupValue: _paymentMethod,
          onChanged: (value) {
            if (value != null) {
              setState(() => _paymentMethod = value);
            }
          },
          child: Column(
            children: [
              for (final m in methods)
                Card(
                  color: Colors.white,
                  elevation: 0,
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                    side: BorderSide(
                      color: _paymentMethod == m['value']
                          ? _darkText
                          : Colors.grey.shade200,
                    ),
                  ),
                  child: RadioListTile<String>(
                    value: m['value'] as String,
                    activeColor: _darkText,
                    title: Text(m['value'] as String),
                    secondary: Icon(m['icon'] as IconData, color: _darkText),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                  ),
                ),
            ],
          ),
        ),
        // Kartu input fields
        AnimatedCrossFade(
          firstChild: const SizedBox.shrink(),
          secondChild: Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: _lightGray,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  _textField(
                    controller: _nomorKartuController,
                    label: 'Nomor Kartu',
                    icon: Icons.credit_card,
                    keyboardType: TextInputType.number,
                    maxLength: 16,
                    validator: _paymentMethod == 'Kartu Kredit/Debit'
                        ? _requiredValidator('Nomor kartu wajib diisi')
                        : null,
                  ),
                  const SizedBox(height: 12),
                  _textField(
                    controller: _namaKartuController,
                    label: 'Nama di Kartu',
                    icon: Icons.person_outline,
                    validator: _paymentMethod == 'Kartu Kredit/Debit'
                        ? _requiredValidator('Nama di kartu wajib diisi')
                        : null,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: _textField(
                          controller: _masaBerlakuController,
                          label: 'Masa Berlaku',
                          icon: Icons.calendar_today_outlined,
                          hint: 'MM/YY',
                          validator: _paymentMethod == 'Kartu Kredit/Debit'
                              ? _requiredValidator('Wajib diisi')
                              : null,
                        ),
                      ),
                      const SizedBox(width: 12),
                      SizedBox(
                        width: 120,
                        child: _textField(
                          controller: _cvvController,
                          label: 'CVV',
                          icon: Icons.lock_outline,
                          obscureText: true,
                          maxLength: 3,
                          keyboardType: TextInputType.number,
                          validator: _paymentMethod == 'Kartu Kredit/Debit'
                              ? _requiredValidator('Wajib diisi')
                              : null,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          crossFadeState: _paymentMethod == 'Kartu Kredit/Debit'
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 300),
        ),
      ],
    );
  }

  // 5 ─ Voucher & Poin
  Widget _buildVoucherPoin() {
    return _sectionCard(
      title: 'Voucher & Poin',
      children: [
        Row(
          children: [
            Expanded(
              child: _textField(
                controller: _voucherController,
                label: 'Kode Voucher',
                icon: Icons.confirmation_number_outlined,
              ),
            ),
            const SizedBox(width: 12),
            OutlinedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Voucher belum tersedia'),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: _darkText,
                side: const BorderSide(color: _darkText),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: const Text('Terapkan'),
            ),
          ],
        ),
        const SizedBox(height: 4),
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text(
            'Pakai Poin',
            style: TextStyle(color: _darkText, fontWeight: FontWeight.w600),
          ),
          subtitle: const Text('Anda memiliki 1.500 poin'),
          value: _usePoin,
          activeThumbColor: _darkText,
          activeTrackColor: _lime,
          onChanged: (value) => setState(() => _usePoin = value),
        ),
      ],
    );
  }

  // 6 ─ Asuransi Pengiriman
  Widget _buildAsuransi() {
    return _sectionCard(
      title: 'Asuransi Pengiriman',
      children: [
        CheckboxListTile(
          contentPadding: EdgeInsets.zero,
          value: _useInsurance,
          activeColor: _darkText,
          checkColor: _lime,
          onChanged: (value) => setState(() => _useInsurance = value ?? false),
          title: Text(
            'Asuransi Pengiriman (${_formatRupiah(_insuranceCost)})',
            style: const TextStyle(
              color: _darkText,
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: const Text(
            'Lindungi paket Anda dari kerusakan atau kehilangan',
          ),
        ),
      ],
    );
  }

  // 7 ─ Rincian Pembayaran
  Widget _buildRincianPembayaran() {
    return _sectionCard(
      title: 'Rincian Pembayaran',
      children: [
        _summaryRow('Subtotal', _formatRupiah(_subtotal)),
        const SizedBox(height: 10),
        _summaryRow(
          'Ongkos Kirim (${_selectedCourier.name})',
          _formatRupiah(_shippingCost),
        ),
        const SizedBox(height: 10),
        _summaryRow(
          'Asuransi',
          _useInsurance ? _formatRupiah(_insuranceCost) : _formatRupiah(0),
        ),
        if (_usePoin) ...[
          const SizedBox(height: 10),
          _summaryRow(
            'Diskon Poin',
            '-${_formatRupiah(_poinDiscount)}',
            color: Colors.green,
          ),
        ],
        const Divider(height: 28),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Total',
              style: TextStyle(
                color: _darkText,
                fontWeight: FontWeight.w800,
                fontSize: 18,
              ),
            ),
            Text(
              _formatRupiah(_total),
              style: const TextStyle(
                color: _darkText,
                fontWeight: FontWeight.w800,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ],
    );
  }

  // 8 ─ Button Bayar
  Widget _buildBayarButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _submitOrder,
        style: ElevatedButton.styleFrom(
          backgroundColor: _lime,
          foregroundColor: _darkText,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: const Text(
          'Bayar Sekarang',
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
        ),
      ),
    );
  }

  // ─── Helper widgets ───────────────────────────────────────────────

  Widget _textField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType? keyboardType,
    int? maxLines,
    int? maxLength,
    bool obscureText = false,
    String? hint,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: obscureText ? 1 : (maxLines ?? 1),
      maxLength: maxLength,
      obscureText: obscureText,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon),
        counterText: '',
        filled: true,
        fillColor: _lightGray,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _summaryRow(String label, String value, {Color? color}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            label,
            style: const TextStyle(color: Colors.black54, fontSize: 14),
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: color ?? _darkText,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  String? Function(String?) _requiredValidator(String message) {
    return (value) {
      if (value == null || value.trim().isEmpty) return message;
      return null;
    };
  }
}
