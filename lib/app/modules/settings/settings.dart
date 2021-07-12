import 'package:flutter/material.dart';
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
        child: Text("settings"),
      ),
    );
  }
}
