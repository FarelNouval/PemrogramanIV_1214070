import 'package:flutter/material.dart';
import 'package:praktikum03/material_app.dart';

void main() {
  runApp(AppMaterial());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: const Center(
          child: Heading(
            text: "Hello ULBI",
          ),
        ),
      ),
    );


  }
}

class Heading extends StatelessWidget {
final String text;
const Heading({Key? key, required this.text}) : super(key: key);
@override
Widget build(BuildContext context) {
return Text(
text,
style: const TextStyle(
fontSize: 28.0,
fontWeight: FontWeight.bold,
),
);
}
}
