import 'package:get/get.dart';

class MainController {
  RxList<String> siswa = <String>[].obs;
  RxMap mapel = {}.obs;
  RxString kelas = "XII RPL 2".obs;

  void addSiswa(String nama) {
    siswa.add(nama);
  }

  void addMapel(String key, String value) {
    mapel[key] = value;
    print(mapel);
  }

  void gantiKelas(String value) {
    kelas.value = value;
    print(kelas);
  }
}
