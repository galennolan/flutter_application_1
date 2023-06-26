class Produk {
  int? id;
  String nama_produk;
  int stok;
  String img;
  String harga;

  Produk({
    this.id,
    required this.nama_produk,
    required this.stok,
    required this.img,
    required this.harga,
  });

  factory Produk.fromJson(Map<String, dynamic> json) => Produk(
        id: json["id"],
        nama_produk: json["nama_produk"],
        stok: json["stok"],
        img: json["img"],
        harga: json["harga"],
      );

  Map<String, dynamic> toJson() => {
        "nama_produk": nama_produk,
        "stok": stok,
        "img": img,
        "harga": harga,
      };
}
