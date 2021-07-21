import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:get/get.dart';
import 'package:song_voter/app/data/services/user_service.dart';
import 'package:song_voter/app/modules/log_in/success_view.dart';

class GoogleLoginWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _GoogleLoginWidgetState();
}

class _GoogleLoginWidgetState extends State<GoogleLoginWidget> {
  final UserService _userService = UserService.instance;

  String? _errorMessage;

  void _updateErrorMessage(String? newMessage) {
    setState(() {
      _errorMessage = newMessage;
    });
  }

  Future _handleSignIn() async {
    try {
      await _userService.signInWithGoogle();

      Get.to(LoginSuccessView());
    } catch (error) {
      debugPrint(error.toString());
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
