import 'package:get/get.dart';

class LoginController extends GetxController {
  Rx<String?> googleId = null.obs;

  Rx<String?> appleId = null.obs;

  Rx<String?> guestId = null.obs;

  Future googleLogin(String googleId) async {}

  Future appleLogin(String appleId) async {}

  Future guestLogin() async {}

  Future logout() async {}
}
