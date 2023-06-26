class Pasien {
  int? id;
  String nomor_rm;
  String nama;
  DateTime tanggalLahir;
  String nomorTelepon;
  String alamat;

  Pasien(
      {this.id,
      required this.nomor_rm,
      required this.nama,
      required this.tanggalLahir,
      required this.nomorTelepon,
      required this.alamat});

  factory Pasien.fromJson(Map<String, dynamic> json) => Pasien(
      id: json["id"],
      nomor_rm: json["nomor_rm"],
      nama: json["nama"],
      tanggalLahir: DateTime.parse(json["tanggal_lahir"]),
      nomorTelepon: json["nomor_telepon"],
      alamat: json["alamat"]);

  Map<String, dynamic> toJson() => {
        "nomor_rm": nomor_rm,
        "nama": nama,
        "tanggal_lahir": tanggalLahir.toIso8601String(),
        "nomor_telepon": nomorTelepon,
        "alamat": alamat
      };
}
