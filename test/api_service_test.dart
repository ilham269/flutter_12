import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:praktek/models/post.dart';
import 'package:praktek/services/api_service.dart';

void main() {
  test('fetchPosts converts the response JSON into Post models', () async {
    final service = ApiService(
      client: MockClient((request) async {
        expect(request.method, 'GET');
        expect(request.url.path, '/posts');
        return http.Response(
          jsonEncode([
            {'userId': 1, 'id': 2, 'title': 'Judul', 'body': 'Isi'},
          ]),
          200,
        );
      }),
    );

    final posts = await service.fetchPosts();

    expect(posts, hasLength(1));
    expect(posts.single, isA<Post>());
    expect(posts.single.title, 'Judul');
    expect(posts.single.body, 'Isi');
  });

  test('createPost sends JSON and returns the created Post', () async {
    final service = ApiService(
      client: MockClient((request) async {
        expect(request.method, 'POST');
        expect(request.url.path, '/posts');
        expect(request.headers['Content-Type'], 'application/json; charset=UTF-8');
        expect(jsonDecode(request.body), {
          'title': 'Judul',
          'body': 'Isi',
          'userId': 1,
        });
        return http.Response(
          jsonEncode({
            'userId': 1,
            'id': 101,
            'title': 'Judul',
            'body': 'Isi',
          }),
          201,
        );
      }),
    );

    final post = await service.createPost('Judul', 'Isi');

    expect(post.id, 101);
    expect(post.title, 'Judul');
  });
}
