import 'package:get/get.dart';

class NumberModel {
  RxInt x = 1.obs;
  RxInt y = 0.obs;

  void changeX(value) {
    x = value;
  }

  void changeY(value) {
    y = value;
  }
}

class SimpanModel extends GetxController {
  List listSimpan = [];

  void changeSimpan(value) {
    listSimpan.add(value.toString());
    print(listSimpan);
  }
}
