import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class Ikon extends StatelessWidget {
  var imageicon;
  final String desc;
  Ikon(this.imageicon, this.desc);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      child: Card(
        elevation: 8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              imageicon,
              size: 50,
            ),
            Text(desc)
          ],
        ),
      ),
    );
  }
}
