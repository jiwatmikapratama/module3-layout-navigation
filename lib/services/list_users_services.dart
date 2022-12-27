import 'package:dio/dio.dart';
import 'package:module3_layout_and_navigation/model/list_users_model.dart';

class ListUsersService {
  Dio dio = Dio();
  Future<List<ListUsersModel>?> getDataUsers() async {
    String url =
        "https://koperasiundiksha.000webhostapp.com/users"; //membuat variabel untuk menampung url
    final Response
        response; // membuat variabel response untuk menampung hasil request
    try {
      response = await dio.get(
        url,
      );
      if (response.statusCode == 200) {
        var json = response.data;
        //boleh dipakai sesuai kondisi data json
        if (json is Map && json.keys.contains('data')) {
          var data = json['data'];
          if (data is List) {
            return data
                .map<ListUsersModel>((u) => ListUsersModel.fromJson(u))
                .toList();
          }
        }
      }
      return null;
    } on DioError catch (error, stacktrace) {
      print('Exception occured: $error stackTrace: $stacktrace');
      throw Exception(error.response);
    }
  }

  postLogin(String username, String password) async {
    String url = 'https://koperasiundiksha.000webhostapp.com';
    final Response response;
    FormData formData =
        FormData.fromMap({"username": username, "password": password});
    try {
      // dio.options.headers['Authentication']
      response = await dio.post(url, data: formData);
      print(response.data);
      // print(response.data[0]["nama"]);
      if (response.statusCode == 200) {
        final data = response.data;
        // return ListUsersModel(
        //   userId: data["user_id"],
        //   username: data["username"],
        //   password: data["password"],
        //   nama: data["nama"],
        //   saldo: data["saldo"],
        // );
        return true;
      }
    } catch (e) {}
  }

  setorSaldo(int user_id, double jumlah) async {
    String url = 'https://koperasiundiksha.000webhostapp.com/setoran';
    final Response response;
    FormData formData =
        FormData.fromMap({"user_id": user_id, "jumlah": jumlah});
    try {
      response = await dio.post(url, data: formData);
      print('berhasil');
    } catch (e) {
      print('gagal');
    }
  }

  tarikSaldo(int user_id, double jumlah) async {
    String url = 'https://koperasiundiksha.000webhostapp.com/tarikan';
    final Response response;
    FormData formData =
        FormData.fromMap({"user_id": user_id, "jumlah": jumlah});
    try {
      response = await dio.post(url, data: formData);
      print('berhasil');
      return true;
    } catch (e) {
      print('gagal');
    }
  }

  postRegister(String username, String password, String nama) async {
    String url = 'https://koperasiundiksha.000webhostapp.com/register';
    final Response response;
    FormData formData = FormData.fromMap(
        {"username": username, "password": password, "nama": nama});
    response = await dio.post(
      url,
      data: formData,
    );
    if (response.data['pesan'] == "Data berhasil disimpan, saldo awal 50.000") {
      print('Berhasil');
      return true;
    } else {
      print(response.data);
      return postRegister(username, password, nama);
    }
  }
}
