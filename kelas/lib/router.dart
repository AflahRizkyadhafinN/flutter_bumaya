import 'package:get/get.dart';
import 'package:kelas/pages/homepage.dart';
import 'package:kelas/pages/tambah_mapel.dart';
import 'package:kelas/pages/tambah_siswa.dart';

List<GetPage> router = [
  GetPage(name: '/', page: () => const HomepageScreen()),
  GetPage(name: '/tambahSiswa', page: () => const TambahSiswaScreen()),
  GetPage(name: '/tambahMapel', page: () => const TambahMapelScreen()),
];
