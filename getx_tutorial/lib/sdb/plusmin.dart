import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Plusmin extends StatelessWidget {
  const Plusmin({super.key});

  @override
  Widget build(BuildContext context) {
    RxInt num = 1.obs;
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    num++;
                  },
                  icon: Icon(Icons.add)),
              Obx(() => Text("$num")),
              IconButton(
                  onPressed: () {
                    num--;
                  },
                  icon: Icon(Icons.remove)),
            ],
          ),
        ),
      ),
    );
  }
}
