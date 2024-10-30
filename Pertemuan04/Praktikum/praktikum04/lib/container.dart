import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
const MyContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
return Container(
color: Colors.blue,
padding: const EdgeInsets.all(10),
child: const Text(
'Hi',
style: TextStyle(fontSize: 40),
),
);
  }
}
