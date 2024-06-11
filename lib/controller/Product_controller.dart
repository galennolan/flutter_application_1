import 'package:dio/dio.dart';
import '../helpers/api_client.dart';
import '../model/product_model.dart';

class ProductService {
  Future<List<Product>> listData() async {
    final Response response = await ApiClient().get('products');
    final List data = response.data as List;
    List<Product> result = data.map((json) => Product.fromJson(json)).toList();
    return result;
  }

  Future<Product> simpan(Product product) async {
    var data = product.toJson();
    print('Sending POST request with data: $data');
    final Response response = await ApiClient().post('products', data);
    print('Received response: ${response.data}');
    Product result = Product.fromJson(response.data);
    return result;
  }

  Future<Product> ubah(Product product, int id) async {
    var data = product.toJson();
    print('Sending PUT request with data: $data');
    final Response response = await ApiClient().put('products/$id', data);
    print('Received response: ${response.data}');
    Product result = Product.fromJson(response.data);
    return result;
  }

  Future<Product> getById(int id) async {
    final Response response = await ApiClient().get('products/$id');
    Product result = Product.fromJson(response.data);
    return result;
  }

  Future<Product> hapus(int id) async {
    final Response response = await ApiClient().delete('products/$id');
    Product result = Product.fromJson(response.data);
    return result;
  }
}
