import 'package:flutter/material.dart';
import 'package:obscura/profilPage/accountSettingsPage/setMyProfilPage.dart';
import 'setGalleryPage.dart' as setGallery;
import 'package:obscura/_GlobalScript.dart' as globalScript;

class OpenGalleryPage extends StatefulWidget {
  @override
  _OpenGalleryPageState createState() => _OpenGalleryPageState();
}

class _OpenGalleryPageState extends State<OpenGalleryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Open Gallery',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
      ),
      body: SafeArea(
          child: Container(
        color: Colors.grey[100],
        child: ListView(
          children: <Widget>[
            //-- AppBar
            GestureDetector(
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 180,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                          Color.fromARGB(255, 12, 12, 13),
                          Color.fromARGB(255, 69, 69, 71)
                        ])),
                    child: Center(
                        child: Icon(
                      Icons.image,
                      color: Colors.white,
                      size: 100,
                    )),
                  ),
                  Positioned(
                    left: 0,
                    bottom: 0,
                    right: 0,
                    child: Opacity(
                      opacity: 0.80,
                      child: Container(
                        color: Colors.white,
                        height: 20,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Tap here',
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              onTap: () {
                print('Containernya');
              },
            ),
            //-- AppBar

            contentButton(context, 'Gallery Name', globalScript.galleryName),
            Divider(
              height: 1,
            ),
            contentButton(context, 'Phone', globalScript.galleryPhone),
            Divider(
              height: 1,
            ),
            contentButton(context, 'Province', globalScript.galleryProvince),
            Divider(
              height: 1,
            ),
            contentButton(context, 'City', globalScript.galleryCity),
            Divider(
              height: 1,
            ),
            contentButton(context, 'Kecamatan', globalScript.galleryKecamatan),
            Divider(
              height: 1,
            ),
            contentButton(context, 'Post Code', globalScript.galleryPostCode),
            Container(
              height: 200,
              margin: EdgeInsets.only(top: 8),
              padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Description',
                      style: TextStyle(fontWeight: FontWeight.w600)),
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Desc Your Gallery'),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 8),
              padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Address',
                      style: TextStyle(fontWeight: FontWeight.w600)),
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Your Address'),
                  )
                ],
              ),
            ),
            GestureDetector(
              child: Container(
                color: Colors.white,
                height: 70,
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
                              style: TextStyle(
                                  fontSize: 12, color: Colors.grey[500]),
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
            ),
            Container(
              margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                color: Colors.black,
                child: Center(
                  child: Text(
                    'Save',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      )),
    );
  }

  ButtonTheme contentButton(BuildContext context, _txt, _txtData) {
    return ButtonTheme(
      height: 50,
      child: FlatButton(
          color: Colors.white,
          onPressed: () {
            setGallery.settingSelected = '';
            setGallery.settingSelected = _txt;

            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return setGallery.SetGalleryPage();
            }));
          },
          child: Row(
            children: <Widget>[
              Container(
                //color: Colors.amber,
                child: Row(
                  children: <Widget>[Text(_txt)],
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                    //color: Colors.blue,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          //color: Colors.amber,
                          child: Text(
                            (_txtData == null) ? 'Set ' + _txt : _txtData,
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey[500]),
                          ),
                        ),
                        Container(child: Icon(Icons.keyboard_arrow_right)),
                      ],
                    ),
                  ))
            ],
          )),
    );
  }
}
