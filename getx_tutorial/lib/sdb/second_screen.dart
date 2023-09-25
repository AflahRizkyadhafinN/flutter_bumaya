import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final list = Get.arguments();
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Card(
              child: Container(
            padding: EdgeInsets.all(15),
            child: Text(
              list[index],
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
          ));
        },
      )
          //     ListView(
          //   children: [
          //     for (var i in list)
          //       Card(
          //         child: Container(
          //           padding: EdgeInsets.all(15),
          //           child: Text(
          //             i,
          //             style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          //           ),
          //         ),
          //       )
          //   ],
          // ),
          ),
    );
  }
}
