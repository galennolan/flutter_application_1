import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'model/produk.dart';

class ServisAPI {
  //Lokasi api json file
  static const String baseUrl =
      'https://8880-103-164-115-58.ngrok-free.app/api';
  Future<List<Produk>> fetchProduk() async {
    final response = await http.get(Uri.parse('$baseUrl/produk'));

    if (response.statusCode == 200) {
      final jsonList = jsonDecode(response.body) as List<dynamic>;
      final produkList = jsonList.map((json) => Produk.fromJson(json)).toList();
      return produkList;
    } else {
      throw Exception('Failed to fetch produk');
    }
  }

  Future<void> deleteProduk(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/produk/$id'));

    if (response.statusCode != 200 && response.statusCode != 204) {
      throw Exception('Failed to delete produk');
    }
  }
}
