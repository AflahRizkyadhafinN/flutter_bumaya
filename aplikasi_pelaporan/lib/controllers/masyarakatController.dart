import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/masyarakat.dart';

const uri = "http://localhost:5000";

class MasyarakatController extends GetxController {
  List list = [].obs;
  @override
  Future<void> onInit() async {
    super.onInit();
    getMasyarakat();
  }

  Future<void> getMasyarakat() async {
    try {
      final response = await http.get(Uri.parse("$uri/masyarakat"));
      final jsonData = jsonDecode(response.body);
      List<Masyarakat> futureList = [];
      for (var data in jsonData) {
        futureList.add(Masyarakat.fromJson(data));
      }
      list.assignAll(futureList);
      print(list);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<http.Response> postMasyarakat(String nik, String nama, String username,
      String password, String telp) async {
    try {
      final request = await http.post(
        Uri.parse("$uri/masyarakat"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          "nama": nama,
          "username": username,
          "password": password,
          "nik": nik,
          "telp": telp
        }),
      );
      return request;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<http.Response> updateMasyarakat(
      String nik, String nama, String username, String telp) async {
    try {
      final response = await http.patch(Uri.parse("$uri/masyarakat/$nik"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({
            "nama": nama,
            "username": username,
            "telp": telp,
          }));
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<http.Response> deleteMasyarakat(String nik) async {
    try {
      final response = await http.delete(Uri.parse("$uri/masyarakat/$nik"));
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
