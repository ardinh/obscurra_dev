import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:obscura/mdiPage.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(
    //     SystemUiOverlayStyle(systemNavigationBarIconBrightness: Brightness.dark));
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return SplashScreen(
      seconds: 3,
      backgroundColor: Colors.black,
      loaderColor: Colors.white,
      loadingText: Text(
        'Please wait...',
        style: TextStyle(color: Colors.white),
      ),
      navigateAfterSeconds: MDIPage(),
    );
  }
}
