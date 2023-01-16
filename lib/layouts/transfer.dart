import 'package:flutter/material.dart';
import 'package:module3_layout_and_navigation/model/list_users_model.dart';
import 'package:module3_layout_and_navigation/services/list_users_services.dart';

class Transfer extends StatefulWidget {
  const Transfer({super.key, required this.user});

  final ListUsersModel user;
  @override
  State<Transfer> createState() => _TransferState();
}

class _TransferState extends State<Transfer> {
  final TextEditingController transferController = new TextEditingController();
  final TextEditingController nomorRekeningController =
      new TextEditingController();

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
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 6.0),
                child: TextFormField(
                  controller: transferController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Masukan jumlah yang akan ditransfer...',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 6.0),
                child: TextFormField(
                  controller: nomorRekeningController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Masukan nomor rekening tujuan...',
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () async {
                    print(widget.user.userId);
                    await transfer(widget.user.userId, transferController.text,
                        nomorRekeningController.text);
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(builder: (context) => Home()),
                    // );
                    // Navigator.pop(context);
                    print('object');
                  },
                  child: Text('OK'))
            ]),
          ),
        ],
      ),
    );
  }

  transfer(String? user_id, String jumlah, String nomorRekening) async {
    ListUsersService _service = ListUsersService();
    await _service.transfer(
        int.parse(user_id!), double.parse(jumlah), nomorRekening);
  }
}
