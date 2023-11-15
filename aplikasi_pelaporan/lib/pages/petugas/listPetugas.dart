import 'package:aplikasi_pelaporan/controllers/petugasController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/inputValue.dart';

class ListPetugasScreen extends StatelessWidget {
  const ListPetugasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final petugasController = Get.put(PetugasController());
    final data = petugasController.list;
    print(petugasController.list);
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
                          Text(data[index].idPetugas.toString()),
                          Text(data[index].password),
                          Text(data[index].telp),
                          Text(data[index].level),
                        ],
                      ),
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
                                String level = data[index].level;

                                Get.defaultDialog(
                                    title: "Update data",
                                    content: Column(
                                      children: [
                                        InputValue(
                                          label: "nama",
                                          controller: _nama,
                                          maxLines: 1,
                                        ),
                                        InputValue(
                                          label: "username",
                                          controller: _username,
                                          maxLines: 1,
                                        ),
                                        InputValue(
                                          label: "telp",
                                          controller: _telp,
                                          maxLines: 1,
                                        ),
                                        DropdownButtonFormField(
                                          value: level,
                                          decoration: const InputDecoration(
                                              labelText: "Level"),
                                          items: const [
                                            DropdownMenuItem(
                                              value: "admin",
                                              child: Text("Admin"),
                                            ),
                                            DropdownMenuItem(
                                              value: "petugas",
                                              child: Text("Petugas"),
                                            ),
                                          ],
                                          onChanged: (value) =>
                                              level = value.toString(),
                                        ),
                                        ElevatedButton(
                                            onPressed: () {
                                              petugasController
                                                  .updatePetugas(
                                                      data[index].idPetugas,
                                                      _nama.text,
                                                      _username.text,
                                                      _telp.text,
                                                      level)
                                                  .then((value) {
                                                if (value.statusCode == 200) {
                                                  Get.snackbar("Status",
                                                      "Data ${data[index].idPetugas} berhasil di update");
                                                }
                                              }).then((value) =>
                                                      petugasController
                                                          .getPetugas());
                                            },
                                            child: const Text("Update data"))
                                      ],
                                    ));
                              },
                              icon: Icon(Icons.edit)),
                          IconButton(
                              onPressed: () {
                                petugasController
                                    .deletePetugas(data[index].idPetugas)
                                    .then((value) {
                                  if (value.statusCode == 200) {
                                    Get.snackbar("Status",
                                        "Data dengan id petugas = ${data[index].idPetugas} berhasil dihapus");
                                  }
                                }).then((value) =>
                                        petugasController.getPetugas());
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
                Get.toNamed("/petugas/tambah");
              },
              child: const Text("Tambah Data"))
        ],
      ),
    );
  }
}
