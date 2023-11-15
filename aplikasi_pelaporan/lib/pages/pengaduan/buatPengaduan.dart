import 'dart:io';

import 'package:aplikasi_pelaporan/controllers/pengaduanController.dart';
import 'package:aplikasi_pelaporan/components/inputValue.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuatPengaduanScreen extends StatelessWidget {
  const BuatPengaduanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pengaduanController = Get.put(PengaduanController());
    final nik = Get.arguments;
    RxMap imagePick = {}.obs;
    TextEditingController isiLaporan = TextEditingController();

    void pickFiles() async {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ["jpg", "png", "jpeg"],
      );

      if (result != null) {
        if (result.files.single.bytes == null) {
          imagePick["files"] = result.files.single.path;
          imagePick["device"] = "android";
        } else {
          var filesCode = result.files.single.bytes;
          imagePick["files"] = filesCode;
          imagePick["device"] = "web";
          imagePick["filename"] = result.files.single.name;
        }
      }
    }

    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Text(nik),
          const Text("Form pengaduan"),
          InputValue(
            label: "Isi laporan",
            controller: isiLaporan,
          ),
          ElevatedButton(
              onPressed: () {
                pickFiles();
              },
              child: Text("Add image")),
          Obx(() => (imagePick["files"] != null && imagePick["device"] != null)
              ? imagePick["device"] == "web"
                  ? Image.memory(imagePick["files"])
                  : Image.file(File(imagePick["files"]))
              : Text("ImagePick kosong")),
          ElevatedButton(
              onPressed: () {
                pengaduanController.postPengaduan(
                    nik, imagePick, isiLaporan.text);
              },
              child: Text("Kirim pengaduan"))
        ],
      ),
    );
  }
}
