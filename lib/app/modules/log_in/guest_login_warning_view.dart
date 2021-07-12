import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:song_voter/app/modules/log_in/login_view.dart';
import 'package:song_voter/app/modules/log_in/success_view.dart';
import 'package:song_voter/global_widgets/base.dart';

class GuestLoginWarningWidget extends StatelessWidget {
  void _handleContinue() {
    Get.to(LoginSuccessView());
  }

  void _handleBack() {
    Get.to(LoginView());
  }

  @override
  Widget build(BuildContext context) {
    return Base(
      showNavbar: false,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(
              MediaQuery.of(context).size.width * 0.05,
            ).add(
              EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.1,
              ),
            ),
            child: Center(
              child: Icon(
                Icons.warning_amber_outlined,
                size: MediaQuery.of(context).size.height * 0.33,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.025,
              bottom: MediaQuery.of(context).size.height * 0.025,
            ),
            child: Text(
              "Are you sure?",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Text(
            "You won't be able to use all features",
            style: Theme.of(context).textTheme.bodyText2,
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.1,
            ),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width * 0.6,
              child: TextButton(
                onPressed: _handleContinue,
                child: Text(
                  "Yes, I am",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.025,
            ),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width * 0.6,
              child: TextButton(
                onPressed: _handleBack,
                child: Text(
                  "No, take me back please",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
