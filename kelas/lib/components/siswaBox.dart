import 'package:flutter/material.dart';

class SiswaBox extends StatelessWidget {
  const SiswaBox({
    super.key,
    required this.nama,
  });
  final String? nama;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(
                Radius.circular(MediaQuery.sizeOf(context).width / 2)),
            child: Image.asset(
              "assets/images/pp kosong.jpg",
              height: 30,
            ),
          ),
          SizedBox(width: 10),
          Flexible(
            child: Text(
              "$nama",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
