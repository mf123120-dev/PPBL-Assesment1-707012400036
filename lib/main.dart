import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'providers/favorit_provider.dart';
import 'cubits/keranjang_cubit.dart';
import 'pages/halaman_beranda.dart';

void main() {
  runApp(const EcoMartApp());
}

class EcoMartApp extends StatelessWidget {
  const EcoMartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavoritProvider()),
        BlocProvider(create: (_) => KeranjangCubit()),
      ],
      child: MaterialApp(
        title: 'EcoMart',
        theme: ThemeData(primarySwatch: Colors.green, useMaterial3: false),
        home: const HalamanBeranda(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
