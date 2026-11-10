import 'package:flutter/material.dart';

class OutputFormScreenEskul extends StatelessWidget {
  final String nama;
  final String jk;
  final String tgllahir;
  final String agama;
  final String kelas;
  final String email;
  final String noTelp;
  final String eskul; // <-- Diubah dari _eskul menjadi eskul

  const OutputFormScreenEskul({
    super.key,
    required this.nama,
    required this.jk,
    required this.tgllahir,
    required this.agama,
    required this.kelas,
    required this.email,
    required this.noTelp,
    required this.eskul, // <-- Diubah dari this._eskul
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hasil Pendaftaran Eskul"),
        backgroundColor: Colors.blueAccent,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: const BorderSide(color: Colors.black12),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 24,
                    horizontal: 16,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _textWidget("Nama", nama),
                      _textWidget("Jenis Kelamin", jk),
                      _textWidget("Tanggal Lahir", tgllahir),
                      _textWidget("Agama", agama),
                      _textWidget("Kelas", kelas),
                      _textWidget("Email", email),
                      _textWidget("Nomor Telepon", noTelp),
                      _textWidget("Eskul", eskul),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _textWidget(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(child: Text(": $value")),
        ],
      ),
    );
  }
}
