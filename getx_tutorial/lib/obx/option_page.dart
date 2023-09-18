import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OptionPage extends StatelessWidget {
  const OptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              Get.toNamed("/obx/obx_screen");
            },
            child: Container(
              margin: EdgeInsets.all(5),
              width: MediaQuery.sizeOf(context).width,
              height: 75,
              decoration: BoxDecoration(color: Colors.yellow[700]),
              alignment: Alignment.center,
              child: Text(
                "Obx",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Colors.white),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed("/obx/get_builder_screen");
            },
            child: Container(
              margin: EdgeInsets.all(5),
              width: MediaQuery.sizeOf(context).width,
              height: 75,
              decoration: BoxDecoration(color: Colors.yellow[700]),
              alignment: Alignment.center,
              child: Text(
                "Get Builder",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Colors.white),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed("/obx/main_XY_screen");
            },
            child: Container(
              margin: EdgeInsets.all(5),
              width: MediaQuery.sizeOf(context).width,
              height: 75,
              decoration: BoxDecoration(color: Colors.yellow[700]),
              alignment: Alignment.center,
              child: Text(
                "Sum (X, Y)",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
