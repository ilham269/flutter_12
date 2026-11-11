import 'package:flutter/material.dart';

class OutputFormScreenEskul extends StatelessWidget {
  final String nama;
  final String jk;
  final String tgllahir;
  final String agama;
  final String kelas;
  final String email;
  final String noTelp;
  final String eskul;

  const OutputFormScreenEskul({
    super.key,
    required this.nama,
    required this.jk,
    required this.tgllahir,
    required this.agama,
    required this.kelas,
    required this.email,
    required this.noTelp,
    required this.eskul,
  });

  // Palet warna biru & putih (sama dengan Home Page)
  static const Color _blueDark = Color(0xFF0D47A1);
  static const Color _blue = Color(0xFF1976D2);
  static const Color _blueSoft = Color(0xFFE3F0FF);
  static const Color _background = Color(0xFFF6F9FF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _background,
      body: Column(
        children: [
          _buildHeader(context),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 600),
                  child: _buildCard(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(8, 0, 24, 28),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16, top: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hasil Pendaftaran',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Data kamu sudah tersimpan 🎉',
                    style: TextStyle(color: Colors.white70, fontSize: 13),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: _blueSoft, width: 1.5),
      ),
      child: Column(
        children: [
          // Avatar + nama + badge eskul
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: _blueSoft,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.person, color: _blue, size: 36),
          ),
          const SizedBox(height: 12),
          Text(
            nama,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: _blueDark,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              color: _blue,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              eskul,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Divider(color: _blueSoft, thickness: 1.5, height: 1),
          const SizedBox(height: 8),
          _infoRow(Icons.wc, 'Jenis Kelamin', jk),
          _infoRow(Icons.cake_outlined, 'Tanggal Lahir', tgllahir),
          _infoRow(Icons.auto_stories_outlined, 'Agama', agama),
          _infoRow(Icons.school_outlined, 'Kelas', kelas),
          _infoRow(Icons.email_outlined, 'Email', email),
          _infoRow(Icons.phone_outlined, 'Nomor Telepon', noTelp),
        ],
      ),
    );
  }

  Widget _infoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: _blueSoft,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: _blue, size: 18),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(color: Colors.black54, fontSize: 12),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(
                    color: _blueDark,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
