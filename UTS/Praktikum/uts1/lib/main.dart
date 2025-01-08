import 'package:flutter/material.dart';
import 'package:uts1/widget/color.dart';
import 'package:uts1/started_view.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UTS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: TColor.primaryColor1,
        fontFamily: "Poppins"
      ),
      home: const StartedView(),
    );
  }
}
