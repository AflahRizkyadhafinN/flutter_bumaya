import 'dart:io';

import 'package:aplikasi_pelaporan/controllers/pengaduanController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../components/inputValue.dart';
import 'localController.dart';

class ListPengaduanScreen extends StatelessWidget {
  const ListPengaduanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PengaduanController pengaduanController = Get.put(PengaduanController());
    LocalController localController = Get.put(LocalController());

    RxList data = pengaduanController.list;
    final nik = Get.arguments;
    RxBool editmode = false.obs;

    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
            onPressed: () {
              editmode.value = !editmode.value;
            },
            icon: Icon(Icons.edit))
      ]),
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height - 84,
                child: Obx(
                  () => ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        TextEditingController isiLaporan =
                            TextEditingController(text: data[index].isiLaporan);
                        return Card(
                          color: data[index].status == "0"
                              ? Colors.white
                              : data[index].status == "proses"
                                  ? Colors.yellow
                                  : Colors.green,
                          child: IntrinsicHeight(
                            child: Row(
                              children: [
                                Obx(
                                  () => editmode == true
                                      ? SizedBox(
                                          width: 100,
                                          child: InputValue(
                                            label: "Ubah data",
                                            controller: isiLaporan,
                                          ),
                                        )
                                      : data[index].isiLaporan != null
                                          ? Text(data[index].isiLaporan)
                                          : Text(""),
                                ),
                                VerticalDivider(),
                                Obx(
                                  () => editmode == true
                                      ? localController.imagePick.isNotEmpty
                                          ? GestureDetector(
                                              onDoubleTap: () {
                                                print(data[index].foto);
                                                localController.pickFiles();
                                              },
                                              child: Image.file(
                                                File(localController
                                                    .imagePick['files']),
                                                width: 100,
                                              ))
                                          : ElevatedButton(
                                              onPressed: () {
                                                localController.pickFiles();
                                              },
                                              child: Text("Select Image"))
                                      : data[index].foto != null
                                          ? Image.network(
                                              "${data[index].foto}",
                                              width: 200,
                                            )
                                          : Container(),
                                ),
                                Obx(
                                  () => editmode == true
                                      ? Column(
                                          children: [
                                            ElevatedButton(
                                                onPressed: () {
                                                  pengaduanController
                                                      .updatePengaduan(
                                                          data[index]
                                                              .idPengaduan,
                                                          localController
                                                              .imagePick,
                                                          isiLaporan.text)
                                                      .then((value) => {
                                                            pengaduanController
                                                                .getPengaduan(),
                                                            editmode.value =
                                                                false
                                                          });
                                                },
                                                child: Text("Ubah laporan")),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            ElevatedButton(
                                                onPressed: () {
                                                  localController
                                                      .imagePick.value = {};
                                                  isiLaporan.text =
                                                      data[index].isiLaporan;
                                                  editmode.value = false;
                                                },
                                                child:
                                                    Text("Batalkan perubahan")),
                                          ],
                                        )
                                      : Container(),
                                ),
                                IconButton(
                                    onPressed: () {
                                      print(data[index].idPengaduan);
                                      pengaduanController
                                          .deletePengaduan(
                                              data[index].idPengaduan)
                                          .then((value) => pengaduanController
                                              .list
                                              .removeAt(index));
                                    },
                                    icon: Icon(Icons.delete))
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    Get.toNamed("/pengaduan/tambah", arguments: nik);
                  },
                  child: Text("Tambah Pengaduan"))
            ],
          ),
        ],
      ),
    );
  }
}
