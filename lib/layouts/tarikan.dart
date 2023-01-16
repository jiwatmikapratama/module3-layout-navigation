import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:module3_layout_and_navigation/model/list_users_model.dart';
import 'package:module3_layout_and_navigation/services/list_users_services.dart';

class Tarikan extends StatefulWidget {
  const Tarikan({super.key, required this.user});

  final ListUsersModel user;
  @override
  State<Tarikan> createState() => _TarikanState();
}

class _TarikanState extends State<Tarikan> {
  final TextEditingController tarikanController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1a247f),
        title: Text('Tarikan'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 6.0),
                child: TextFormField(
                  controller: tarikanController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Masukan jumlah setoran...',
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () async {
                    print(widget.user.userId);
                    await tarikSaldo(
                        widget.user.userId, tarikanController.text);
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

  tarikSaldo(String? user_id, String jumlah) async {
    ListUsersService _service = ListUsersService();
    await _service.tarikSaldo(int.parse(user_id!), double.parse(jumlah));
  }
}
