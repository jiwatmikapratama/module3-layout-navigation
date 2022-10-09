import 'package:flutter/material.dart';

class Ikon extends StatelessWidget {
  var imageicon;
  final String desc;
  Ikon(this.imageicon, this.desc);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: 110,
        height: 110,
        color: Color(0xFFe8ebf5),
        child: Card(
          color: Color(0xFFe8ebf5),
          elevation: 8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                imageicon,
                size: 50,
                color: Color(0XFF0020f6),
              ),
              Text(
                desc,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
