import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:song_voter/app/modules/settings/SettingsController.dart';
import 'package:song_voter/global_widgets/base.dart';

class SettingsView extends StatelessWidget {
  final SettingsController settingsController = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return Base(
      showNavbar: true,
      navbarIndex: 2,
      child: Center(
          child: Column(
        children: [
          Text("This is the settings page"),
          GetX<SettingsController>(
              builder: (_) => _.settings.value.googleId == null
                  ? Text("You are not logged in")
                  : Text("your id is ${_.settings.value.googleId}")),

          // TODO implement google sign in button

          TextButton(
              onPressed: () => {settingsController.login("12345")},
              child: Text("mock Login")),
          TextButton(
              onPressed: () => {settingsController.logout()},
              child: Text("Logout")),
        ],
      )),
    );
  }
}
