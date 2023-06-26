import 'package:flutter/material.dart';
import '../../service/pegawai_service.dart';
import 'pegawai_page.dart';
import 'pegawai_update_form.dart';
import '../../model/pegawai.dart';

class PegawaiDetail extends StatefulWidget {
  final Pegawai pegawai;

  const PegawaiDetail({Key? key, required this.pegawai}) : super(key: key);

  @override
  _PegawaiDetailState createState() => _PegawaiDetailState();
}

class _PegawaiDetailState extends State<PegawaiDetail> {
  Stream<Pegawai> getData() async* {
    Pegawai data = await PegawaiService().getById(widget.pegawai.id.toString());
    yield data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail Pegawai")),
      body: StreamBuilder(
        stream: getData(),
        builder: (context, AsyncSnapshot<Pegawai> snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          if (snapshot.connectionState != ConnectionState.done) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            return Text('Data Tidak Ditemukan');
          }
          return Column(
            children: [
              Text(
                "Nama: ${snapshot.data?.nama ?? ''}",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  if (snapshot.data != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            PegawaiUpdateForm(pegawai: snapshot.data!),
                      ),
                    );
                  }
                },
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  AlertDialog alertDialog = AlertDialog(
                    content: const Text("Yakin ingin menghapus data ini?"),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Tidak"),
                        style: ElevatedButton.styleFrom(primary: Colors.green),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          await PegawaiService()
                              .hapus(snapshot.data!)
                              .then((value) {
                            Navigator.pop(context);
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PegawaiPage()),
                            );
                          });
                        },
                        child: const Text("YA"),
                        style: ElevatedButton.styleFrom(primary: Colors.red),
                      ),
                    ],
                  );
                  showDialog(
                    context: context,
                    builder: (context) => alertDialog,
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
