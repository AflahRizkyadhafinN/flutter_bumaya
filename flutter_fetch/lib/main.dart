import 'package:flutter/material.dart';
import 'package:flutter_fetch/screen_dua.dart';
import 'package:flutter_fetch/screen_satu.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        home: Scaffold(
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                Get.to(ScreenSatu());
              },
              child: Text("Screen Satu")),
          ElevatedButton(
              onPressed: () {
                Get.to(ScreenDua());
              },
              child: Text("Screen Dua")),
        ],
      ),
    ));
  }
}
