import 'package:dio/dio.dart';
import '../helpers/api_client.dart';
import '../model/pasien.dart';

class PasienService {
  Future<List<Pasien>> listData() async {
    final Response response = await ApiClient().get('pasien');
    final List data = response.data as List;
    List<Pasien> result = data.map((json) => Pasien.fromJson(json)).toList();
    return result;
  }

  Future<Pasien> simpan(Pasien pasien) async {
    var data = pasien.toJson();
    final Response response = await ApiClient().post('pasien', data);
    Pasien result = Pasien.fromJson(response.data);
    return result;
  }

  Future<Pasien> ubah(Pasien pasien, String id) async {
    var data = pasien.toJson();
    final Response response = await ApiClient().put('pasien/${id}', data);
    Pasien result = Pasien.fromJson(response.data);
    return result;
  }

  Future<Pasien> getById(String id) async {
    final Response response = await ApiClient().get('pasien/${id}');
    Pasien result = Pasien.fromJson(response.data);
    return result;
  }

  Future<void> hapus(String id) async {
    try {
      final Response response = await ApiClient().delete('pasien/${id}');
      if (response.statusCode == 200) {
        print('Pasien berhasil dihapus');
      } else {
        print('Gagal menghapus pasien: ${response.statusMessage}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
