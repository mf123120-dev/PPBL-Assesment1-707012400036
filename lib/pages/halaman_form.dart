import 'package:flutter/material.dart';

class HalamanForm extends StatefulWidget {
  const HalamanForm({super.key});

  @override
  State<HalamanForm> createState() => _HalamanFormState();
}

class _HalamanFormState extends State<HalamanForm> {
  final _namaController = TextEditingController();
  final _alamatController = TextEditingController();
  // String? _kelas;
  // final _nilaiController = TextEditingController();r
  String _metodePengiriman = 'Diantar';
  bool _isAgreed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form Pemesanan')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TextField Nama & Telepon[cite: 3]
            TextField(
              controller: _namaController,
              decoration: const InputDecoration(
                labelText: 'Nama Pembeli',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _alamatController,
              decoration: const InputDecoration(
                labelText: 'Alamat Pengiriman',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Metode Pengiriman:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            // RadioListTile Tunai / Transfer[cite: 3]
            RadioListTile<String>(
              title: const Text('Diantar'),
              value: 'Diantar',
              groupValue: _metodePengiriman,
              onChanged: (value) {
                setState(() {
                  _metodePengiriman = value!;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text('Ambil di tempat'),
              value: 'Ambil di tempat',
              groupValue: _metodePengiriman,
              onChanged: (value) {
                setState(() {
                  _metodePengiriman = value!;
                });
              },
            ),
            // Checkbox Persetujuan[cite: 3]
            CheckboxListTile(
              title: const Text('Saya menyetujui pesanan ini'),
              value: _isAgreed,
              onChanged: (value) {
                setState(() {
                  _isAgreed = value!;
                });
              },
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Validasi checkbox sebelum kirim[cite: 3]
                  if (_isAgreed) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Pesanan berhasil dibuat')),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Silakan centang persetujuan terlebih dahulu',
                        ),
                      ),
                    );
                  }
                },
                child: const Text('Kirim Pesanan'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
