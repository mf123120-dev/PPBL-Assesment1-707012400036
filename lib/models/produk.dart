class Produk {
  final String nama;
  final int harga;
  int jumlah;

  Produk({
    required this.nama,
    required this.harga,
    this.jumlah = 1,
  });
}