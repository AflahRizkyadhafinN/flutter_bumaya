import 'package:flutter/material.dart';
import 'package:flutter_fetch/controller.dart';
import 'package:get/get.dart';

class ScreenDua extends StatelessWidget {
  const ScreenDua({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: FutureBuilder(
            future: fetchPengaduan(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) => InfoBox(
                      posts: snapshot.data![index].posts,
                      firstname: snapshot.data![index].firstname,
                      createdAt: snapshot.data![index].createdAt),
                );
              } else if (snapshot.hasError) {
                throw Exception("Data Error");
              }
              return const Center(child: CircularProgressIndicator());
            }));
  }
}

class InfoBox extends StatelessWidget {
  const InfoBox(
      {super.key,
      required this.posts,
      required this.firstname,
      required this.createdAt});

  final List? posts;
  final String? firstname;
  final String? createdAt;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(const DetailInfo(), arguments: [firstname, posts]);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              CircleAvatar(
                maxRadius: 25,
                minRadius: 25,
                child: Text(
                  "${firstname}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${createdAt}",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[600]),
                  ),
                  for (int i = 0; i < posts!.length; i++)
                    SizedBox(
                        width: MediaQuery.sizeOf(context).width - 88,
                        child: Text(
                          posts![i]["title"],
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey[800]),
                        ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DetailInfo extends StatelessWidget {
  const DetailInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments;
    String firstname = arguments[0];
    List posts = arguments[1];
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(children: [
          Text(
            firstname,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w800,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          for (int i = 0; i < posts.length; i++)
            Column(
              children: [
                Text(
                  posts[i]["title"],
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                Text(
                  posts[i]["content"],
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10)
              ],
            ),
        ]),
      ),
    );
  }
}
