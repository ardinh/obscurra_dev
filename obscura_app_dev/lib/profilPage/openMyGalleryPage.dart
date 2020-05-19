import 'package:flutter/material.dart';
import 'package:obscura/profilPage/openGalleryPage.dart';

class OpenMyGalleryPage extends StatefulWidget {
  @override
  _OpenMyGalleryPageState createState() => _OpenMyGalleryPageState();
}

class _OpenMyGalleryPageState extends State<OpenMyGalleryPage> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(
          "Open my Gallery",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
          child: isLoading
              ? Center(child: CircularProgressIndicator())
              : Container(
                  child: Center(
                    child: RaisedButton(
                        color: Colors.black,
                        child: Text(
                          'Open Gallery',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return OpenGalleryPage();
                          }));
                        }),
                  ),
                )),
    );
  }
}
