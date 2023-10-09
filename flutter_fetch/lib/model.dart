import 'package:get/get.dart';

class User {
  final String id;
  final String name;
  final String email;

  const User({
    required this.id,
    required this.name,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(id: json["id"], name: json["name"], email: json["email"]);
  }
}

class StoredUser extends GetxController {
  RxList listUser = [].obs;
}

class Pengaduan {
  final int id;
  final String firstname;
  final String midlename;
  final String lastname;
  final String createdAt;
  final String updatedAt;
  final List posts;

  const Pengaduan({
    required this.id,
    required this.firstname,
    required this.midlename,
    required this.lastname,
    required this.createdAt,
    required this.updatedAt,
    required this.posts,
  });

  factory Pengaduan.fromJson(Map<String, dynamic> json) {
    return Pengaduan(
        id: json["id"],
        firstname: json["firstname"],
        midlename: json["midlename"],
        lastname: json["lastname"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        posts: json["posts"]);
  }
}
