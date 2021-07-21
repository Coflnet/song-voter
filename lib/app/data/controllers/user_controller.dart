import 'package:get/get.dart';
import 'package:song_voter/app/data/models/user.dart';

class UserController extends GetxController {
  Rx<User?> user = null.obs;

  login(User newUser) => user.value = newUser;

  logout() => user.value = null;
}
