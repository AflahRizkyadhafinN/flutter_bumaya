import 'package:aplikasi_pelaporan/pages/login/login.dart';
import 'package:aplikasi_pelaporan/pages/masyarakat/listMasyarakat.dart';
import 'package:aplikasi_pelaporan/pages/masyarakat/tambahMasyarakat.dart';
import 'package:aplikasi_pelaporan/pages/pengaduan/buatPengaduan.dart';
import 'package:aplikasi_pelaporan/pages/pengaduan/listPengaduan.dart';
import 'package:aplikasi_pelaporan/pages/petugas/listPetugas.dart';
import 'package:aplikasi_pelaporan/pages/petugas/tambahPetugas.dart';
import 'package:get/get.dart';

List<GetPage> router = [
  GetPage(name: "/", page: () => const LoginScreen()),

  // Masyarkat
  GetPage(name: "/masyarakat", page: () => const ListMasyarakatScreen()),
  GetPage(
      name: "/masyarakat/tambah", page: () => const TambahMasyarakatScreen()),

  // Petugas
  GetPage(name: "/petugas", page: () => const ListPetugasScreen()),
  GetPage(name: "/petugas/tambah", page: () => const TambahPetugasScreen()),

  // Pengaduan
  GetPage(name: "/pengaduan", page: () => const ListPengaduanScreen()),
  GetPage(name: "/pengaduan/tambah", page: () => const BuatPengaduanScreen()),
];
