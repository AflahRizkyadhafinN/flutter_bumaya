import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Get.bottomSheet(
              SizedBox(
                height: 100,
                child: Column(
                  children: [
                    TextButton(
                        onPressed: () {
                          Get.back();
                          Get.toNamed("/");
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
