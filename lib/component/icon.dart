import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class Ikon extends StatelessWidget {
  var imageicon;
  final String desc;
  Ikon(this.imageicon, this.desc);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: ResponsiveValue(context, defaultValue: 120.0, valueWhen: const [
          Condition.largerThan(name: MOBILE, value: 180.0),
          Condition.largerThan(name: TABLET, value: 220.0)
        ]).value,
        height: ResponsiveValue(context, defaultValue: 120.0, valueWhen: const [
          Condition.largerThan(name: MOBILE, value: 180.0),
          Condition.largerThan(name: TABLET, value: 220.0)
        ]).value,
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
