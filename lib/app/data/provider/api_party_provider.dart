import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:song_voter/app/data/models/party.dart';

import 'api_base.dart';

class ApiPartyProvider extends ApiBase {
  static final ApiPartyProvider instance = ApiPartyProvider._init();

  ApiPartyProvider._init();

  Future<http.Response> readAllParties() async {
    return http.get(
      Uri.parse(
        "$BASE_URL/v1/partys",
      ),
    );
  }

  Future<http.Response> createParty(Party party) async {
    return http.post(
      Uri.parse(
        "$BASE_URL/v1/auth/google",
      ),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, String>{},
      ),
    );
  }
}
