import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';

class AppleLoginWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AppleLoginWidgetState();
}

class _AppleLoginWidgetState extends State<AppleLoginWidget> {
  String? _errorMessage = null;

  void _handleSignIn() {
    setState(() {
      _errorMessage = "Not implemented yet";
    });
  }

  Widget build(BuildContext context) {
    return Column(
      children: [
        SignInButton(Buttons.AppleDark, onPressed: _handleSignIn),
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
      ],
    );
  }
}
