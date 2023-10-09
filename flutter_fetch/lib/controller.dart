import 'dart:convert';

import 'package:flutter_fetch/model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

Future<List<User>> fetchData() async {
  final storedUser = Get.put(StoredUser());
  final data = await http
      .get(Uri.parse("https://642cddacbf8cbecdb4f89760.mockapi.io/user"));
  var jsonData = jsonDecode(data.body);
  if (data.statusCode == 200) {
    List<User> futureList = [];
    for (Map<String, dynamic> data in jsonData) {
      futureList.add(User.fromJson(data));
    }
    print(futureList);
    if (futureList != []) {
      storedUser.listUser.value = futureList;
      print(storedUser.listUser);
    }
    return futureList;
  } else {
    throw Exception('Failed to load Data');
  }
}

Future<List<Pengaduan>> fetchPengaduan() async {
  final data = await http
      .get(Uri.parse("https://642cddacbf8cbecdb4f89760.mockapi.io/pengadu"));
  var jsonData = jsonDecode(data.body);
  print(jsonData);
  List<Pengaduan> futureList = [];
  for (Map<String, dynamic> data in jsonData) {
    futureList.add(Pengaduan.fromJson(data));
  }
  return futureList;
}
