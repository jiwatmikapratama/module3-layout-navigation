import 'package:flutter/material.dart';

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
              icon: Icon(Icons.logout),
            ),
          ],
        ),
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
                            padding: EdgeInsets.all(5.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(40),
                              child: Image(
                                image: AssetImage(
                                    'images/Foto Berjas No Gaya.png'),
                              ),
                              // child: Image.asset(),
                            )
                            // Image radius
                            ),
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 250,
                              child: Card(
                                color: const Color(0xFF5b59f1),
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
                                color: const Color(0xFF5b59f1),
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

                        // Container(
                        //   width: 100,
                        //   height: 100,
                        //   child: Image.asset('images/LOGO UNDIKSHA.png'),
                        // ),
                      ],
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
