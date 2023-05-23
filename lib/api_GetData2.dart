import 'dart:convert';
import 'package:flutter_application_1/model/model_GetData2.dart';
import 'package:http/http.dart' as http;

class ServisAPI {
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com';

  //fetchPostsData(). Fungsi ini mengambil data dari API menggunakan library http
  Future<List<Data>> fetchPostsData() async {
    final response = await http.get(Uri.parse('$_baseUrl/photos'));

    if (response.statusCode == 200) {
      //Data yang diambil berupa list data post,
      final data = jsonDecode(response.body) as List<dynamic>;

      //kemudian data tersebut diubah ke dalam bentuk model Data menggunakan fungsi Data.fromJson()
      return data.map((item) => Data.fromJson(item)).toList();
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}
