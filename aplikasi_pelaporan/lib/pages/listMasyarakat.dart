import 'package:aplikasi_pelaporan/controllers/masyarakatController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/inputValue.dart';

class ListMasyarakatScreen extends StatelessWidget {
  const ListMasyarakatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final masyarakatController = Get.put(MasyarakatController());
    final data = masyarakatController.list;
    RxMap mapValue =
        {"nama": "", "username": "", "password": "", "telp": ""}.obs;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height - 30,
            child: Obx(
              () => ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) => Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data[index].nama),
                          Text(data[index].username),
                          Text(data[index].nik),
                          Text(data[index].password),
                          Text(data[index].telp),
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                              onPressed: () {
                                Get.defaultDialog(
                                    title: "Update data",
                                    content: Column(
                                      children: [
                                        Obx(() => Text(mapValue.toString())),
                                        InputValue(
                                          label: "nama",
                                          onSubmitted: (value) =>
                                              mapValue["nama"] = value,
                                        ),
                                        InputValue(
                                          label: "username",
                                          onSubmitted: (value) =>
                                              mapValue["username"] = value,
                                        ),
                                        InputValue(
                                          label: "password",
                                          onSubmitted: (value) =>
                                              mapValue["password"] = value,
                                        ),
                                        InputValue(
                                          label: "telp",
                                          onSubmitted: (value) =>
                                              mapValue["telp"] = value,
                                        ),
                                        ElevatedButton(
                                            onPressed: () {
                                              masyarakatController
                                                  .updateMasyarakat(
                                                      data[index].nik, mapValue)
                                                  .then((value) {
                                                if (value.statusCode == 200) {
                                                  Get.snackbar("Status",
                                                      "Data ${data[index].nik} berhasil di update");
                                                }
                                              }).then((value) =>
                                                      masyarakatController
                                                          .getMasyarakat());
                                            },
                                            child: Text("Update data"))
                                      ],
                                    ));
                              },
                              icon: Icon(Icons.edit)),
                          IconButton(
                              onPressed: () {
                                masyarakatController
                                    .deleteMasyarakat(data[index].nik)
                                    .then((value) {
                                  if (value.statusCode == 200) {
                                    Get.snackbar("Status",
                                        "Data dengan nik = ${data[index].nik} berhasil dihapus");
                                  }
                                }).then((value) =>
                                        masyarakatController.getMasyarakat());
                              },
                              icon: Icon(Icons.delete)),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Get.toNamed("/tambah");
              },
              child: const Text("Tambah Data"))
        ],
      ),
    );
  }
}
