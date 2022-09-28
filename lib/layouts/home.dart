import 'package:flutter/material.dart';
import 'package:module3_layout_and_navigation/component/icon.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF1a247f),
          title: const Center(
            child: Text('Koperasi Undiksha'),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.logout),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                  color: Color(0XFF0020f6),
                  size: 40,
                ),
                label: 'Setting'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: Color(0XFF0020f6),
                  size: 40,
                ),
                label: 'Profile'),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFF1C2474),
          onPressed: () {},
          child: Container(
            margin: EdgeInsets.all(15.0),
            child: Icon(Icons.qr_code_scanner),
          ),
          elevation: 4.0,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Material(
                  elevation: 8,
                  child: Container(
                    margin: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xFF1a227f),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            width: 140,
                            height: 140,
                            padding: const EdgeInsets.all(5.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(40),
                              child: const Image(
                                image: AssetImage(
                                    'images/Foto Berjas No Gaya.png'),
                              ),
                              // child: Image.asset(),
                            )
                            // Image radius
                            ),
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 250,
                              child: Card(
                                color: const Color(0xFFc6cae8),
                                child: Column(
                                  children: [
                                    Container(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      width: 200,
                                      child: const Text(
                                        'Nasabah',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      width: 200,
                                      child: const Text(
                                        'I Putu Pratama Putra Jiwatmika',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: 250,
                              child: Card(
                                color: const Color(0xFFc6cae8),
                                child: Column(
                                  children: [
                                    Container(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      width: 200,
                                      child: const Text(
                                        'Total Saldo Anda',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      width: 200,
                                      child: const Text(
                                        'Rp. 12000.000',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Material(
                  elevation: 8,
                  child: Container(
                    height: 260,
                    margin: const EdgeInsets.fromLTRB(3.0, 15.0, 3.0, 10.0),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xFF1a247f),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Ikon(Icons.payment, 'desc'),
                            Ikon(Icons.abc, 'desc'),
                            Ikon(Icons.abc, 'desc'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Ikon(Icons.payment, 'desc'),
                            Ikon(Icons.abc, 'desc'),
                            Ikon(Icons.abc, 'desc'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  color: const Color(0xFFe8ebf5),
                  margin: EdgeInsets.fromLTRB(3.0, 15.0, 3.0, 10.0),
                  padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 200,
                            child: const Text(
                              'Butuh Bantuan?',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Container(
                            width: 200,
                            child: const Text(
                              '0878-1234-1024',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )
                        ],
                      ),
                      Container(
                        child: const Icon(
                          Icons.phone,
                          size: 50,
                          color: Color(0XFF0020f6),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
