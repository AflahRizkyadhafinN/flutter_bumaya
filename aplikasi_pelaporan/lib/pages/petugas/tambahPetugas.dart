import 'package:aplikasi_pelaporan/controllers/petugasController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/inputValue.dart';

class TambahPetugasScreen extends StatelessWidget {
  const TambahPetugasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final petugasController = Get.put(PetugasController());
    TextEditingController _nama = TextEditingController();
    TextEditingController _username = TextEditingController();
    TextEditingController _password = TextEditingController();
    TextEditingController _telp = TextEditingController();
    String level = "";
    return Scaffold(
      appBar: AppBar(),
      body: Column(
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
            label: "password",
            controller: _password,
            password: true,
            maxLines: 1,
          ),
          InputValue(
            label: "telp",
            controller: _telp,
            maxLines: 1,
          ),
          DropdownButtonFormField(
            decoration: InputDecoration(labelText: "Level"),
            items: [
              DropdownMenuItem(
                child: Text("Admin"),
                value: "admin",
              ),
              DropdownMenuItem(
                child: Text("Petugas"),
                value: "petugas",
              ),
            ],
            onChanged: (value) => level = value.toString(),
          ),
          ElevatedButton(
            onPressed: () {
              petugasController
                  .postPetugas(_nama.text, _username.text, _password.text,
                      _telp.text, level)
                  .then((value) {
                if (value.statusCode == 200) {
                  Get.snackbar("Status", "Data berhasil ditambah");
                } else {
                  Get.snackbar("Status", "Data gagal ditambah");
                }
              }).then((value) => petugasController.getPetugas());
            },
            child: Text("Tambah Masyarakat"),
          )
        ],
      ),
    );
  }
}
