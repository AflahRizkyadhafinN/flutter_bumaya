import 'package:aplikasi_pelaporan/components/inputValue.dart';
import 'package:aplikasi_pelaporan/controllers/tanggapanController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuatTanggapanScreen extends StatelessWidget {
  const BuatTanggapanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TanggapanController tanggapanController = Get.find();
    TextEditingController isiTanggapan = TextEditingController();
    final id = Get.arguments;
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Text("${id['idPetugas']}"),
          Text("${id['idPengaduan']}"),
          InputValue(
            label: "tanggapan",
            controller: isiTanggapan,
          ),
          ElevatedButton(
              onPressed: () {
                tanggapanController.postTanggapan(id["idPengaduan"],
                    id["idPetugas"], isiTanggapan.text, "selesai");
              },
              child: Text("Kirim tanggapan"))
        ],
      ),
    );
  }
}
