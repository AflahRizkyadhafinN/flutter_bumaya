import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
          body: RandomClass(),
        ));
  }
}

class RandomClass extends StatefulWidget {
  const RandomClass({super.key});

  @override
  State<RandomClass> createState() => _RandomClassState();
}

class _RandomClassState extends State<RandomClass> {
  double widthw = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: widthw,
          height: 10,
          decoration: BoxDecoration(color: Colors.blue),
        ),
        ElevatedButton(
            onPressed: () {
              setState(() {
                if (widthw < MediaQuery.sizeOf(context).width)
                  widthw += MediaQuery.sizeOf(context).width / 10;
                else
                  widthw = 0;
              });
            },
            child: Text("increase")),
        ElevatedButton(
            onPressed: () {
              setState(() {
                if (widthw < MediaQuery.sizeOf(context).width)
                  widthw += MediaQuery.sizeOf(context).width / 10;
                else
                  widthw = 0;
              });
            },
            child: Text("increase"))
      ],
    );
  }
}
