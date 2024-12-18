import 'package:flutter/material.dart';
import 'package:pertemuan09/shared_pref.dart';
void main() {
runApp(const MyApp());
}
class MyApp extends StatelessWidget {
const MyApp({super.key});
// This widget is the root of your application.
@override
Widget build(BuildContext context) {
return MaterialApp(
title: 'Flutter Demo',
theme: ThemeData(
primarySwatch: Colors.teal,
useMaterial3: false,
),
home: const MyShared(),
);
}
}