import 'package:flutter/material.dart';

class ManageGalleryPage extends StatefulWidget {
  @override
  _ManageGalleryPageState createState() => _ManageGalleryPageState();
}

class _ManageGalleryPageState extends State<ManageGalleryPage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Manage my Gallery",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
          child: isLoading
              ? Center(child: CircularProgressIndicator())
              : Container()),
    );
  }
}
