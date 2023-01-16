import 'package:flutter/material.dart';
import 'package:module3_layout_and_navigation/layouts/home.dart';
import 'package:module3_layout_and_navigation/model/list_users_model.dart';
import 'package:module3_layout_and_navigation/services/list_users_services.dart';

class Setoran extends StatefulWidget {
  const Setoran({super.key, required this.user});

  final ListUsersModel user;
  @override
  State<Setoran> createState() => _SetoranState();
}

class _SetoranState extends State<Setoran> {
  final TextEditingController setoranController = new TextEditingController();

  bool setorLoading = false;
  //1. buat variabel list user model

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1a247f),
        title: Text('Setoran'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 6.0),
                child: TextFormField(
                  controller: setoranController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Masukan jumlah setoran...',
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () async {
                    print(widget.user.userId);
                    await setorSaldo(
                        widget.user.userId, setoranController.text);
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(builder: (context) => Home()),
                    // );
                    Navigator.pop(context);
                  },
                  child: Text('OK'))
            ]),
          ),
        ],
      ),
    );
  }

  setoran(String? user_id) {
    TextEditingController jumlah = TextEditingController();
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Are You Sure?'),
        actions: [
          TextField(
            controller: jumlah,
            keyboardType: TextInputType.number,
          ),
          (setorLoading)
              ? CircularProgressIndicator()
              : ElevatedButton(
                  onPressed: () async {
                    await setorSaldo(user_id, jumlah.text);
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(builder: (context) => Home()),
                    // );
                    Navigator.pop(context);
                  },
                  child: Text('Yes'),
                ),
        ],
      ),
    );
  }

  setorSaldo(String? user_id, String jumlah) async {
    ListUsersService _service = ListUsersService();
    await _service.setorSaldo(int.parse(user_id!), double.parse(jumlah));
  }
}
