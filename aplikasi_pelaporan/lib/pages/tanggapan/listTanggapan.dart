import 'package:aplikasi_pelaporan/controllers/pengaduanController.dart';
import 'package:aplikasi_pelaporan/controllers/tanggapanController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListTanggapanScreen extends StatelessWidget {
  const ListTanggapanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TanggapanController tanggapanController = Get.put(TanggapanController());
    PengaduanController pengaduanController = Get.put(PengaduanController());
    final data = pengaduanController.list;
    final idPetugas = Get.arguments;

    return Scaffold(
        appBar: AppBar(),
        body: Obx(
          () => ListView.builder(
            itemCount: pengaduanController.list.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Text(data[index].isiLaporan),
                  Text(data[index].masyarakat.nama),
                  ElevatedButton(
                      onPressed: () {
                        Get.toNamed("/tanggapan/tambah", arguments: {
                          "idPetugas": idPetugas,
                          "idPengaduan": data[index].idPengaduan
                        });
                      },
                      child: Text("Berikan tanggapan"))
                ],
              );
            },
          ),
        ));
  }
}
