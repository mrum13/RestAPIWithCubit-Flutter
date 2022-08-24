import 'dart:convert';

import 'package:flutter_consume_api/models/user_model.dart';
import 'package:http/http.dart' as http;

class GetSingleUserService {
  String baseUrl = 'https://reqres.in';

  Future<UserModel> getUser() async {
    var url = 'https://reqres.in/api/users/4';
    var header = {
      'Accept': 'application/json',
    };

    var response = await http.get(
      Uri.parse(url),
      headers: header,
    );

    print('getUser status code=' + response.statusCode.toString());

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      UserModel user = UserModel.fromJson(data);
      return user;
    } else {
      throw Exception("Gagal get data !");
    }
  }
}
