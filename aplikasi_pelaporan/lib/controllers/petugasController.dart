import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/petugas.dart';

const uri = "http://localhost:5000";

class PetugasController extends GetxController {
  List list = [].obs;
  @override
  Future<void> onInit() async {
    super.onInit();
    getPetugas();
  }

  Future<void> getPetugas() async {
    try {
      final response = await http.get(Uri.parse("$uri/petugas"));
      final jsonData = jsonDecode(response.body);
      List<Petugas> futureList = [];
      for (var data in jsonData) {
        futureList.add(Petugas.fromJson(data));
      }
      list.assignAll(futureList);
      print(list);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<http.Response> postPetugas(String nama, String username,
      String password, String telp, String level) async {
    try {
      final request = await http.post(
        Uri.parse("$uri/petugas"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'nama': nama,
          'username': username,
          'password': password,
          'telp': telp,
          'level': level,
        }),
      );
      return request;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<http.Response> updatePetugas(int idPetugas, String nama,
      String username, String telp, String level) async {
    try {
      final response = await http.patch(Uri.parse("$uri/petugas/$idPetugas"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({
            "nama": nama,
            "username": username,
            "telp": telp,
            "level": level,
          }));
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<http.Response> deletePetugas(int idPetugas) async {
    try {
      final response = await http.delete(Uri.parse("$uri/petugas/$idPetugas"));
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
