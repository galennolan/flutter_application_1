import 'package:flutter/material.dart';

class Barang extends StatefulWidget {
  @override
  _BarangState createState() => _BarangState();
}

class _BarangState extends State<Barang> {
  TextEditingController searchController = TextEditingController();
  List<Map<String, dynamic>> allItems = [
    {
      'name': 'Adaptor yuwell YE660B dc5v',
      'code': 'adactoryuwellb',
      'price': 65000,
      'basePrice': 48000,
      'stock': 1,
      'image': 'assets/adaptor.jpg',
    },
    {
      'name': 'Alat bantu dengar SM 339',
      'code': 'sm339',
      'price': 169000,
      'basePrice': 125000,
      'stock': 1,
      'image': 'assets/alat_bantu_dengar.jpg',
    },
    {
      'name': 'Alat transfer oksigen 1 titik',
      'code': 'alttrf1ttik',
      'price': 500000,
      'basePrice': 350000,
      'stock': 3,
      'image': 'assets/alat_transfer_oksigen.jpg',
    },
    // Tambahkan item lainnya sesuai kebutuhan
  ];
  List<Map<String, dynamic>> displayedItems = [];

  @override
  void initState() {
    super.initState();
    displayedItems = allItems;
  }

  void filterSearchResults(String query) {
    List<Map<String, dynamic>> dummySearchList = [];
    dummySearchList.addAll(allItems);
    if (query.isNotEmpty) {
      List<Map<String, dynamic>> dummyListData = [];
      dummySearchList.forEach((item) {
        if (item['name'].toLowerCase().contains(query.toLowerCase())) {
          dummyListData.add(item);
        }
      });
      setState(() {
        displayedItems = dummyListData;
      });
      return;
    } else {
      setState(() {
        displayedItems = allItems;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Barang'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              onChanged: (value) {
                filterSearchResults(value);
              },
              decoration: InputDecoration(
                labelText: "Cari nama atau kode barang",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: displayedItems.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 3.0,
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: ListTile(
                    leading: Image.asset(
                      displayedItems[index]['image'],
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(displayedItems[index]['name']),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(displayedItems[index]['code']),
                        Text(
                            'Hrg dasar Rp ${displayedItems[index]['basePrice']}'),
                      ],
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Rp ${displayedItems[index]['price']}'),
                        Text('${displayedItems[index]['stock']}'),
                      ],
                    ),
                    onTap: () {
                      // Aksi yang diinginkan saat di-tap
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Theme.of(context).primaryColor,
              ),
              onPressed: () {
                // Aksi yang diinginkan saat tombol Tambah Barang di-tap
              },
              child: Text('Tambah Barang'),
            ),
          ),
        ],
      ),
    );
  }
}
