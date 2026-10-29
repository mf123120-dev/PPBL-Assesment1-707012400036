import 'package:flutter/material.dart';
import 'halaman_produk.dart';
import 'halaman_form.dart';
import 'halaman_lokasi.dart';

class HalamanBeranda extends StatelessWidget {
  const HalamanBeranda({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EcoMart'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'EcoMart - Produk Daur Ulang',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Komunitas Bank Sampah Hijau Bandung memproduksi berbagai barang ramah lingkungan, seperti tas daur ulang dan kerajinan tangan.',
              style: TextStyle(fontSize: 15),
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {
                // Perpindahan ke Katalog menggunakan Navigator.push[cite: 1]
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HalamanProduk()),
                );
              },
              child: const Text('Lihat Produk'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HalamanForm()),
                );
              },
              child: const Text('Form Pemesanan'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HalamanLokasi()),
                );
              },
              child: const Text('Lokasi Komunitas (Google Maps)'),
            ),
          ],
        ),
      ),
    );
  }
}
