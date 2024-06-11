class Pasien {
  int? id;
  String nama;
  String noRm;
  String tanggalLahir; // Mengubah ke String
  String nomorTelepon;
  String alamat;

  Pasien({
    this.id,
    required this.nama,
    required this.noRm,
    required this.tanggalLahir,
    required this.nomorTelepon,
    required this.alamat,
  });

  factory Pasien.fromJson(Map<String, dynamic> json) => Pasien(
        id: json["id"],
        noRm: json["no_rm"] ?? '',
        nama: json["nama"] ?? '',
        tanggalLahir: json["tgl_lahir"] ?? '', // Menggunakan String langsung
        nomorTelepon: json["no_telp"] ?? '',
        alamat: json["alamat"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        if (id != null) "id": id, // Hanya tambahkan ID jika tidak null
        "no_rm": noRm,
        "nama": nama,
        "tgl_lahir": tanggalLahir, // Menggunakan String langsung
        "no_telp": nomorTelepon,
        "alamat": alamat,
      };
}
