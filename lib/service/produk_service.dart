import 'package:dio/dio.dart';
import '../helpers/api_client.dart';
import '../model/produk.dart';

class ProdukService {
  Future<List<Produk>> listData() async {
    final Response response = await ApiClient().get('produk');
    final List data = response.data as List;
    List<Produk> result = data.map((json) => Produk.fromJson(json)).toList();
    return result;
  }

  Future<Produk> simpan(Produk produk) async {
    var data = produk.toJson();
    final Response response = await ApiClient().post('produk', data);
    Produk result = Produk.fromJson(response.data);
    return result;
  }

  Future<Produk> ubah(Produk produk, String id) async {
    var data = produk.toJson();
    final Response response = await ApiClient().put('produk/$id', data);
    Produk result = Produk.fromJson(response.data);
    return result;
  }

  Future<Produk> getById(String id) async {
    final Response response = await ApiClient().get('produk/$id');
    Produk result = Produk.fromJson(response.data);
    return result;
  }

  Future<Produk> hapus(Produk produk) async {
    final Response response = await ApiClient().delete('produk/${produk.id}');
    Produk result = Produk.fromJson(response.data);
    return result;
  }
}
