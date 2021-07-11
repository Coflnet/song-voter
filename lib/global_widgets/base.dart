import 'package:flutter/material.dart';
import 'package:song_voter/global_widgets/navigation.dart';

class Base extends StatelessWidget {
  Base({required this.child, required this.showNavbar, this.navbarIndex});

  final Widget child;

  final bool showNavbar;

  final int? navbarIndex;

  Widget? getBottomNavigationBar() {
    if (!this.showNavbar) {
      return null;
    }

    if (this.navbarIndex == null) {
      throw Exception("when showNavbar is true navbarIndex must be given");
    }

    return Navigation(selectedIndex: this.navbarIndex!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Song Voter"),
        ),
        body: child,
        bottomNavigationBar: getBottomNavigationBar());
  }
}
