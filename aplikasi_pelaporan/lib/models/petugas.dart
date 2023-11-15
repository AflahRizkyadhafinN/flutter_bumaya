class Petugas {
  int? idPetugas;
  String? nama;
  String? username;
  String? password;
  String? telp;
  String? level;
  String? createdAt;
  String? updatedAt;

  Petugas(
      {this.idPetugas,
      this.nama,
      this.username,
      this.password,
      this.telp,
      this.level,
      this.createdAt,
      this.updatedAt});

  Petugas.fromJson(Map<String, dynamic> json) {
    idPetugas = json['id_petugas'];
    nama = json['nama'];
    username = json['username'];
    password = json['password'];
    telp = json['telp'];
    level = json['level'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_petugas'] = this.idPetugas;
    data['nama'] = this.nama;
    data['username'] = this.username;
    data['password'] = this.password;
    data['telp'] = this.telp;
    data['level'] = this.level;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
