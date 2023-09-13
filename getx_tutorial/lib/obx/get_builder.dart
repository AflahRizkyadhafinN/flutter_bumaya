import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetBuilderScreen extends StatelessWidget {
  const GetBuilderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RxInt number = 0.obs;
    return Scaffold(
      appBar: AppBar(
        title: Text("Get Builder"),
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
                  "$number",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Colors.white),
                )),
          ),
          GestureDetector(
            onTap: () {
              number++;
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
              number--;
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
