import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:song_voter/app/modules/log_in/login_controller.dart';
import 'package:song_voter/app/modules/log_in/success_view.dart';

class GoogleLoginWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _GoogleLoginWidgetState();
}

class _GoogleLoginWidgetState extends State<GoogleLoginWidget> {
  final LoginController loginController = Get.put(LoginController());

  String? _errorMessage;

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  @override
  void initState() {
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      try {
        if (account == null) {
          throw Exception();
        }
        final googleId = account.id;
        loginController.googleLogin(googleId);
        Get.to(LoginSuccessView());
      } catch (error) {
        _showErrorMessage();
      }
    });
  }

  void _updateErrorMessage(String? newMessage) {
    setState(() {
      _errorMessage = newMessage;
    });
  }

  Future _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      _showErrorMessage();
    }
  }

  void _showErrorMessage() =>
      _updateErrorMessage("something went wrong, please try again");

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SignInButton(
        Buttons.GoogleDark,
        onPressed: _handleSignIn,
      ),
      if (_errorMessage != null)
        Text(
          _errorMessage!,
          style: Theme.of(context)
              .textTheme
              .bodyText2!
              .copyWith(color: Colors.red),
        )
      else
        Container()
    ]);
  }
}
