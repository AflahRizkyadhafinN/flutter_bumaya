import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "User\nLogin",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromARGB(255, 123, 35, 153),
                fontSize: 40,
                fontWeight: FontWeight.w900,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              height: 115,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize:
                              Size(MediaQuery.sizeOf(context).width / 2, 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(
                                  MediaQuery.sizeOf(context).width / 2)))),
                      onPressed: () {
                        Get.toNamed("/petugas");
                      },
                      child: const Text("Petugas")),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize:
                              Size(MediaQuery.sizeOf(context).width / 2, 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(
                                  MediaQuery.sizeOf(context).width / 2)))),
                      onPressed: () {
                        Get.toNamed("/masyarakat");
                      },
                      child: const Text("Masyarakat")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
