import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // Import Firebase Core
import 'package:stbproject/screens/MapPage.dart';
import 'package:stbproject/screens/TestPoly/MapScreen.dart';
import 'package:stbproject/screens/TestPoly/TestPoly.dart';
import 'package:stbproject/screens/splash-screen.dart';

import 'screens/login.dart'; // Import your main widget

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp();

  // Run the app
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RapidBankBooking',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: MapPage()/*MapScreen(lat: 36.819837,long: 10.181969)*/
      /*  double _originLatitude = 6.5212402, _originLongitude = 3.3679965;

      FutureBuilder(
        future: Future.delayed(Duration(seconds: 2)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Login();
          } else {
            return SplashScreen(
              onInitializationComplete: () {},
            );
          }
        },
      ),*/
    );
  }
}
