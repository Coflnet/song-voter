import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:song_voter/app/modules/home/home.dart';
import 'package:song_voter/app/modules/party/party.dart';
import 'package:song_voter/app/modules/settings/settings.dart';

class Navigation extends StatelessWidget {
  Navigation({required this.selectedIndex});

  final int selectedIndex;

  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: GNav(
          selectedIndex: this.selectedIndex,
          rippleColor: Colors.grey, // tab button ripple color when pressed
          hoverColor: Colors.grey.shade400, // tab button hover color
          haptic: true, // haptic feedback
          tabBorderRadius: 15,
          tabActiveBorder:
              Border.all(color: Colors.black, width: 1), // tab button border
          tabBorder:
              Border.all(color: Colors.grey, width: 1), // tab button border
          tabShadow: [
            BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8)
          ], // tab button shadow
          curve: Curves.easeOutExpo, // tab animation curves
          gap: 4, // the tab button gap between icon and text
          color: Colors.grey[800], // unselected icon color
          activeColor: Colors.purple, // selected icon and text color
          iconSize: 28, // tab button icon size
          tabBackgroundColor:
              Colors.purple.withOpacity(0.1), // selected tab background color
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          tabs: [
            GButton(
              icon: LineIcons.home,
              text: "Home",
              onPressed: () {
                Get.to(HomeView());
              },
            ),
            GButton(
              icon: LineIcons.alternatePhone,
              text: "Party",
              onPressed: () {
                Get.to(PartyView());
              },
            ),
            GButton(
              icon: LineIcons.wrench,
              text: "Settings",
              onPressed: () {
                Get.to(SettingsView());
              },
            ),
            GButton(
              icon: LineIcons.wrench,
              text: "Settings",
              onPressed: () {
                Get.to(SettingsView());
              },
            )
          ],
        ),
      ),
    );
  }
}
