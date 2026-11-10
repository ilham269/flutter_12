import 'package:flutter/material.dart';
import 'package:praktek/routes/app_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // Palet warna biru & putih
  static const Color _blueDark = Color(0xFF0D47A1);
  static const Color _blue = Color(0xFF1976D2);
  static const Color _blueSoft = Color(0xFFE3F0FF);
  static const Color _background = Color(0xFFF6F9FF);

  static const List<_MenuItem> _menus = [
    _MenuItem('Profile', Icons.person_outline, AppRoutes.about),
    _MenuItem('Form Registrasi', Icons.app_registration, AppRoutes.inputform),
    _MenuItem('Pendaftaran Eskul', Icons.groups_outlined, AppRoutes.inputeskul),
    _MenuItem('List View', Icons.view_list_outlined, AppRoutes.listView),
    _MenuItem('SingleChildScrollView', Icons.swap_vert, AppRoutes.singlechild),
    _MenuItem('Latihan 3', Icons.looks_3_outlined, AppRoutes.latihan3),
    _MenuItem('Latihan 4', Icons.looks_4_outlined, AppRoutes.latihan4),
    _MenuItem('Latihan 5', Icons.looks_5_outlined, AppRoutes.latihan5),
    _MenuItem('Latihan 6', Icons.looks_6_outlined, AppRoutes.latihan6),
    _MenuItem(
      'Latihan Container',
      Icons.crop_square,
      AppRoutes.latihanContainer,
    ),
    _MenuItem(
      'Latihan Container 2',
      Icons.dashboard_customize_outlined,
      AppRoutes.latihanContainer2,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _background,
      body: Column(
        children: [
          _buildHeader(),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
              itemCount: _menus.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
                childAspectRatio: 1.1,
              ),
              itemBuilder: (context, index) =>
                  _buildMenuCard(context, _menus[index]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [_blueDark, _blue],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.only(top: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Halo, selamat datang kang ilham',
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
              SizedBox(height: 6),
              Text(
                'Halaman utama',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.3,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Pilih menu untuk mulai latihan',
                style: TextStyle(color: Colors.white70, fontSize: 13),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuCard(BuildContext context, _MenuItem item) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () => Navigator.pushNamed(context, item.route),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: _blueSoft, width: 1.5),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: _blueSoft,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(item.icon, color: _blue, size: 24),
              ),
              Text(
                item.label,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: _blueDark,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  height: 1.25,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuItem {
  final String label;
  final IconData icon;
  final String route;

  const _MenuItem(this.label, this.icon, this.route);
}
