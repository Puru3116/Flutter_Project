import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/photo.dart';

class PhotoRepository {
  final http.Client client;
  PhotoRepository({required this.client});

  Future<List<Photo>> fetchPhotos({int limit = 10}) async {
    final res = await client.get(Uri.parse('https://picsum.photos/v2/list?limit=$limit'));
    if (res.statusCode == 200) {
      final List data = jsonDecode(res.body);
      return data.map((e) => Photo.fromJson(e)).toList();
    }
    throw Exception('Failed to load photos');
  }
}
