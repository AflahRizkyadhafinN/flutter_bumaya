import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CekList extends StatelessWidget {
  const CekList({super.key});

  @override
  Widget build(BuildContext context) {
    RxList listData = [].obs;

    TextEditingController _UbahText = TextEditingController();
    void a() {
      listData.add(_UbahText.text);
    }

    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: _UbahText,
          ),
          ElevatedButton(
              onPressed: () {
                a();
                print(listData);
              },
              child: Text("Ubah data")),
          Obx(() => Text("$listData"))
        ],
      ),
    );
  }
}
