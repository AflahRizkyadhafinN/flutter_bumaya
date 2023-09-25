import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tutorial/sdb/main_controller.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MainController mainController = Get.put(MainController());
    TextEditingController key = TextEditingController();
    TextEditingController value = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: key,
              decoration: InputDecoration(
                labelText: "key",
                labelStyle:
                    TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 1, color: Colors.blue.shade600)),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 1, color: Colors.blue.shade600)),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: value,
              decoration: InputDecoration(
                labelText: "value",
                labelStyle:
                    TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 1, color: Colors.blue.shade600)),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 1, color: Colors.blue.shade600)),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {
                  mainController.changeMap(key.text, value.text);
                },
                child: Text("Ubah isi map")),
            Obx(() => Column(
                  children: [
                    Text(mainController.mapMapel.toString()),
                    SizedBox(
                      height: 300,
                      child: ListView.builder(
                        itemCount: mainController.mapMapel.length,
                        itemBuilder: (context, index) {
                          var key =
                              mainController.mapMapel.keys.elementAt(index);
                          return Card(
                              child: Padding(
                            padding: const EdgeInsets.all(10),
                            child:
                                Text("$key : ${mainController.mapMapel[key]}"),
                          ));
                        },
                      ),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
