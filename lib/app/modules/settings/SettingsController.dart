import 'package:get/get.dart';
import 'package:song_voter/app/data/models/settings.dart';

class SettingsController extends GetxController {
  var settings = Settings().obs;

  void _setGoogleId(String? googleId) {
    settings.update((val) {
      val!.googleId = googleId;
    });
  }

  void login(String googleId) {
    this._setGoogleId(googleId);
  }

  void logout() {
    this._setGoogleId(null);
  }
}
