# Pola fetch API (list dari JSONPlaceholder)

Alur: request -> cek 200 -> jsonDecode -> fromJson -> FutureBuilder.

## constants/api_constants.dart
```dart
class ApiConstants {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';
  static const String albumsEndpoint = '/albums';
}
```

## models/album.dart
Album hanya punya `userId`, `id`, `title`. Tidak ada `body` (itu milik /posts).
```dart
class Album {
  final int userId;
  final int id;
  final String title;

  const Album({required this.userId, required this.id, required this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}
```

## services/api_service.dart
```dart
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:praktek/constants/api_constants.dart';
import 'package:praktek/models/album.dart';

class ApiService {
  Future<List<Album>> fetchAlbums() async {
    final url = Uri.parse('${ApiConstants.baseUrl}${ApiConstants.albumsEndpoint}');

    try {
      final response = await http.get(url).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body);
        return data.map((e) => Album.fromJson(e)).toList();
      } else {
        throw Exception('Gagal memuat data (kode: ${response.statusCode})');
      }
    } on TimeoutException {
      throw Exception('Koneksi terlalu lama. Coba lagi.');
    }
  }
}
```

Untuk satu album (`/albums/1`): return `Future<Album>` dan `Album.fromJson(jsonDecode(response.body))` tanpa `.map`.

## Di State halaman
```dart
late Future<List<Album>> _futureAlbums;

@override
void initState() {
  super.initState();
  _futureAlbums = _api.fetchAlbums();
}
```
Tampilkan dengan `FutureBuilder` urutan: hasError, belum hasData (loading), kosong, lalu `ListView.builder`.

## Catatan
- Android wajib punya izin INTERNET di `AndroidManifest.xml`; setelah diubah, stop lalu `flutter run` ulang.
- POST berhasil biasanya status 201, bukan 200. JSONPlaceholder tidak benar-benar menyimpan data.
- Detail halaman: kirim objek lewat constructor dan `Navigator.push` dengan `MaterialPageRoute` (tidak perlu named route).
