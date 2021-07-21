import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:song_voter/app/modules/home/home.dart';
import 'package:song_voter/app/modules/log_in/login_view.dart';
import 'package:song_voter/global_widgets/global_error.dart';
import 'package:get/instance_manager.dart' as instance_manager;

import 'app/data/controllers/user_controller.dart';
import 'app/data/services/user_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  bool _flutterInitialized = false;
  bool _flutterInitializeError = false;

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_flutterInitializeError) {
      return const MaterialApp(
        home: GlobalErrorWidget(
          headline: "Error",
          subHeadline: "initializing flutter",
        ),
      );
    }

    if (!_flutterInitialized) {
      return const MaterialApp(
        home: GlobalErrorWidget(
          headline: "Loading",
          subHeadline: "loading firebase",
        ),
      );
    }

    Widget? homeWidget;
    final UserController _userController =
        instance_manager.Get.put(UserController());

    if (_userController.user.value != null) {
      homeWidget = HomeWidget();
    } else {
      homeWidget = LoginWidget(
        headline: "Song Voter",
      );
    }

    return GetMaterialApp(
      title: 'Song Voter',
      theme: lightTheme(),
      home: homeWidget,
    );
  }

  Future loadUser() async {
    await UserService.instance.loadUser();
  }

  // Define an async function to initialize FlutterFire
  Future initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      loadUser();
      setState(() => _flutterInitialized = true);
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() => _flutterInitializeError = true);
    }
  }

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
        headline2: const TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
        ),
        headline4: const TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
        headline5: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
        headline6: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
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
}
