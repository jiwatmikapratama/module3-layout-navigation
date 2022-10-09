import 'package:flutter/material.dart';

class detailbox extends StatelessWidget {
  final String title;
  final String desc;
  detailbox(this.title, this.desc);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      child: Card(
        color: const Color(0xFFc6cae8),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
              width: 200,
              child: Text(
                title,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
              width: 200,
              child: Text(
                desc,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
