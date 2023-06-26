import 'package:flutter/material.dart';
import '../../model/pegawai.dart';
import '../../service/pegawai_service.dart';
import 'pegawai_detail.dart';
import 'pegawai_form.dart';
import 'pegawai_item.dart';
import '../../widget/sidebar.dart';

class PegawaiPage extends StatefulWidget {
  const PegawaiPage({Key? key}) : super(key: key);
  _PegawaiPageState createState() => _PegawaiPageState();
}

class _PegawaiPageState extends State<PegawaiPage> {
  late Future<List<Pegawai>> _pegawaiFuture;

  @override
  void initState() {
    super.initState();
    _refreshData();
  }

//reload pa
  Future<void> _refreshData() async {
    setState(() {
      _pegawaiFuture = PegawaiService().listData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
        title: const Text("Data Pegawai"),
        actions: [
          GestureDetector(
            child: const Icon(Icons.add),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PegawaiForm()),
              );
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: FutureBuilder<List<Pegawai>>(
          future: _pegawaiFuture,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            if (snapshot.connectionState != ConnectionState.done) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Text('Data Kosong');
            }

            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return PegawaiItem(pegawai: snapshot.data![index]);
              },
            );
          },
        ),
      ),
    );
  }
}
