import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tutorial/controllers/number.dart';
import 'package:getx_tutorial/obx/sumxy/changeX.dart';
import 'package:getx_tutorial/obx/sumxy/changeY.dart';
import 'package:getx_tutorial/obx/sumxy/simpan.dart';

class MainXYScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(NumberModel());
    RxInt numberX = Get.find<NumberModel>().x;
    RxInt numberY = Get.find<NumberModel>().y;
    RxInt jumlah = 0.obs;

    return Scaffold(
      appBar: AppBar(
        title: Text("Sum (X,Y)"),
      ),
      body: ListView(
        children: [
          Container(
              margin: EdgeInsets.all(5),
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(color: Colors.yellow[700]),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text(
                    "Nilai X",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
                  ),
                  Obx(() => Text(
                        "$numberX",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Colors.white),
                      )),
                  Container(
                      padding: EdgeInsets.only(right: 5),
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Get.to(ChangeX());
                        },
                        child: Text(
                          "Ubah Nilai X",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                      ))
                ],
              )),
          Container(
              margin: EdgeInsets.all(5),
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(color: Colors.yellow[700]),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text(
                    "Nilai Y",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
                  ),
                  Obx(() => Text(
                        "$numberY",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Colors.white),
                      )),
                  Container(
                      padding: EdgeInsets.only(right: 5),
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Get.to(ChangeY());
                        },
                        child: Text(
                          "Ubah Nilai Y",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                      ))
                ],
              )),
          GestureDetector(
            onTap: () {
              jumlah.value = numberX.toInt() + numberY.toInt();
            },
            child: Container(
              margin: EdgeInsets.all(5),
              width: MediaQuery.sizeOf(context).width,
              height: 75,
              decoration: BoxDecoration(color: Colors.yellow[700]),
              alignment: Alignment.center,
              child: Text(
                "Jumlahkan",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Colors.white),
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.all(5),
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(color: Colors.yellow[700]),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text(
                    "Jumlah",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
                  ),
                  Obx(() => Text(
                        "$jumlah",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Colors.white),
                      )),
                ],
              )),
          GestureDetector(
            onTap: () {
              Get.find<SimpanModel>().changeSimpan(jumlah);
              // print(Get.find<SimpanModel>().listSimpan);
            },
            child: Container(
              margin: EdgeInsets.all(5),
              width: MediaQuery.sizeOf(context).width,
              height: 75,
              decoration: BoxDecoration(color: Colors.yellow[700]),
              alignment: Alignment.center,
              child: Text(
                "Simpan Jumlah",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Colors.white),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.to(SimpanScreen());
            },
            child: Container(
              margin: EdgeInsets.all(5),
              width: MediaQuery.sizeOf(context).width,
              height: 75,
              decoration: BoxDecoration(color: Colors.yellow[700]),
              alignment: Alignment.center,
              child: Text(
                "Lihat Simpanan",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
