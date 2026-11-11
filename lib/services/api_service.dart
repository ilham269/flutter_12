import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/album.dart';
import '../models/post.dart';
import '../constants/api_constants.dart';

class ApiService {
  ApiService({http.Client? client}) : _client = client ?? http.Client();

  final http.Client _client;

  Future<List<Album>> fetchAlbums() async {
    final response = await _client
        .get(Uri.parse('${ApiConstants.baseUrl}${ApiConstants.albumsEndpoint}'))
        .timeout(const Duration(seconds: 10));
    if (response.statusCode != 200) {
      throw Exception('Gagal memuat data (kode: ${response.statusCode})');
    }

    final data = jsonDecode(response.body) as List<dynamic>;
    return data
        .map((item) => Album.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  Future<List<Post>> fetchPosts() async {
    try {
      final response = await _client
          .get(Uri.parse('${ApiConstants.baseUrl}${ApiConstants.postsEndpoint}'))
          .timeout(const Duration(seconds: 10));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as List<dynamic>;
        return data
            .map((item) => Post.fromJson(item as Map<String, dynamic>))
            .toList();
      }

      throw Exception('Gagal memuat data (kode: ${response.statusCode})');
    } on TimeoutException {
      throw Exception('Koneksi terlalu lama. Coba lagi.');
    }
  }

  Future<Post> createPost(String title, String body) async {
    final response = await _client
        .post(
          Uri.parse('${ApiConstants.baseUrl}${ApiConstants.postsEndpoint}'),
          headers: {'Content-Type': 'application/json; charset=UTF-8'},
          body: jsonEncode({'title': title, 'body': body, 'userId': 1}),
        )
        .timeout(const Duration(seconds: 10));

    if (response.statusCode != 201) {
      throw Exception('Gagal membuat post (kode: ${response.statusCode})');
    }

    return Post.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  }
}
