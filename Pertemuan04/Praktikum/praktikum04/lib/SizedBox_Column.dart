import 'package:flutter/material.dart';

class MyColumn extends StatelessWidget {
const MyColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
return Column(
children: <Widget>[
Text('Teks 1'),
SizedBox(height: 20), // Spasi vertikal sebesar 20
Text('Teks 2'),
],
);

  }
}
