import 'package:get/get.dart';
import 'package:song_voter/app/data/models/settings.dart';

class SettingsController extends GetxController {
  var settings = Settings().obs;

  void _setGoogleId(String? googleId) {
    settings.update((val) {
      val!.googleId = googleId;
    });
  }

  Future login(String googleId) async {
    this._setGoogleId(googleId);
  }

  Future logout() async {
    this._setGoogleId(null);
  }
}
