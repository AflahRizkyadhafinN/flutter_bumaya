import 'package:aplikasi_pelaporan/controllers/masyarakatController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/inputValue.dart';

class ListMasyarakatScreen extends StatelessWidget {
  const ListMasyarakatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final masyarakatController = Get.put(MasyarakatController());
    final data = masyarakatController.list;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height - 84,
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
                      ElevatedButton(
                          onPressed: () {
                            Get.toNamed(
                              "/pengaduan",
                              arguments: data[index].nik,
                            );
                          },
                          child: Text("Pengaduan")),
                      Column(
                        children: [
                          IconButton(
                              onPressed: () {
                                TextEditingController _nama =
                                    TextEditingController(
                                        text: data[index].nama);
                                TextEditingController _username =
                                    TextEditingController(
                                        text: data[index].username);
                                TextEditingController _telp =
                                    TextEditingController(
                                        text: data[index].telp);

                                Get.defaultDialog(
                                    title: "Update data",
                                    content: Column(
                                      children: [
                                        InputValue(
                                          label: "nama",
                                          maxLines: 1,
                                          controller: _nama,
                                        ),
                                        InputValue(
                                          label: "username",
                                          maxLines: 1,
                                          controller: _username,
                                        ),
                                        InputValue(
                                          label: "telp",
                                          maxLines: 1,
                                          controller: _telp,
                                        ),
                                        ElevatedButton(
                                            onPressed: () {
                                              masyarakatController
                                                  .updateMasyarakat(
                                                      data[index].nik,
                                                      _nama.text,
                                                      _username.text,
                                                      _telp.text)
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
                Get.toNamed("/masyarakat/tambah");
              },
              child: const Text("Tambah Data"))
        ],
      ),
    );
  }
}
