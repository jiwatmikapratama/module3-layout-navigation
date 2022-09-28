// ignore_for_file: avoid_unnecessary_containers

import 'dart:ui';

import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF1a247f),
          title: const Center(
            child: Text("Koperasi Undiksha"),
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Image.asset(
                    'images/LOGO UNDIKSHA.png',
                    scale: 1.6,
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xFF1a227f),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(
                                bottom: 12,
                              ),
                              child: Text(
                                'Username',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Container(
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(
                                bottom: 12,
                              ),
                              child: Text(
                                'Password',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Container(
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 200,
                        height: 50,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Color(0xFF1a247f),
                            shadowColor: Colors.black,
                            elevation: 8,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ),
                          onPressed: () {
                            // Respond to button press
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      Container(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            style: TextButton.styleFrom(
                              foregroundColor: Color(0xFF5b59f1),
                            ),
                            onPressed: () {
                              // Respond to button press
                            },
                            child: Text(
                              "Daftar MBanking",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              foregroundColor: Color(0xFF5b59f1),
                            ),
                            onPressed: () {
                              // Respond to button press
                            },
                            child: Text(
                              "Lupa password?",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      )),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  color: Color(0xFFc6cae8),
                  margin: EdgeInsets.only(top: 20.0),
                  padding: EdgeInsets.all(20),
                  child: Center(
                    child: Text(
                      'Copyright @2022 by Undiksha',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
