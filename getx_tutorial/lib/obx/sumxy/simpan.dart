import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tutorial/controllers/number.dart';

class SimpanScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(SimpanModel());
    List listSimpan = Get.find<SimpanModel>().listSimpan;
    print(listSimpan);
    return Scaffold(
        appBar: AppBar(
          title: Text("Hasil yang disimpan"),
        ),
        body: ListView.builder(
          itemCount: listSimpan.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(color: Colors.yellow),
              child: Row(children: [
                Text("${index + 1}"),
                SizedBox(
                  width: 20,
                ),
                Text("${listSimpan[index]}"),
              ]),
            );
          },
        ));
  }
}
