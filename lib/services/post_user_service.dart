import 'dart:convert';

import 'package:flutter_consume_api/models/user_regist_model.dart';
import 'package:http/http.dart' as http;

class PostUserService {
  Future<String> signUp({
    required String name,
    required String job,
  }) async {
    var url = 'https://reqres.in/api/users';
    var header = {
      'Accept': 'application/json',
    };
    var body = {
      'name': name,
      'job': job,
    };

    var response = await http.post(
      Uri.parse(url),
      headers: header,
      body: body,
    );

    if (response.statusCode == 201) {
      var data = jsonDecode(response.body);

      return "Berhasil Regist";
    } else {
      // print('status code adalah '+ response.statusCode.toString());
      throw Exception('Gagal Regist');
    }
  }
}
