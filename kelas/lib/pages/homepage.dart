import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kelas/components/drawerPage.dart';
import 'package:kelas/components/homeBox.dart';
import 'package:kelas/components/siswaBox.dart';
import 'package:kelas/controllers/mainController.dart';

class HomepageScreen extends StatelessWidget {
  const HomepageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MainController mainController = Get.put(MainController());

    RxInt jumlah = 0.obs;
    RxBool isOpen = true.obs;

    void switchChange() {
      jumlah < 35 ? isOpen.value = true : isOpen.value = false;
    }

    return Scaffold(
      appBar: AppBar(actions: [DrawerPage()]),
      body: Obx(
        () => ListView(
          children: [
            HomeBox(
                title: "XII RPL 2",
                color: Colors.amber[300],
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Jumlah Siswa : $jumlah"),
                          Container(
                            child: Row(children: [
                              IconButton(
                                  onPressed: () {
                                    if (isOpen.value) jumlah.value++;
                                    switchChange();
                                  },
                                  icon: Icon(Icons.add)),
                              IconButton(
                                  onPressed: () {
                                    if (jumlah.value > 0) jumlah.value--;
                                    switchChange();
                                  },
                                  icon: Icon(Icons.remove))
                            ]),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(isOpen.value ? "Opened" : "Closed"),
                          Switch(value: isOpen.value, onChanged: (value) {})
                        ],
                      )
                    ],
                  ),
                )),
            HomeBox(
                title: "Nama Siswa",
                color: Colors.blue[200],
                child: Container(
                  padding: const EdgeInsets.all(10),
                  height: 150,
                  child: ListView.builder(
                    itemCount: mainController.siswa.length,
                    itemBuilder: (context, index) =>
                        SiswaBox(nama: mainController.siswa[index]),
                  ),
                )),
            HomeBox(
                title: "Nama mapel",
                color: Colors.orange[200],
                child: Container(
                  padding: const EdgeInsets.all(10),
                  height: 150,
                  child: ListView.builder(
                      itemCount: mainController.mapel.length,
                      itemBuilder: (context, index) {
                        String key = mainController.mapel.keys.elementAt(index);
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              key,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 15),
                            ),
                            Text(
                              mainController.mapel[key],
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 15),
                            )
                          ],
                        );
                      }),
                )),
          ],
        ),
      ),
    );
  }
}
