import 'dart:convert';

import 'package:aplikasi_pelaporan/models/pengaduan.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

const uri = "http://localhost:5000";

class PengaduanController extends GetxController {
  List list = [].obs;
  @override
  Future<void> onInit() async {
    super.onInit();
    getPengaduan();
  }

  Future<void> getPengaduan() async {
    try {
      final response = await http.get(Uri.parse("$uri/pengaduan"));
      final jsonData = jsonDecode(response.body);
      List<Pengaduan> futureList = [];
      for (var data in jsonData) {
        futureList.add(Pengaduan.fromJson(data));
      }
      list.assignAll(futureList);
      print(list);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> postPengaduan(
      String nik, Map imagePick, String isiLaporan) async {
    print(nik);
    try {
      final request =
          http.MultipartRequest("POST", Uri.parse("$uri/pengaduan"));
      request.files.add(imagePick["device"] == "android"
          ? await http.MultipartFile.fromPath("foto", imagePick['files'])
          : await http.MultipartFile.fromBytes("foto", imagePick['files'],
              filename: imagePick["filename"]));
      request.fields.addAll({"nik": nik, "isi_laporan": isiLaporan});
      final response = await request.send();
      print(response.statusCode);
    } catch (e) {
      throw Exception(e);
    }
  }
}
