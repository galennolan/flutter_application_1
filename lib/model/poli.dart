class Poli {
  String?
      id; // 1. Deklarasi variabel id dengan tipe data String yang opsional (?)
  String namaPoli; // 2. Deklarasi variabel namaPoli dengan tipe data String

  Poli(
      {this.id,
      required this.namaPoli}); // 3. Konstruktor untuk kelas Poli dengan parameter id opsional dan namaPoli yang wajib diisi
}
