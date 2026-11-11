import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const _latihan = <_LatihanMenu>[
    _LatihanMenu(
      title: 'Latihan 3',
      subtitle: 'Row dan Expanded',
      icon: Icons.view_column_outlined,
      route: '/latihan-3',
    ),
    _LatihanMenu(
      title: 'Latihan 4',
      subtitle: 'Tampilan profil',
      icon: Icons.person_outline,
      route: '/latihan-4',
    ),
    _LatihanMenu(
      title: 'Latihan 5',
      subtitle: 'Halaman profil sosial',
      icon: Icons.account_circle_outlined,
      route: '/latihan-5',
    ),
    _LatihanMenu(
      title: 'Latihan 6',
      subtitle: 'Beranda Instagram',
      icon: Icons.photo_camera_outlined,
      route: '/latihan-6',
    ),
    _LatihanMenu(
      title: 'Formulir Eskul',
      subtitle: 'Input dan validasi formulir',
      icon: Icons.assignment_outlined,
      route: '/input-eskul',
    ),
    _LatihanMenu(
      title: 'Formulir',
      subtitle: 'Latihan input data',
      icon: Icons.edit_note_outlined,
      route: '/input-form',
    ),
    _LatihanMenu(
      title: 'Container',
      subtitle: 'Form pendaftaran eskul',
      icon: Icons.widgets_outlined,
      route: '/latihan-container',
    ),
    _LatihanMenu(
      title: 'Kartu Identitas',
      subtitle: 'Latihan layout container',
      icon: Icons.badge_outlined,
      route: '/latihan-container-2',
    ),
    _LatihanMenu(
      title: 'List View',
      subtitle: 'Daftar kontak',
      icon: Icons.list_alt,
      route: '/list-view',
    ),
    _LatihanMenu(
      title: 'Grid View',
      subtitle: 'Tampilan kisi',
      icon: Icons.grid_view_outlined,
      route: '/grid-view',
    ),
    _LatihanMenu(
      title: 'SingleChildScrollView',
      subtitle: 'Konten yang dapat digulir',
      icon: Icons.swap_vert,
      route: '/singlechild',
    ),
    _LatihanMenu(
      title: 'API Album',
      subtitle: 'Fetch data dari internet',
      icon: Icons.album_outlined,
      route: '/album',
    ),
    _LatihanMenu(
      title: 'Fetch API Post',
      subtitle: 'Daftar post dan detail dari internet',
      icon: Icons.cloud_download_outlined,
      route: '/posts',
    ),
  ];

  void _bukaToko(BuildContext context) {
    Navigator.pushNamed(context, '/store');
  }

  @override
  Widget build(BuildContext context) {
    const warnaUtama = Color(0xFF176B5B);

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7F8),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 12),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Dashboard Latihan',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF172321),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Pilih latihan yang ingin kamu buka.',
                      style: TextStyle(color: Colors.grey.shade700),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () => _bukaToko(context),
                        icon: const Icon(Icons.storefront_outlined),
                        label: const Text('Toko Online'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: warnaUtama,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Daftar Latihan',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF172321),
                      ),
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final latihan = _latihan[index];
                  return _LatihanCard(
                    latihan: latihan,
                    onTap: () => Navigator.pushNamed(context, latihan.route),
                  );
                }, childCount: _latihan.length),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LatihanMenu {
  const _LatihanMenu({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.route,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final String route;
}

class _LatihanCard extends StatelessWidget {
  const _LatihanCard({required this.latihan, required this.onTap});

  final _LatihanMenu latihan;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(latihan.icon, color: const Color(0xFF176B5B), size: 28),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    latihan.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 4),

                  Text(
                    latihan.subtitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
