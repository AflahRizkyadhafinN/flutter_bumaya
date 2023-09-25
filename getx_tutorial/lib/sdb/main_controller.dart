import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  RxList<String> nama = <String>[].obs;
  RxBool isOpen = false.obs;
  RxMap<String, dynamic> mapMapel = <String, dynamic>{}.obs;

  TextEditingController controller = TextEditingController();

  void Open() {
    isOpen.value = !isOpen.value;
  }

  void changeMap(String key, dynamic value) {
    mapMapel[key] = value;
  }
}

// {"mapel" : "Mtk", "kelas" : "Xii RPL 2"}
