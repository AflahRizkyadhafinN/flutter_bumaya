class Tanggapan {
  int? idTanggapan;
  String? tglTanggapan;
  String? tanggapan;
  String? createdAt;
  String? updatedAt;
  int? pengaduanIdPengaduan;
  int? petugaIdPetugas;
  Petuga? petuga;
  Pengaduan? pengaduan;

  Tanggapan(
      {this.idTanggapan,
      this.tglTanggapan,
      this.tanggapan,
      this.createdAt,
      this.updatedAt,
      this.pengaduanIdPengaduan,
      this.petugaIdPetugas,
      this.petuga,
      this.pengaduan});

  Tanggapan.fromJson(Map<String, dynamic> json) {
    idTanggapan = json['id_tanggapan'];
    tglTanggapan = json['tgl_tanggapan'];
    tanggapan = json['tanggapan'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    pengaduanIdPengaduan = json['pengaduanIdPengaduan'];
    petugaIdPetugas = json['petugaIdPetugas'];
    petuga =
        json['petuga'] != null ? new Petuga.fromJson(json['petuga']) : null;
    pengaduan = json['pengaduan'] != null
        ? new Pengaduan.fromJson(json['pengaduan'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_tanggapan'] = this.idTanggapan;
    data['tgl_tanggapan'] = this.tglTanggapan;
    data['tanggapan'] = this.tanggapan;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['pengaduanIdPengaduan'] = this.pengaduanIdPengaduan;
    data['petugasIdPetugas'] = this.petugaIdPetugas;
    if (this.petuga != null) {
      data['petugas'] = this.petuga!.toJson();
    }
    if (this.pengaduan != null) {
      data['pengaduan'] = this.pengaduan!.toJson();
    }
    return data;
  }
}

class Petuga {
  int? idPetugas;
  String? nama;
  String? username;
  String? telp;

  Petuga({this.idPetugas, this.nama, this.username, this.telp});

  Petuga.fromJson(Map<String, dynamic> json) {
    idPetugas = json['id_petugas'];
    nama = json['nama'];
    username = json['username'];
    telp = json['telp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_petugas'] = this.idPetugas;
    data['nama'] = this.nama;
    data['username'] = this.username;
    data['telp'] = this.telp;
    return data;
  }
}

class Pengaduan {
  int? idPengaduan;
  String? tglPengaduan;
  String? isiLaporan;
  String? foto;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? masyarakatNik;

  Pengaduan(
      {this.idPengaduan,
      this.tglPengaduan,
      this.isiLaporan,
      this.foto,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.masyarakatNik});

  Pengaduan.fromJson(Map<String, dynamic> json) {
    idPengaduan = json['id_pengaduan'];
    tglPengaduan = json['tgl_pengaduan'];
    isiLaporan = json['isi_laporan'];
    foto = json['foto'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    masyarakatNik = json['masyarakatNik'];
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
    return data;
  }
}
