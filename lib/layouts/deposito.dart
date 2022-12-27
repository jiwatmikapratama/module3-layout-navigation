import 'package:flutter/material.dart';
import 'package:module3_layout_and_navigation/layouts/home.dart';
import 'package:module3_layout_and_navigation/model/list_users_model.dart';
import 'package:module3_layout_and_navigation/services/list_users_services.dart';

class Deposito extends StatefulWidget {
  const Deposito({super.key});

  @override
  State<Deposito> createState() => _DepositoState();
}

class _DepositoState extends State<Deposito> {
  bool setorLoading = false;
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
          setorLoading = false;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1a247f),
        title: Text('Deposito'),
        actions: <Widget>[
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
        ],
      ),
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
          trailing: IconButton(
              onPressed: () async {
                setState(() {
                  // setorLoading = true;
                });
                await deposito(UserId);
              },
              icon: Icon(Icons.upload))),
    );
  }

  deposito(String? user_id) {
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
