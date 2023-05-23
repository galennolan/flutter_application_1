class Produk {
  final int id;
  final String namaProduk;
  final int stok;
  final String harga;

  Produk(
      {required this.id,
      required this.namaProduk,
      required this.stok,
      required this.harga});

  factory Produk.fromJson(Map<String, dynamic> json) {
    return Produk(
      id: json['id'],
      namaProduk: json['nama_produk'],
      stok: json['stok'],
      harga: json['harga'],
    );
  }
}
