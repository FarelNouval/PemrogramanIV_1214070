import 'package:flutter/material.dart';

class MyimageAsset extends StatelessWidget {
  const MyimageAsset({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pertemuan 5'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Center(
        child: Image.asset('images/ulbi.jpg', width: 400, height: 400),
        ),
      );
  }
}