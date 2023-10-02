import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kelas/controllers/mainController.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController textController = TextEditingController();
    MainController mainController = Get.put(MainController());

    return IconButton(
        onPressed: () {
          Get.bottomSheet(
              SizedBox(
                height: 200,
                child: Column(
                  children: [
                    TextButton(
                        onPressed: () {
                          Get.back();
                          Get.defaultDialog(
                              title: "Ganti nama kelas",
                              content: Column(
                                children: [
                                  TextField(
                                    controller: textController,
                                    decoration: InputDecoration(
                                        labelText: "Nama kelas baru"),
                                  ),
                                  SizedBox(height: 10),
                                  ElevatedButton(
                                      onPressed: () {
                                        Get.back();
                                        mainController
                                            .gantiKelas(textController.text);
                                        textController.text = "";
                                        print(mainController.kelas);
                                        // print(textController.text);
                                      },
                                      child: Text("Ganti nama kelas"))
                                ],
                              ));
                        },
                        child: Text("Edit kelas")),
                    TextButton(
                        onPressed: () {
                          Get.back();
                          Get.toNamed("/tambahSiswa");
                        },
                        child: Text("Tambah siswa")),
                    TextButton(
                        onPressed: () {
                          Get.back();
                          Get.toNamed("/tambahMapel");
                        },
                        child: Text("Tambah mapel")),
                  ],
                ),
              ),
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(15))));
        },
        icon: Icon(Icons.menu));
  }
}
