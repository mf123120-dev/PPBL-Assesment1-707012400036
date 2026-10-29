import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/produk.dart';
import '../providers/favorit_provider.dart';
import '../cubits/keranjang_cubit.dart';

class HalamanProduk extends StatefulWidget {
  const HalamanProduk({super.key});

  @override
  State<HalamanProduk> createState() => _HalamanProdukState();
}

class _HalamanProdukState extends State<HalamanProduk> {
  // Simpan data produk dalam List local[cite: 1, 2]
  final List<Produk> daftarproduk = [
    Produk(nama: 'Pupuk Kompos Organik', harga: 15000),
    Produk(nama: 'Pot Tanaman Daur Ulang', harga: 25000),
    Produk(nama: 'Tas Kemasan Daur Ulang', harga: 15000),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Katalog Produk'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: daftarproduk.length,
              itemBuilder: (context, index) {
                final produk = daftarproduk[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 6.0,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          produk.nama,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text('Harga: Rp${produk.harga}'),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Tombol (+) dan (-) menggunakan setState()[cite: 2]
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.remove_circle_outline),
                                  onPressed: () {
                                    setState(() {
                                      // Memastikan jumlah tidak kurang dari 1[cite: 2]
                                      if (produk.jumlah > 1) {
                                        produk.jumlah--;
                                      }
                                    });
                                  },
                                ),
                                Text(
                                  '${produk.jumlah}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.add_circle_outline),
                                  onPressed: () {
                                    setState(() {
                                      produk.jumlah++;
                                    });
                                  },
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                // Tombol Tambah Favorit (Provider)[cite: 4]
                                IconButton(
                                  icon: const Icon(
                                    Icons.favorite_border,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {
                                    Provider.of<FavoritProvider>(
                                      context,
                                      listen: false,
                                    ).tambahFavorit();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          '${produk.nama} ditambahkan ke favorit',
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                // Tombol Tambah Keranjang (Cubit)[cite: 4]
                                ElevatedButton(
                                  onPressed: () {
                                    context
                                        .read<KeranjangCubit>()
                                        .tambahKeranjang();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          '${produk.nama} dimasukkan ke keranjang',
                                        ),
                                      ),
                                    );
                                  },
                                  child: const Text('+ Keranjang'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          Container(
            padding: const EdgeInsets.all(16),
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Kembali'),
                ),
                const SizedBox(height:20),
                Consumer<FavoritProvider>(
                  builder: (context, favorit, child) {
                    return Text(
                      'Jumlah Favorit: ${favorit.jumlahFavorit}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    );
                  },
                ),

                const SizedBox(height: 8),

                BlocBuilder<KeranjangCubit, int>(
                  builder: (context, jumlah) {
                    return Text(
                      'Jumlah Barang di Keranjang: $jumlah',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
