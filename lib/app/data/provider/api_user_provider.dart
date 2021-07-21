import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:song_voter/app/data/provider/api_base.dart';

class ApiUserProvider extends ApiBase {
  static final ApiUserProvider instance = ApiUserProvider._init();

  ApiUserProvider._init();

  Future<http.Response> loginWithGoogle(String idToken) async {
    return http.post(
      Uri.parse(
        "$BASE_URL/v1/auth/google",
      ),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, String>{
          'token': idToken,
        },
      ),
    );
  }

  Future loginWithApple() async {}
}
