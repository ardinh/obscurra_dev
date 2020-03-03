import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:obscura/mdiPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.black,
    ));

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Segoe UI'),
        home: MDIPage(),
        routes: <String, WidgetBuilder>{
          '/mdiPage': (BuildContext context) => MDIPage(),
        });
  }
}
