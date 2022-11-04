import 'package:flutter/material.dart';

class Pinjaman extends StatefulWidget {
  const Pinjaman({super.key});

  @override
  State<Pinjaman> createState() => _PinjamanState();
}

class _PinjamanState extends State<Pinjaman> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Pinjaman'),
      ),
      body: Center(),
    );
  }
}
