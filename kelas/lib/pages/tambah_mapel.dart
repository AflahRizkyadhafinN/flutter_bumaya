import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kelas/components/drawerPage.dart';
import 'package:kelas/controllers/mainController.dart';

class TambahMapelScreen extends StatelessWidget {
  const TambahMapelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController mapel = TextEditingController();
    MainController mainController = Get.put(MainController());

    return Scaffold(
      appBar: AppBar(
        actions: const [DrawerPage()],
      ),
      body: Column(
        children: [
          TextField(
            controller: mapel,
            decoration: InputDecoration(labelText: "Mata Pelajaran"),
          ),
          SizedBox(height: 10),
          ElevatedButton(
              onPressed: () {
                mainController.addMapel(
                    (mainController.mapel.length + 1)
                        .toString()
                        .padLeft(3, "0"),
                    mapel.text);
                mapel.text = "";
              },
              child: const Text("Tambah")),
          Obx(() => Text(mainController.mapel.toString()))
        ],
      ),
    );
  }
}
