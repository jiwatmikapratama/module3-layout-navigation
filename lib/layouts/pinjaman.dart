import 'dart:math';

import 'package:flutter/material.dart';
import 'package:module3_layout_and_navigation/model/list_users_model.dart';
import 'package:module3_layout_and_navigation/services/list_users_services.dart';

class Pinjaman extends StatefulWidget {
  @override
  State<Pinjaman> createState() => _PinjamanState();
}

class _PinjamanState extends State<Pinjaman> {
  //1. buat variabel list user model
  List<ListUsersModel> _listUser = [];

  //2. buat fungsi get data user
  getUsers() async {
    ListUsersService _service = ListUsersService();
    await _service.getDataUsers().then(
      (value) {
        print(value);
        setState(() {
          _listUser = value!;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1a247f),
        title: Text('Halaman Pinjaman'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              getUsers();
            },
            child: Text(
              'Show Data',
              style: TextStyle(fontSize: 25),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: _listUser.length,
                itemBuilder: (context, index) {
                  ListUsersModel data = _listUser[index];
                  return cardlist(
                      data.userId!.toString(),
                      data.username!,
                      data.password!,
                      data.nama!,
                      data.saldo!.toString(),
                      Colors.red,
                      Colors.grey.shade100);
                }),
          ),
        ],
      ),
    );
  }

  Widget cardlist(String UserId, String username, String password, String nama,
      String saldo, Color color, Color bgColor) {
    return Card(
      color: bgColor,
      child: ListTile(
        title: Text(username + ' ' + password,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        subtitle: Text(saldo),
        // leading: Container(
        //   height: 40,
        //   width: 40,
        //   child: Image.network(
        //     nama,
        //     scale: 1,
        //   ),
        // ),
      ),
    );
  }
}
