import 'package:flutter/material.dart';
import 'package:flutter_application_1/api_GetData2.dart'; // import file api_GetData2.dart
import 'model/model_GetData2.dart'; // import file model_GetData2.dart

class DataListPage extends StatelessWidget {
  final ServisAPI _api = ServisAPI(); // membuat instance dari class ServisAPI

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data List Photo'), // judul halaman
      ),
      body: FutureBuilder<List<Data>>(
        future: _api
            .fetchPostsData(), // mengambil data dari API menggunakan method fetchPostsData() dari instance _api
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // jika snapshot memiliki data
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final item = snapshot.data![index];
                return Card(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ListTile(
                        title: Padding(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child: Text(
                              item.title.toString()), // menampilkan judul data
                        ),
                        leading: Image.network(item.img),
                        subtitle: Padding(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child: Text(item.body),
                        )),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            // jika snapshot memiliki error
            return Center(
                child: Text(
                    'Error fetching data')); // menampilkan teks "Error fetching data"
          } else {
            // jika snapshot masih loading
            return Center(
                child:
                    CircularProgressIndicator()); // menampilkan sebuah CircularProgressIndicator
          }
        },
      ),
    );
  }
}
