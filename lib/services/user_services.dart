import 'package:dio/dio.dart';
import 'package:module3_layout_and_navigation/model/user.dart';

class UserService {
  Future<List<dynamic>?> getdata() async {
    Dio dio = Dio();

    String _url = 'https://reqres.in/api/users?page=2';
    final Response response;

    try {
      response = await dio.get(_url);
      if (response.statusCode == 200) {
        var json = response.data;
        if (json is Map && json.keys.contains('data')) {
          var data = json['data'];
          if (data is List) {
            return data.map<User>((u) => User.fromJson(u)).toList();
          }
        }
      }
    } catch (e) {}
  }
}
