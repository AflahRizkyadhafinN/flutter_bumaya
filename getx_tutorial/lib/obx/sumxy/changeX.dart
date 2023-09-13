import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tutorial/controllers/number.dart';

class ChangeX extends StatelessWidget {
  const ChangeX({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NumberModel());
    RxInt NumberX = Get.find<NumberModel>().x;

    return Scaffold(
      appBar: AppBar(
        title: Text("Ubah Nilai X"),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(5),
            width: MediaQuery.sizeOf(context).width,
            height: 75,
            decoration: BoxDecoration(color: Colors.yellow[700]),
            alignment: Alignment.center,
            child: Obx(() => Text(
                  "$NumberX",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Colors.white),
                )),
          ),
          GestureDetector(
            onTap: () {
              Get.find<NumberModel>().changeX(NumberX += 1);
            },
            child: Container(
              margin: EdgeInsets.all(5),
              width: MediaQuery.sizeOf(context).width,
              height: 75,
              decoration: BoxDecoration(color: Colors.yellow[700]),
              alignment: Alignment.center,
              child: Text(
                "Increase",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Colors.white),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.find<NumberModel>().changeX(NumberX -= 1);
            },
            child: Container(
              margin: EdgeInsets.all(5),
              width: MediaQuery.sizeOf(context).width,
              height: 75,
              decoration: BoxDecoration(color: Colors.yellow[700]),
              alignment: Alignment.center,
              child: Text(
                "Decrease",
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
