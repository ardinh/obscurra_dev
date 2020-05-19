import 'package:flutter/material.dart';

class MyLocationPage extends StatefulWidget {
  @override
  _MyLocationPageState createState() => _MyLocationPageState();
}

class _MyLocationPageState extends State<MyLocationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'My Location',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: SafeArea(
          child: Container(
        child: Stack(
          children: <Widget>[
            ListView(
              padding: EdgeInsets.only(bottom: 80),
              children: <Widget>[],
            ),
            Align(
                alignment: Alignment.bottomRight,
                child: Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 15, 15),
                    child: FloatingActionButton(
                        backgroundColor: Colors.black,
                        child: Icon(Icons.add),
                        elevation: 0,
                        onPressed: () {})))
          ],
        ),
      )),
    );
  }

  GestureDetector contentLocation() {
    return GestureDetector(
      child: Container(
        color: Colors.white,
        height: 100,
        margin: EdgeInsets.only(top: 8),
        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: Row(
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(right: 15),
                child: Icon(
                  Icons.location_on,
                  size: 30,
                )),
            Expanded(
              flex: 1,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Choose Location',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Set location',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(fontSize: 12, color: Colors.grey[500]),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Icon(Icons.keyboard_arrow_right),
                ],
              ),
            )
          ],
        ),
      ),
      onTap: () {
        print('Show map');
      },
    );
  }
}
