import 'package:aplikasi_pelaporan/controllers/pengaduanController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListPengaduanScreen extends StatelessWidget {
  const ListPengaduanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pengaduanController = Get.put(PengaduanController());
    final data = pengaduanController.list;
    return Scaffold(
      body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Card(
              child: IntrinsicHeight(
                child: Row(
                  children: [
                    Text("Isi Laporan"),
                    VerticalDivider(),
                    Text("Gambar")
                  ],
                ),
              ),
            );
          }),
    );
  }
}
