import 'package:flutter/material.dart';

class HomeBox extends StatelessWidget {
  const HomeBox({
    super.key,
    required this.title,
    required this.color,
    required this.child,
  });

  final String? title;
  final Widget? child;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(color: Colors.amber[900]),
          child: Text(
            "$title",
            style: TextStyle(
                fontWeight: FontWeight.w700, fontSize: 20, color: Colors.white),
          ),
        ),
        Container(
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(color: color),
          child: child,
        )
      ],
    );
  }
}
