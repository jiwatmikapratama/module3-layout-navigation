import 'package:dio/dio.dart';
import 'package:module3_layout_and_navigation/model/list_users_model.dart';

class ListUsersService {
  Dio dio = Dio();
  Future<List<ListUsersModel>?> getDataUsers() async {
    String url =
        "http://apikoperasi.rey1024.com/users"; //membuat variabel untuk menampung url
    final Response
        response; // membuat variabel response untuk menampung hasil request
    try {
      response = await dio.get(
        url,
      );
      if (response.statusCode == 200) {
        var json = response.data;
        //boleh dipakai sesuai kondisi data json

        if (json is List) {
          return json
              .map<ListUsersModel>((u) => ListUsersModel.fromJson(u))
              .toList();
        }
      }
      return null;
    } on DioError catch (error, stacktrace) {
      print('Exception occured: $error stackTrace: $stacktrace');
      throw Exception(error.response);
    }
  }

  postLogin(String username, String password) async {
    String url = 'http://apikoperasi.rey1024.com';
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
        // return true;
        return ListUsersModel(
          userId: data[0]['user_id'],
          username: username,
          password: password,
          nama: data[0]['nama'],
          saldo: data[0]['saldo'],
          nomorRekening: data[0]['nomor_rekening'],
        );
      }
    } catch (e) {
      print('gagal');
    }
  }

  getsingleuser(int user_id) async {
    String url = 'http://apikoperasi.rey1024.com/getsingleuser';
    final Response response;
    FormData formData = FormData.fromMap({"user_id": user_id});
    try {
      response = await dio.post(url, data: formData);
      print(response.data);
      print('berhasil');
    } catch (e) {
      print('gagal');
    }
  }

  getsaldo(int user_id) async {
    String url = 'http://apikoperasi.rey1024.com/getsingleuser';
    final Response response;
    FormData formData = FormData.fromMap({"user_id": user_id});
    try {
      response = await dio.post(url, data: formData);
      print(response.data);
      if (response.statusCode == 200) {
        print('berhasil');
        final data = response.data;
        print(data[0]['saldo']);
        return int.parse(data[0]['saldo']);
        // return print(response.statusCode);
      } else {
        return print('gagal');
      }
    } catch (e) {
      print('gagal');
    }
  }

  setorSaldo(int user_id, double jumlah) async {
    String url = 'http://apikoperasi.rey1024.com/setoran';
    final Response response;
    FormData formData =
        FormData.fromMap({"user_id": user_id, "jumlah_setoran": jumlah});
    try {
      response = await dio.post(url, data: formData);
      print('berhasil');
    } catch (e) {
      print('gagal');
    }
  }

  tarikSaldo(int user_id, double jumlah) async {
    String url = 'http://apikoperasi.rey1024.com/tarikan';
    final Response response;
    FormData formData =
        FormData.fromMap({"user_id": user_id, "jumlah_tarikan": jumlah});
    try {
      response = await dio.post(url, data: formData);
      print('berhasil');
      return true;
    } catch (e) {
      print('gagal');
    }
  }

  transfer(
    int user_id,
    double jumlah,
    String nomor_rekening,
  ) async {
    String url = 'http://apikoperasi.rey1024.com/transfer';
    final Response response;
    FormData formData = FormData.fromMap({
      "id_pengirim": user_id,
      "jumlah_transfer": jumlah,
      "nomor_rekening": nomor_rekening
    });
    try {
      response = await dio.post(url, data: formData);
      print('berhasil');
      return true;
    } catch (e) {
      print('gagal');
    }
  }

  postRegister(
      String username, String password, String nama, String nim) async {
    String url = 'http://apikoperasi.rey1024.com/register';
    final Response response;
    FormData formData = FormData.fromMap(
        {"username": username, "password": password, "nama": nama, "nim": nim});
    response = await dio.post(
      url,
      data: formData,
    );
    if (response.data['status'] == "success") {
      print('Berhasil');
    } else {
      print(response.data);
      // return postRegister(username, password, nama, nim);
    }
  }
}
