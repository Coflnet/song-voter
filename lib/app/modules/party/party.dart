import 'package:flutter/material.dart';
import 'package:song_voter/global_widgets/base.dart';

class PartyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Base(
        showNavbar: true,
        navbarIndex: 1,
        child: Center(
          child: Text("This is the party screen"),
        ));
  }
}
