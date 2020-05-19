import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:obscura/customIcons/my_custom_icons1_icons.dart';
import 'package:obscura/favoritePage.dart';
import 'package:obscura/profilPage/aboutPage.dart';
import 'package:obscura/profilPage/accountSettingsPage.dart';
import 'package:obscura/profilPage/manageGalleryPage.dart';
import 'package:obscura/profilPage/openMyGalleryPage.dart';
import 'package:obscura/signInUpPage.dart';
import '_GlobalScript.dart' as globalScript;
import 'package:http/http.dart' as http;

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isLoading = false;

  List userData;
  Future userSignIn(_userID) async {
    isLoading = true;

    if (_userID == null) {
      globalScript.isLogin = false;
      globalScript.userid = null;
    } else {
      var url = globalScript.api + '/user?id=' + _userID;
      var response = await http.get(url);

      if (response.statusCode == 200) {
        setState(() {
          var jsonObject = jsonDecode(response.body);
          userData = (jsonObject as Map<String, dynamic>)['data'];
          globalScript.isLogin = true;
          globalScript.userid = userData[0]['user_id'];
        });
      } else {
        globalScript.isLogin = false;
        globalScript.userid = null;
      }
    }
    isLoading = false;
  }

  bool haveBusiness = false;
  Future getBusiness(_userID) async {
    var url = globalScript.api + '/business?id=' + _userID;
    var response = await http.get(url);

    if (response.statusCode == 200) {
      setState(() {
        haveBusiness = true;
      });
    } else {
      haveBusiness = false;
    }
  }

  void refreshData() {
    userSignIn(globalScript.username);
    getBusiness(globalScript.userid);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    refreshData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : Container(
                child: ListView(
                  children: <Widget>[
                    //-- AppBar
                    Container(
                      margin: EdgeInsets.only(bottom: 8),
                      height: 180,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                            Color.fromARGB(255, 12, 12, 13),
                            Color.fromARGB(255, 69, 69, 71)
                          ])),
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: Align(
                              alignment: Alignment.center,
                              child: GestureDetector(
                                child: CircleAvatar(
                                  radius: 45,
                                  backgroundColor: Colors.white,
                                  child: Icon(Icons.person,
                                      size: 50,
                                      color: Color.fromARGB(255, 12, 12, 13)),
                                ),
                                onTap: () {
                                  //print(userData[0]['name']);
                                },
                              ),
                            ),
                          ),
                          Expanded(
                              flex: 1,
                              child: Align(
                                alignment: Alignment.center,
                                child: globalScript.isLogin
                                    ? contentLogged()
                                    : buttonSignInUp(context),
                              ))
                        ],
                      ),
                    ),
                    //-- AppBar

                    //-- Button
                    Container(
                        margin: EdgeInsets.only(bottom: 8),
                        child: Column(
                          children: <Widget>[
                            // contentButton(context, null, MyCustomIcons1.money,
                            //     Colors.green[700], '  Obscura Payment'),
                            // Divider(
                            //   height: 1,
                            // ),
                            contentButton(
                                context,
                                FavoritePage(),
                                Icons.favorite_border,
                                Colors.orange[700],
                                '  My Favorite'),
                            Divider(
                              height: 1,
                            ),
                            contentButton(context, null, Icons.mail_outline,
                                Colors.blue[700], '  Invite Friend'),
                            Divider(
                              height: 1,
                            ),
                            contentButton(context, null, Icons.share,
                                Colors.cyan[700], '  Share Your Account'),
                            Divider(
                              height: 1,
                            ),
                            contentButton(context, null, Icons.av_timer,
                                Colors.green[700], '  Last Seen'),
                            Divider(
                              height: 1,
                            ),
                            // contentButton(context, null, MyCustomIcons1.ticket,
                            //     Colors.orange[700], '  My Voucher'),
                            // Divider(
                            //   height: 1,
                            // ),
                            contentButton(context, null, Icons.star_border,
                                Colors.blue[700], '  Rate Us'),
                          ],
                        )),

                    Container(
                        margin: EdgeInsets.only(bottom: 8),
                        child: Column(
                          children: <Widget>[
                            contentButton(
                                context,
                                AccountSettingsPage(),
                                Icons.person_outline,
                                Colors.cyan[700],
                                '  Account Settings'),
                            Divider(
                              height: 1,
                            ),
                            contentButton(context, null, Icons.help_outline,
                                Colors.green[700], '  Help'),
                            // Divider(
                            //   height: 1,
                            // ),
                            // contentButton(context, null, Icons.call, Colors.orange[900],
                            //     '  Chat with Obscura'),
                          ],
                        )),

                    Container(
                        margin: EdgeInsets.only(bottom: 8),
                        child: Column(
                          children: <Widget>[
                            haveBusiness
                                ? contentButton(
                                    context,
                                    ManageGalleryPage(),
                                    MyCustomIcons1.store,
                                    Colors.blue[700],
                                    '  Manage Gallery')
                                : contentButton(
                                    context,
                                    OpenMyGalleryPage(),
                                    MyCustomIcons1.store,
                                    Colors.blue[700],
                                    '  Open Gallery'),
                            Divider(
                              height: 1,
                            ),
                            contentButton(
                                context,
                                AboutPage(),
                                Icons.info_outline,
                                Colors.cyan[700],
                                '  About'),
                          ],
                        )),
                    //-- Button
                  ],
                ),
              ),
      ),
    ));
  }

  Container contentLogged() {
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            userData[0]['name'],
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          RichText(
              text:
                  TextSpan(style: TextStyle(fontSize: 14), children: <TextSpan>[
            TextSpan(text: '( @'),
            TextSpan(text: userData[0]['username']),
            TextSpan(text: ' )'),
          ])),
          RichText(
            text: TextSpan(style: TextStyle(fontSize: 12), children: <TextSpan>[
              TextSpan(text: 'Followed '),
              TextSpan(text: '20 '),
              TextSpan(text: ' | '),
              TextSpan(text: 'Following '),
              TextSpan(text: '100 '),
            ]),
          )
        ],
      ),
    );
  }

  Row buttonSignInUp(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        FlatButton(
          color: Colors.white,
          child: Text(
            'Sign Up',
            style: TextStyle(color: Color.fromARGB(255, 69, 69, 71)),
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return SignInUpPage();
            }));
          },
        ),
        OutlineButton(
          borderSide: BorderSide(color: Colors.white),
          child: Text(
            'Log In',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return SignInUpPage();
            }));
          },
        ),
      ],
    );
  }

  ButtonTheme contentButton(
      BuildContext context, _page, IconData _ico, Color _colorIco, _txt) {
    return ButtonTheme(
      height: 50,
      child: FlatButton(
          color: Colors.white,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              if (globalScript.isLogin == true) {
                return _page;
              } else {
                return SignInUpPage();
              }
            }));
          },
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  //color: Colors.amber,
                  child: Row(
                    children: <Widget>[
                      Icon(
                        _ico,
                        color: _colorIco,
                      ),
                      Text(_txt)
                    ],
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
