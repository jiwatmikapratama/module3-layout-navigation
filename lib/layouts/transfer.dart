import 'package:flutter/material.dart';
import 'package:module3_layout_and_navigation/model/list_users_model.dart';
import 'package:module3_layout_and_navigation/services/list_users_services.dart';

class Transfer extends StatefulWidget {
  const Transfer({super.key});

  @override
  State<Transfer> createState() => _TransferState();
}

class _TransferState extends State<Transfer> {
  //1. buat variabel list user model
  List<ListUsersModel> _listUser = [];

  //2. buat fungsi get data user
  getUsers() async {
    ListUsersService _service = ListUsersService();
    await _service.getDataUsers().then(
      (value) {
        if (value != null) {
          print(value);
        }

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
          title: Text('Transfer'),
          actions: [
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    getUsers();
                  },
                  child: Icon(
                    Icons.refresh,
                    size: 26.0,
                  ),
                )),
          ]),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: _listUser.length,
                itemBuilder: (context, index) {
                  ListUsersModel data = _listUser[index];
                  return cardlist(
                      data.userId!,
                      data.username!,
                      data.password!,
                      data.nama!,
                      data.saldo!,
                      Colors.red,
                      Colors.grey.shade100);
                }),
          ),
        ],
      ),
    );
  }
}

Widget cardlist(String UserId, String username, String password, String nama,
    String saldo, Color color, Color bgColor) {
  return Card(
    color: bgColor,
    child: ListTile(
      title: Text(username + ' ' + password,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Text(nama), Text(saldo)],
      ),
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
