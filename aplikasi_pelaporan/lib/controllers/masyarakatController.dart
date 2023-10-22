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
    final response = await http.get(Uri.parse("$uri/masyarakat"));
    final jsonData = jsonDecode(response.body);
    List<Masyarakat> futureList = [];
    for (var data in jsonData) {
      futureList.add(Masyarakat.fromJson(data));
    }
    list.assignAll(futureList);
    print(list);
  }

  Future<http.Response> postMasyarakat(Map data) async {
    final request = await http.post(
      Uri.parse("$uri/masyarakat"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    return request;
  }

  Future<http.Response> updateMasyarakat(String nik, Map data) async {
    final response = await http.patch(Uri.parse("$uri/masyarakat/$nik"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data));
    return response;
  }

  Future<http.Response> deleteMasyarakat(String nik) async {
    final response = await http.delete(Uri.parse("$uri/masyarakat/$nik"));
    return response;
  }
}
