import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              //color: Colors.amber,
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.photo_camera,
                      size: 200,
                    ),
                    Center(
                        child: Text(
                      'OBSCURA by eXtrovertCoDev',
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    )),
                  ],
                ),
              ),
            ),
            Container(
              //color: Colors.blue,
              child: Column(
                children: <Widget>[
                  Text('v 1.1.1 [Beta]'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
