import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HalamanLokasi extends StatefulWidget {
  const HalamanLokasi({super.key});

  @override
  State<HalamanLokasi> createState() => _HalamanLokasiState();
}

class _HalamanLokasiState extends State<HalamanLokasi> {
  // Koordinat simulasi lokasi komunitas GreenLife Bandung[cite: 3, 4]
  static const LatLng _greenLifeLocation = LatLng(-6.914744, 107.609810);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lokasi Komunitas EcoMart')),
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: _greenLifeLocation,
          zoom: 15, // Zoom 15 sesuai kisi-kisi[cite: 3]
        ),
        markers: {
          const Marker(
            markerId: MarkerId('Bank Sampah Hijau'),
            position: _greenLifeLocation,
            infoWindow: InfoWindow(
              title: 'Bank Sampah Hijau',
              snippet: 'Komunitas Produk Ramah Lingkungan',
            ),
          ),
        },
      ),
    );
  }
}