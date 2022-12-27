import 'package:flutter/material.dart';
import 'package:module3_layout_and_navigation/model/list_users_model.dart';
import 'package:module3_layout_and_navigation/services/list_users_services.dart';

class Pembayaran extends StatefulWidget {
  const Pembayaran({super.key});

  @override
  State<Pembayaran> createState() => _PembayaranState();
}

class _PembayaranState extends State<Pembayaran> {
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
        title: Text('Pembayaran'),
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
          title: Text(username,
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
                await tarik(UserId);
              },
              icon: Icon(Icons.upload))),
    );
  }

  tarik(String? user_id) {
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
                    await tarikSaldo(user_id, jumlah.text);
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

  tarikSaldo(String? user_id, String jumlah) async {
    ListUsersService _service = ListUsersService();
    await _service.tarikSaldo(int.parse(user_id!), double.parse(jumlah));
  }
}
