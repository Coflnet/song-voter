import 'package:flutter/material.dart';
import 'package:song_voter/app/modules/log_in/apple_login.dart';
import 'package:song_voter/app/modules/log_in/google_login.dart';
import 'package:song_voter/app/modules/log_in/guest_login.dart';
import 'package:song_voter/global_widgets/base.dart';

class LoginWidget extends StatelessWidget {
  final String headline;
  final String? subHeadline;

  LoginWidget({Key? key, required this.headline, this.subHeadline})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Base(
        showNavbar: false,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.2,
                  bottom: MediaQuery.of(context).size.height * 0.2),
              child: Center(
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(headline,
                        style: Theme.of(context).textTheme.headline1),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: subHeadline != null
                        ? Text(subHeadline!,
                            style: Theme.of(context).textTheme.headline2)
                        : Container(),
                  ),
                ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: GoogleLoginWidget(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: AppleLoginWidget(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 30),
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.33,
                    child: Container(
                      child: Divider(
                        color: Colors.black,
                        thickness: 3,
                        height: 3,
                        indent: 3,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.33,
                    child: Center(
                      child: Text("or"),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.33,
                    child: Container(
                      child: Divider(
                        color: Colors.black,
                        thickness: 3,
                        height: 3,
                        indent: 3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GuestLoginWidget(
              previousTitle: headline,
            )
          ],
        ));
  }
}
