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
        width: ResponsiveValue(context, defaultValue: 120.0, valueWhen: [
          Condition.largerThan(name: MOBILE, value: 180.0),
          Condition.largerThan(name: TABLET, value: 220.0),
          Condition.largerThan(
              name: DESKTOP, value: MediaQuery.of(context).size.width * 5)
        ]).value,
        height: ResponsiveValue(context, defaultValue: 120.0, valueWhen: [
          Condition.largerThan(name: MOBILE, value: 180.0),
          Condition.largerThan(name: TABLET, value: 220.0),
          Condition.largerThan(
              name: DESKTOP, value: MediaQuery.of(context).size.height * 5)
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
                size: ResponsiveValue(context,
                    defaultValue: 50.0,
                    valueWhen: const [
                      Condition.largerThan(name: MOBILE, value: 75.0),
                      Condition.largerThan(name: TABLET, value: 85.0),
                      Condition.largerThan(name: DESKTOP, value: 100.0),
                    ]).value,
                color: Color(0XFF0020f6),
              ),
              Text(
                desc,
                style: TextStyle(
                  fontSize: ResponsiveValue(context,
                      defaultValue: 18.0,
                      valueWhen: const [
                        Condition.largerThan(name: MOBILE, value: 24.0),
                        Condition.largerThan(name: TABLET, value: 30.0),
                        Condition.largerThan(name: DESKTOP, value: 42.0),
                      ]).value,
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
