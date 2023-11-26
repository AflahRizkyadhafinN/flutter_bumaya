import 'dart:convert';

import 'package:aplikasi_pelaporan/models/tanggapan.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class TanggapanController extends GetxController {
  RxList list = [].obs;

  Future<void> onInit() async {
    super.onInit();
    getTanggapan();
  }

  Future<void> getTanggapan() async {
    try {
      final response =
          await http.get(Uri.parse('http://localhost:5000/tanggapan'));
      List<Tanggapan> futureList = [];
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        for (var i in jsonData) {
          futureList.add(Tanggapan.fromJson(i));
        }
        list.assignAll(futureList);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> postTanggapan(int idPengaduan, int petugasIdPetugas,
      String tanggapan, String status) async {
    try {
      await http.post(Uri.parse("http://localhost:5000/tanggapan"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({
            "idPengaduan": idPengaduan,
            "tanggapan": tanggapan,
            "idPetugas": petugasIdPetugas,
            "status": status
          }));
    } catch (e) {
      throw Exception(e);
    }
  }
}
