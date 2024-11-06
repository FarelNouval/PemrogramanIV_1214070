import 'package:flutter/material.dart';
import 'package:latihan05_1214070/second_screen.dart';

class FirstScreen extends StatelessWidget {
const FirstScreen({super.key});

final String message = 'Hello from First Screen!';

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: const Text('First Screen'),
),
body: Center(
child: ElevatedButton(
child: const Text('Pindah Screen'),
onPressed: () {
  Navigator.push(context, 
  MaterialPageRoute(builder: (context) => SecondScreen(message)));
},
),
),
);
}
}