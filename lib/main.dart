import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_tirtakencana_tatawarna/views/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Homepage(),
      initialRoute: '/',
    );
  }
}
