import 'package:aplikasi_pelaporan/controllers/masyarakatController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/inputValue.dart';

class TambahMasyarakatScreen extends StatelessWidget {
  const TambahMasyarakatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final masyarakatController = Get.put(MasyarakatController());
    RxMap mapValue = {}.obs;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          InputValue(
            label: "nama",
            onSubmitted: (value) => mapValue["nama"] = value,
          ),
          InputValue(
            label: "username",
            onSubmitted: (value) => mapValue["username"] = value,
          ),
          InputValue(
            label: "password",
            onSubmitted: (value) => mapValue["password"] = value,
          ),
          InputValue(
            label: "nik",
            onSubmitted: (value) => mapValue["nik"] = value,
          ),
          InputValue(
            label: "telp",
            onSubmitted: (value) => mapValue["telp"] = value,
          ),
          Obx(() => Text(mapValue.toString())),
          ElevatedButton(
            onPressed: () {
              if (mapValue["nama"] == null) {
                Get.snackbar("Data kosong", "Nama masih kosong");
              } else if (mapValue["username"] == null) {
                Get.snackbar("Data kosong", "Username masih kosong");
              } else if (mapValue["password"] == null) {
                Get.snackbar("Data kosong", "Password masih kosong");
              } else if (mapValue["nik"] == null) {
                Get.snackbar("Data kosong", "Nik masih kosong");
              } else if (mapValue["telp"] == null) {
                Get.snackbar("Data kosong", "Telp masih kosong");
              } else {
                masyarakatController.postMasyarakat(mapValue).then((value) {
                  if (value.statusCode == 200) {
                    Get.snackbar("Status", "Data berhasil ditambah");
                  } else {
                    Get.snackbar("Status", "Data gagal ditambah");
                  }
                }).then((value) => masyarakatController.getMasyarakat());
              }
            },
            child: Text("Tambah Masyarakat"),
          )
        ],
      ),
    );
  }
}
