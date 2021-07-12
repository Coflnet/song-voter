import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:song_voter/app/modules/log_in/login_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  ThemeData darkTheme() {
    return ThemeData(
      primarySwatch: Colors.blue,
      backgroundColor: const Color.fromARGB(255, 0, 0, 21),
      textTheme: GoogleFonts.interTextTheme().copyWith(
        headline1: const TextStyle(
          fontSize: 60,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 0x72, 0x73, 0x94),
        ),
        bodyText1: const TextStyle(
          fontSize: 16,
          color: Color.fromARGB(0xff, 0x72, 0x73, 0x94),
        ),
        bodyText2: const TextStyle(
          fontSize: 20,
          color: Color.fromARGB(0xff, 0x72, 0x73, 0x94),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          backgroundColor: Colors.deepOrangeAccent,
        ),
      ),
    );
  }

  ThemeData lightTheme() {
    return ThemeData(
      backgroundColor: Colors.white,
      textTheme: GoogleFonts.interTextTheme().copyWith(
        headline1: const TextStyle(
          fontSize: 60,
          fontWeight: FontWeight.bold,
        ),
        headline6: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        bodyText1: const TextStyle(
          fontSize: 16,
        ),
        bodyText2: const TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Song Voter',
      theme: lightTheme(),
      home: LoginView(),
    );
  }
}
