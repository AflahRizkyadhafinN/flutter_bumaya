class Pengaduan {
  int? idPengaduan;
  String? tglPengaduan;
  String? isiLaporan;
  String? foto;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? masyarakatNik;
  Masyarakat? masyarakat;

  Pengaduan(
      {this.idPengaduan,
      this.tglPengaduan,
      this.isiLaporan,
      this.foto,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.masyarakatNik,
      this.masyarakat});

  Pengaduan.fromJson(Map<String, dynamic> json) {
    idPengaduan = json['id_pengaduan'];
    tglPengaduan = json['tgl_pengaduan'];
    isiLaporan = json['isi_laporan'];
    foto = json['foto'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    masyarakatNik = json['masyarakatNik'];
    masyarakat = json['masyarakat'] != null
        ? new Masyarakat.fromJson(json['masyarakat'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_pengaduan'] = this.idPengaduan;
    data['tgl_pengaduan'] = this.tglPengaduan;
    data['isi_laporan'] = this.isiLaporan;
    data['foto'] = this.foto;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['masyarakatNik'] = this.masyarakatNik;
    // if (this.masyarakat != null) {
    //   data['masyarakat'] = this.masyarakat!.toJson();
    // }
    return data;
  }
}

class Masyarakat {
  String? nik;
  String? nama;
  String? username;
  String? password;
  String? telp;
  String? createdAt;
  String? updatedAt;

  Masyarakat(
      {this.nik,
      this.nama,
      this.username,
      this.password,
      this.telp,
      this.createdAt,
      this.updatedAt});

  Masyarakat.fromJson(Map<String, dynamic> json) {
    nik = json['nik'];
    nama = json['nama'];
    username = json['username'];
    password = json['password'];
    telp = json['telp'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nik'] = this.nik;
    data['nama'] = this.nama;
    data['username'] = this.username;
    data['password'] = this.password;
    data['telp'] = this.telp;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
