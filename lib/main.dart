import 'package:flutter/material.dart';
import 'package:utspab_ali_2428240140/data/tinutuan_data.dart';
import 'package:utspab_ali_2428240140/screens/detail_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kuliner Manado',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFB75B00)),
        useMaterial3: true,
      ),
      home: DetailScreen(tinutuan: tinutuan),
    );
  }
}
