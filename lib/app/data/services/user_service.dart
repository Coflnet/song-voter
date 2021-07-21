import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/instance_manager.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:song_voter/app/data/controllers/user_controller.dart';
import 'package:song_voter/app/data/db/user_database.dart';
import 'package:song_voter/app/data/provider/api_user_provider.dart';
import 'package:song_voter/app/data/models/user.dart' as song_voter_user;

import 'base_service.dart';

class UserService extends BaseService {
  static UserService instance = UserService._init();

  final UserDatabase _db = UserDatabase.instance;

  final ApiUserProvider _apiProvider = ApiUserProvider.instance;

  final FirebaseAuth auth = FirebaseAuth.instance;

  final UserController _userController = Get.put(UserController());

  UserService._init();

  Future<song_voter_user.User?> loadUser() async {
    final users = await _db.readAllUsers();

    if (users.isEmpty) {
      return null;
    }

    final user = users[0];

    _userController.login(user);

    return user;
  }

  Future<song_voter_user.User> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if (googleUser == null) {
      throw Exception("google user is null");
    }

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final idToken = googleAuth.idToken;

    if (idToken == null) {
      throw Exception("no id token is given");
    }

    final response = await _apiProvider.loginWithGoogle(idToken);

    if (!isResponseSuccessfull(response.statusCode)) {
      throw Exception("error passing id_token");
    }

    final user = song_voter_user.User(
      username: googleUser.email,
      googleId: googleUser.id,
    );

    await _db.create(user);

    _userController.login(user);

    return user;
  }

  Future<User?> appleLogin(String appleId) async {}
  Future<User?> guestLogin(String guestId) async {}
  Future logout() async {
    final user = _userController.user.value;

    if (user == null) {
      throw Exception("user is not logged in");
    }

    if (user.id == null) {
      throw Exception(
          "user has no id, there was a problem logging in the user");
    }

    _db.delete(user.id!);
    _userController.logout();
  }
}
