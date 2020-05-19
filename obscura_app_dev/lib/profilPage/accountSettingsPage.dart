import 'package:flutter/material.dart';
import 'package:obscura/profilPage/accountSettingsPage/myProfilPage.dart';
import 'package:obscura/_GlobalScript.dart' as globalScript;

import 'accountSettingsPage/myLocationPage.dart';

class AccountSettingsPage extends StatefulWidget {
  @override
  _AccountSettingsPageState createState() => _AccountSettingsPageState();
}

class _AccountSettingsPageState extends State<AccountSettingsPage> {
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
        title: Text('Obscura', style: TextStyle(color: Colors.black)),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {}),
          IconButton(icon: Icon(Icons.message), onPressed: () {}),
        ],
      ),
      body: Center(
        child: Container(
          color: Colors.grey[100],
          child: ListView(
            children: <Widget>[
              // My Account
              Container(
                margin: EdgeInsets.fromLTRB(15, 10, 0, 8),
                child: Text(
                  'My Account',
                  style: TextStyle(fontSize: 12),
                ),
              ),
              contentButton(context, MyProfilPage(), 'My Profil'),
              Divider(
                height: 1,
              ),
              contentButton(context, MyLocationPage(), 'My Location'),
              Divider(
                height: 1,
              ),
              contentButton(context, null, 'Card / Bank Rekening'),

              // Settings
              Container(
                margin: EdgeInsets.fromLTRB(15, 10, 0, 8),
                child: Text(
                  'Settings',
                  style: TextStyle(fontSize: 12),
                ),
              ),
              contentButton(context, null, 'Chat'),
              Divider(
                height: 1,
              ),
              contentButton(context, null, 'Notification'),
              Divider(
                height: 1,
              ),
              contentButton(context, null, 'Private'),
              Divider(
                height: 1,
              ),
              contentButton(context, null, 'Blocked Users'),
              Divider(
                height: 1,
              ),
              contentButton(context, null, 'Language'),

              // Help
              Container(
                margin: EdgeInsets.fromLTRB(15, 10, 0, 8),
                child: Text(
                  'Help',
                  style: TextStyle(fontSize: 12),
                ),
              ),
              contentButton(context, null, 'Call Center'),
              Divider(
                height: 1,
              ),
              contentButton(context, null, 'Tips and Trick'),
              Divider(
                height: 1,
              ),
              contentButton(context, null, 'Community Settings'),
              Divider(
                height: 1,
              ),
              contentButton(context, null, 'Obscura Rules'),
              Divider(
                height: 1,
              ),
              contentButton(context, null, 'Like Obscura? Rate Us! :)'),
              Divider(
                height: 1,
              ),
              contentButton(context, null, 'Information'),
              Divider(
                height: 1,
              ),
              contentButton(context, null, 'Delete My Account'),

              Container(
                //color: Colors.amber,
                margin: EdgeInsets.fromLTRB(15, 10, 15, 0),
                child: Column(
                  children: <Widget>[
                    FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      color: Colors.black,
                      child: Center(
                        child: Text(
                          'LOGOUT',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          globalScript.isLogin = false;
                          globalScript.username = '';
                          Navigator.pop(context);
                        });
                      },
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15, bottom: 20),
                      child: Text('Obscura v 1.1.1 [Beta]',
                          style: TextStyle(fontSize: 12)),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  ButtonTheme contentButton(BuildContext context, _page, _txt) {
    return ButtonTheme(
      height: 50,
      child: FlatButton(
          color: Colors.white,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return _page;
            }));
          },
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  //color: Colors.amber,
                  child: Row(
                    children: <Widget>[Text(_txt)],
                  ),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      //color: Colors.blue,
                      child: Icon(Icons.keyboard_arrow_right),
                    ),
                  ))
            ],
          )),
    );
  }
}
