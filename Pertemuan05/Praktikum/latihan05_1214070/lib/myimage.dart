import 'package:flutter/material.dart';

class Myimage extends StatelessWidget {
  const Myimage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pertemuan 5'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Center(
        child: Image.network('https://www.radarbandung.id/wp-content/uploads/2022/09/ranca-upas.jpg',
        width: 400,
        height: 400,
        ),
      ),
    );
  }
}