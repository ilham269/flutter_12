---
name: flutter-praktek
description: Aturan kerja untuk project Flutter/Dart "praktek" (tugas SMK RPL). Gunakan skill ini setiap kali user meminta membuat, mengubah, memperbaiki, atau menjelaskan kode Flutter/Dart, termasuk widget, halaman, routing, ListView/GridView, form, fetch API (http, JSON, model, FutureBuilder), atau error Flutter, walaupun user tidak menyebut kata "skill".
---

# Flutter Praktek

Skill ini berisi konteks project dan aturan kerja supaya hasil sesuai keinginan user dan tidak boros token.

## 1. Konteks project (jangan ditanyakan ulang)

- Nama package: `praktek`. Import selalu gaya `package:praktek/...`.
- Struktur `lib/`: `constants/`, `models/`, `services/`, `pages/`, `routes/`, `main.dart`.
- Navigasi memakai named route di `routes/app_routes.dart`. `main.dart` memakai `initialRoute: AppRoutes.home` dan `routes: AppRoutes.routes`. Jangan ubah `main.dart` kecuali diminta.
- Menambah halaman baru butuh 4 hal: (1) import di `app_routes.dart`, (2) `static const` nama route, (3) entry di map `routes`, (4) item `_LatihanMenu` di daftar menu `HomePage` kalau mau muncul di dashboard.
- Penamaan file baru: `snake_case.dart`. Class: `PascalCase`. Jangan rename file lama (beberapa file lama memakai PascalCase, biarkan).
- API memakai package `http`. Alamat API disimpan di `constants/api_constants.dart`, bukan di dalam page.

## 2. Cara kerja

Sebelum menulis kode:
- Kalau permintaan ambigu atau informasi kurang, tanya dulu (maksimal 3 pertanyaan singkat). Jangan menebak.
- Kalau sudah jelas, langsung kerjakan tanpa minta konfirmasi berlebihan.

Saat mengubah kode:
- Ubah hanya file yang diperlukan. Jangan refactor, rename, atau format ulang file lain.
- Mulai dari file yang disebut user. Jangan membaca seluruh project; buka `app_routes.dart` hanya kalau menyangkut route.
- Jangan menambah package baru tanpa izin user.
- Ikuti gaya kode yang sudah ada di file tersebut.

Format jawaban:
- Tampilkan hanya bagian yang berubah, dengan lokasi jelas (nama file dan posisinya). File baru boleh ditulis lengkap.
- Penjelasan singkat: apa yang diubah dan kenapa, 1-3 kalimat per perubahan.
- Jangan mengulang kode yang tidak berubah dan jangan menambah fitur di luar permintaan. Saran tambahan maksimal 1 baris di akhir.
- Bahasa Indonesia yang santai dan jelas. User masih belajar: kalau ada konsep baru, jelaskan singkat satu atau dua kalimat, tanpa ceramah panjang.

## 3. Aturan kode Flutter

- Pakai `const` pada widget dan constructor kalau bisa.
- Jangan memanggil fetch di `build()`. Panggil di `initState()` dan simpan `Future` di variabel `late`.
- `FutureBuilder` harus menangani error, loading, data, dan data kosong. Jangan memakai `snapshot.data!` sebelum cek `hasData`.
- Setelah `await` di dalam `State`, cek `if (!mounted) return;` sebelum `setState` atau `Navigator`.
- Buang controller di `dispose()` (misalnya `TextEditingController`).
- Urutan penanganan error: `try { ... } on JenisError { ... }`. Blok `on` ditulis setelah kurung tutup `try`, bukan di dalamnya.
- Nama key di `fromJson` harus sama persis dengan JSON asli. Cek dulu apakah API mengembalikan satu objek `{}` atau daftar `[]`.

## 4. Kapan membaca file referensi

- Tugas fetch API, JSON, model, atau http: baca `references/fetch-api.md`.
- Ada error, atau sebelum menyatakan pekerjaan selesai: baca `references/checklist.md`.

Jangan baca file referensi kalau tugasnya tidak berkaitan.

## 5. Verifikasi

Setelah mengubah kode, jalankan `flutter analyze` dan perbaiki error yang muncul. Kalau tidak bisa menjalankan perintah, cek manual: import, nama class, nama route, dan kurung. Jangan menulis "sudah dites" kalau tidak benar-benar dijalankan.
