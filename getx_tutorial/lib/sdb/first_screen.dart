import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:getx_tutorial/main.dart';
import 'package:getx_tutorial/sdb/main_controller.dart';
import 'package:getx_tutorial/sdb/second_screen.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MainController mainController = Get.put(MainController());

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Nama",
                  labelStyle:
                      TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: Colors.blue.shade600)),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: Colors.blue.shade600)),
                ),
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                controller: mainController.controller,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  if (mainController.controller.text != "") {
                    mainController.nama.add(mainController.controller.text);
                    mainController.controller.text = "";
                    Get.defaultDialog(
                      content: Text("Data berhasil ditambah"),
                      confirm: TextButton(
                          onPressed: () {
                            Get.back();
                            Get.toNamed("/sdb/second_screen",
                                arguments: mainController.nama);
                          },
                          child: Text("List data")),
                    );
                  } else {
                    // Get.defaultDialog(
                    //     content: Text("Nama masih kosong"),
                    //     confirm: ElevatedButton(
                    //         onPressed: () {
                    //           Get.back();
                    //         },
                    //         child: Text("Ok")));
                    Get.snackbar("Error", "Nama masih kosong",
                        duration: Duration(seconds: 2));
                  }
                },
                child: Text("save")),
            Obx(() => Column(
                  children: [
                    Text("${mainController.nama}"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          mainController.isOpen.value ? "Open" : "Close",
                          style: TextStyle(
                              color: mainController.isOpen.value
                                  ? Colors.green
                                  : Colors.red,
                              fontSize: 15,
                              fontWeight: FontWeight.w700),
                        ),
                        Switch(
                          value: mainController.isOpen.value,
                          onChanged: (value) {
                            mainController.Open();
                          },
                        ),
                      ],
                    )
                  ],
                )),
            ElevatedButton(
                onPressed: () {
                  Get.bottomSheet(Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20))),
                    child: TextButton(
                        onPressed: () {
                          Get.back();
                          Get.toNamed("/plusmin");
                        },
                        child: Text("Menuju page")),
                  ));
                },
                child: Text("PlusMin"))
          ],
        ),
      ),
    );
  }
}
