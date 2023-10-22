class Masyarakat {
  final String nik;
  final String nama;
  final String username;
  final String password;
  final String telp;

  const Masyarakat({
    required this.nik,
    required this.nama,
    required this.username,
    required this.password,
    required this.telp,
  });

  factory Masyarakat.fromJson(Map<String, dynamic> json) {
    return Masyarakat(
        nik: json["nik"],
        nama: json["nama"],
        username: json["username"],
        password: json["password"],
        telp: json["telp"]);
  }
}
