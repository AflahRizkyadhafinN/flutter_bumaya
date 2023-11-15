import 'package:aplikasi_pelaporan/controllers/masyarakatController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/inputValue.dart';

class TambahMasyarakatScreen extends StatelessWidget {
  const TambahMasyarakatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final masyarakatController = Get.put(MasyarakatController());
    TextEditingController _nik = TextEditingController();
    TextEditingController _nama = TextEditingController();
    TextEditingController _username = TextEditingController();
    TextEditingController _password = TextEditingController();
    TextEditingController _telp = TextEditingController();

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          InputValue(
            label: "nik",
            controller: _nik,
            maxLines: 1,
          ),
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
          ElevatedButton(
            onPressed: () {
              masyarakatController
                  .postMasyarakat(_nik.text, _nama.text, _username.text,
                      _password.text, _telp.text)
                  .then((value) {
                if (value.statusCode == 200) {
                  Get.snackbar("Status", "Data berhasil ditambah");
                } else {
                  Get.snackbar("Status", "Data gagal ditambah");
                }
              }).then((value) => masyarakatController.getMasyarakat());
            },
            child: Text("Tambah Masyarakat"),
          )
        ],
      ),
    );
  }
}
