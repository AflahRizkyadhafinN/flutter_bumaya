import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  RxList<String> nama = <String>[].obs;
  RxBool isOpen = false.obs;

  TextEditingController controller = TextEditingController();

  void Open() {
    isOpen.value = !isOpen.value;
  }
}
