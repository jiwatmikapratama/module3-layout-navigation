// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:module3_layout_and_navigation/component/icon.dart';
import 'package:module3_layout_and_navigation/layouts/setoran.dart';
import 'package:module3_layout_and_navigation/layouts/login.dart';
import 'package:module3_layout_and_navigation/component/detailbox.dart';
import 'package:module3_layout_and_navigation/layouts/pembayaran.dart';
import 'package:module3_layout_and_navigation/layouts/pinjaman.dart';
import 'package:module3_layout_and_navigation/layouts/tarikan.dart';
import 'package:module3_layout_and_navigation/layouts/transfer.dart';
import 'package:module3_layout_and_navigation/model/list_users_model.dart';
import 'package:module3_layout_and_navigation/services/list_users_services.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.user});

  final ListUsersModel user;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late int saldo = int.parse(widget.user.saldo.toString());
  getsingleuser(String? user_id) async {
    ListUsersService _service = ListUsersService();
    await _service.getsingleuser(int.parse(user_id!));
  }

  String _scanBarcode = '';
  // Uri _url = Uri.parse(_scanBarcode);

  @override
  void initState() {
    super.initState();
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(Uri.parse(_scanBarcode))) {
      throw 'Could not launch $_scanBarcode';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF1a247f),
          title: Center(
            child: Text(
              'Koperasi Undiksha',
              style: TextStyle(
                fontSize: ResponsiveValue(context,
                    defaultValue: 20.0,
                    valueWhen: const [
                      Condition.largerThan(name: MOBILE, value: 22.0),
                      Condition.largerThan(name: TABLET, value: 25.0)
                    ]).value,
              ),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
              icon: Icon(
                Icons.logout,
                size: ResponsiveValue(context,
                    defaultValue: 20.0,
                    valueWhen: const [
                      Condition.largerThan(name: MOBILE, value: 30.0),
                      Condition.largerThan(name: TABLET, value: 35.0)
                    ]).value,
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xFFe8ebf5),
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                  color: Color(0XFF0020f6),
                  size: ResponsiveValue(context,
                      defaultValue: 40.0,
                      valueWhen: const [
                        Condition.largerThan(name: MOBILE, value: 45.0),
                        Condition.largerThan(name: TABLET, value: 50.0)
                      ]).value,
                ),
                label: 'Setting'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: Color(0XFF0020f6),
                  size: ResponsiveValue(context,
                      defaultValue: 40.0,
                      valueWhen: const [
                        Condition.largerThan(name: MOBILE, value: 45.0),
                        Condition.largerThan(name: TABLET, value: 50.0)
                      ]).value,
                ),
                label: 'Profile'),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFF1C2474),
          onPressed: () {
            scanQR();
          },
          child: Container(
            margin: const EdgeInsets.all(15.0),
            child: const Icon(Icons.qr_code_scanner),
          ),
          elevation: 4.0,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ResponsiveRowColumn(
                  rowMainAxisAlignment: MainAxisAlignment.start,
                  layout: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                      ? ResponsiveRowColumnType.COLUMN
                      : ResponsiveRowColumnType.ROW,
                  children: [
                    ResponsiveRowColumnItem(
                      rowFlex: 1,
                      child: Material(
                        elevation: 8,
                        child: Container(
                          margin: const EdgeInsets.all(3.0),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xFF1a227f),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8)),
                          child: ResponsiveRowColumn(
                            rowMainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            layout: ResponsiveWrapper.of(context)
                                    .isLargerThan(DESKTOP)
                                ? ResponsiveRowColumnType.ROW
                                : ResponsiveRowColumnType.COLUMN,
                            children: [
                              ResponsiveRowColumnItem(
                                child: ResponsiveRowColumn(
                                  rowMainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  layout: ResponsiveWrapper.of(context)
                                          .isLargerThan(TABLET)
                                      ? ResponsiveRowColumnType.COLUMN
                                      : ResponsiveRowColumnType.ROW,
                                  children: [
                                    ResponsiveRowColumnItem(
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.3,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.2,
                                        padding: EdgeInsets.all(5.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          child: Image(
                                            image: AssetImage(
                                                'images/Foto Berjas No Gaya.png'),
                                          ),
                                        ),
                                      ),
                                    ),
                                    ResponsiveRowColumnItem(
                                      child: ResponsiveRowColumn(
                                        layout: ResponsiveWrapper.of(context)
                                                .isLargerThan(TABLET)
                                            ? ResponsiveRowColumnType.COLUMN
                                            : ResponsiveRowColumnType.COLUMN,
                                        rowMainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        // crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          ResponsiveRowColumnItem(
                                            child: detailbox('Nasabah',
                                                widget.user.nama.toString()),
                                          ),
                                          ResponsiveRowColumnItem(
                                            child: detailbox(
                                                'Total Saldo', saldo.toString()
                                                // widget.user.saldo.toString(),
                                                ),
                                          ),
                                          ResponsiveRowColumnItem(
                                              child: ElevatedButton(
                                            onPressed: () {
                                              showDialog(
                                                context: context,
                                                builder: (_) => AlertDialog(
                                                  title: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text('Detail User'),
                                                      Text('No Rekening: ' +
                                                          widget.user
                                                              .nomorRekening
                                                              .toString()),
                                                      Text('Nama User: ' +
                                                          widget.user.nama
                                                              .toString()),
                                                      Text('Username: ' +
                                                          widget.user.username
                                                              .toString()),
                                                    ],
                                                  ),
                                                  actions: [
                                                    TextButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Text('OK'))
                                                  ],
                                                ),
                                              );

                                              getsingleuser(widget.user.userId);
                                            },
                                            child: Text('Detail'),
                                          )),
                                          ResponsiveRowColumnItem(
                                            child: IconButton(
                                                onPressed: () async {
                                                  ListUsersService _service =
                                                      ListUsersService();
                                                  saldo = await _service
                                                      .getsaldo(int.parse(widget
                                                          .user.userId
                                                          .toString()));
                                                  setState(() {});
                                                },
                                                icon: Icon(Icons.refresh)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // child: Image.asset(),

                              // Image radius
                            ],
                          ),
                        ),
                      ),
                    ),
                    ResponsiveRowColumnItem(
                      rowFlex: 1,
                      child: Material(
                        elevation: 10,
                        child: Container(
                          width: double.infinity,
                          margin:
                              const EdgeInsets.fromLTRB(3.0, 15.0, 3.0, 10.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(0xFF1a247f),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Wrap(
                            runAlignment: WrapAlignment.center,
                            runSpacing: 10.0,
                            alignment: WrapAlignment.spaceEvenly,
                            children: [
                              Ikon(
                                  Icons.monetization_on,
                                  'Transfer',
                                  Transfer(
                                    user: widget.user,
                                  )),
                              Ikon(
                                  Icons.money,
                                  'Setoran',
                                  Setoran(
                                    user: widget.user,
                                  )),
                              Ikon(
                                  Icons.money,
                                  'Tarikan',
                                  Tarikan(
                                    user: widget.user,
                                  )),
                              Ikon(Icons.attach_money, 'Pinjaman', Pinjaman()),
                              // Ikon(Icons.insert_chart, 'Mutasi', Mutasi()),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                (Container(
                  width: double.infinity,
                  color: const Color(0xFFe8ebf5),
                  margin: const EdgeInsets.fromLTRB(3.0, 15.0, 3.0, 10.0),
                  padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Butuh Bantuan?',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: ResponsiveValue(context,
                                  defaultValue: 24.0,
                                  valueWhen: const [
                                    Condition.largerThan(
                                        name: MOBILE, value: 26.0),
                                    Condition.largerThan(
                                        name: TABLET, value: 30.0)
                                  ]).value,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            '0857-9223-6153',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: ResponsiveValue(context,
                                  defaultValue: 24.0,
                                  valueWhen: const [
                                    Condition.largerThan(
                                        name: MOBILE, value: 26.0),
                                    Condition.largerThan(
                                        name: TABLET, value: 30.0)
                                  ]).value,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.phone,
                        size: ResponsiveValue(context,
                            defaultValue: 50.0,
                            valueWhen: const [
                              Condition.largerThan(name: MOBILE, value: 55.0),
                              Condition.largerThan(name: TABLET, value: 60.0)
                            ]).value,
                        color: Color(0XFF0020f6),
                      ),
                    ],
                  ),
                )),
                (Container(
                    width: double.infinity,
                    color: const Color(0xFFe8ebf5),
                    margin: const EdgeInsets.fromLTRB(3.0, 15.0, 3.0, 10.0),
                    padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 10.0),
                    child: ElevatedButton(
                      onPressed: () {
                        _launchUrl();
                      },
                      child: Text('_Scan result : $_scanBarcode\n'),
                    )))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
