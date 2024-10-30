import 'package:flutter/material.dart';

class MyWidgetColumn extends StatelessWidget {
const MyWidgetColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
return Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: <Widget>[
Text(
'Ini Judul',
style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
),
Text('Universtitas Logistik dan Bisnis Internasional (ULBI)'),
],
);
  }
}
