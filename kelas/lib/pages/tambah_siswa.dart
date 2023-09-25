import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kelas/components/drawerPage.dart';
import 'package:kelas/controllers/mainController.dart';

class TambahSiswaScreen extends StatelessWidget {
  const TambahSiswaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nama = TextEditingController();
    MainController mainController = Get.put(MainController());

    return Scaffold(
      appBar: AppBar(
        actions: const [DrawerPage()],
      ),
      body: Column(
        children: [
          TextField(
            controller: nama,
            decoration: InputDecoration(labelText: "Nama Siswa"),
          ),
          SizedBox(height: 10),
          ElevatedButton(
              onPressed: () {
                mainController.addSiswa(nama.text);
                nama.text = "";
              },
              child: Text("Tambah")),
          Obx(() => Text(mainController.siswa.toString()))
        ],
      ),
    );
  }
}
