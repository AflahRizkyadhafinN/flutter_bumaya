import 'package:aplikasi_pelaporan/pages/listMasyarakat.dart';
import 'package:aplikasi_pelaporan/pages/tambahMasyarakat.dart';
import 'package:get/get.dart';

List<GetPage> router = [
  GetPage(name: "/", page: () => const ListMasyarakatScreen()),
  GetPage(name: "/tambah", page: () => const TambahMasyarakatScreen()),
];
