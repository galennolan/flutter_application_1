import 'package:flutter/material.dart';
import 'package:flutter_application_1/api_service_produk.dart';

class Test extends StatelessWidget {
  const Test({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Test Doank')),
      body: Card(
        child: PostList(),
      ),
    );
  }
}

class PostList extends StatefulWidget {
  const PostList({Key? key});

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  late Future<List<dynamic>> _posts;

  @override
  void initState() {
    super.initState();

    //inisiasi variabel _posts yang merupakan pemanggilan fungsi 'fetchPosts() di class servisapi()
    _posts = ServisAPI().fetchProduk();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: _posts,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final item = snapshot.data![index];
              return GestureDetector(
                child: Card(
                  child: Column(
                    children: [
                      Text('ID: ${item['id']}'),
                      Text('Nama Produk: ${item['nama_produk']}'),
                      Text('Stok: ${item['stok']}'),
                      Text('Harga: ${item['harga']}'),
                    ],
                  ),
                ),
              );
            },
          );
        } else if (snapshot.hasError) {
          return Center(child: Text('${snapshot.error}'));
        }
        return Center(child: CircularProgressIndicator(color: Colors.black));
      },
    );
  }
}
