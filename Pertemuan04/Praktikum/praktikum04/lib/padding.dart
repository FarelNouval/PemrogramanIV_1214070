import 'package:flutter/material.dart';

class MyPadding extends StatelessWidget {
const MyPadding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
return Padding(
padding: const EdgeInsets.all(30),
child: const Text('Ini Padding'),
);
  }
}
