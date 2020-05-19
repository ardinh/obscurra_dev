import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:obscura/customIcons/my_custom_icons1_icons.dart';
import 'package:obscura/mdiPage.dart';
import '_GlobalScript.dart' as globalScript;
import 'package:http/http.dart' as http;
import 'package:obscura/signUpPage.dart' as signUp;

bool isSignUp = true;

class SignInUpPage extends StatefulWidget {
  @override
  _SignInUpPageState createState() => _SignInUpPageState();
}

class _SignInUpPageState extends State<SignInUpPage> {
  bool isLoading = true;

  void initState() {
    super.initState();
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isLoading
          ? Center(child: CircularProgressIndicator())
          : DefaultTabController(
              length: 2,
              child: Scaffold(
                appBar: AppBar(
                  title: Center(
                      child: Text(
                    'OBSCURA',
                    style: TextStyle(color: Colors.black),
                  )),
                  backgroundColor: Colors.white,
                  elevation: 0,
                  bottom: TabBar(
                      labelPadding: EdgeInsets.all(10),
                      indicatorColor: Colors.black,
                      tabs: [
                        Text(
                          'Sign Up',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                        Text(
                          'Sign In',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ]),
                ),
                body: Container(
                  color: Colors.grey[100],
                  child: TabBarView(children: [
                    contentSignUp(),
                    contentSignIn(),
                  ]),
                ),
              )),
    );
  }

  Future _showDialog(_title, _content) {
    return showDialog(
        context: context,
        child: AlertDialog(
          title: Text(_title),
          content: Text(_content),
          actions: <Widget>[
            FlatButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ));
  }

  SingleChildScrollView contentSignIn() {
    var tfUsername = TextEditingController();
    var tfPassword = TextEditingController();

    List userData;
    Future userSignIn(_userID, _password) async {
      var url = globalScript.api + '/user?id=' + _userID;
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var jsonObject = jsonDecode(response.body);
        userData = (jsonObject as Map<String, dynamic>)['data'];

        if (_password == userData[0]['password']) {
          setState(() {
            globalScript.isLogin = true;
            globalScript.myName = userData[0]['name'];
            globalScript.myPhone = userData[0]['phone'];
            globalScript.username = userData[0]['username'];
            globalScript.userid = userData[0]['user_id'];
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return MDIPage();
            }));
          });
        } else {
          _showDialog('Oppsss...', 'Username or password not valid');
        }
      } else {
        _showDialog('Oppsss...', 'Username or password not valid');
      }
    }

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            //color: Colors.amber,
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: tfUsername,
                  decoration:
                      InputDecoration(hintText: 'Phone Number/Username'),
                  keyboardType: TextInputType.emailAddress,
                ),
                TextFormField(
                  controller: tfPassword,
                  obscureText: true,
                  decoration: InputDecoration(hintText: 'Password'),
                ),
                RaisedButton(
                  color: Color.fromARGB(255, 12, 12, 13),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  onPressed: () {
                    userSignIn(tfUsername.text, tfPassword.text);
                  },
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(16, 5, 16, 0),
            //color: Colors.red,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      height: 1,
                      width: 70,
                      color: Colors.grey,
                    ),
                    Text('Or'),
                    Container(
                      height: 1,
                      width: 70,
                      color: Colors.grey,
                    ),
                  ],
                ),
                buttonSosmed(MyCustomIcons1.google, Colors.black, Colors.white,
                    'Google', Colors.black, FontWeight.bold),
                buttonSosmed(
                    MyCustomIcons1.facebook,
                    Colors.white,
                    Colors.blue[700],
                    'Facebook',
                    Colors.white,
                    FontWeight.bold),
                buttonSosmed(
                    MyCustomIcons1.instagram,
                    Colors.white,
                    Colors.pinkAccent,
                    'Instagram',
                    Colors.white,
                    FontWeight.bold),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SingleChildScrollView contentSignUp() {
    var tfPhone = TextEditingController();

    Future cekUser(_phone) async {
      var url = globalScript.api + '/user?id=' + _phone;
      var response = await http.get(url);

      setState(() {
        if (response.statusCode == 200) {
          _showDialog('Ooppsss...',
              "Phone umber already exists, it's yours? Let's sign in.!!");
        } else {
          signUp.tfPhone = tfPhone.text;
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return signUp.SignUpPage();
          }));
        }
      });
    }

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            //color: Colors.amber,
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: tfPhone,
                  decoration: InputDecoration(hintText: 'Phone Number'),
                  keyboardType: TextInputType.phone,
                ),
                RaisedButton(
                  color: Color.fromARGB(255, 12, 12, 13),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  onPressed: () {
                    if (tfPhone.text != '') {
                      cekUser(tfPhone.text);
                    } else {
                      _showDialog(
                          'Oppsss...', 'Please set your phone number first');
                    }
                  },
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(16, 5, 16, 0),
            //color: Colors.red,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      height: 1,
                      width: 70,
                      color: Colors.grey,
                    ),
                    Text('Or'),
                    Container(
                      height: 1,
                      width: 70,
                      color: Colors.grey,
                    ),
                  ],
                ),
                buttonSosmed(MyCustomIcons1.google, Colors.black, Colors.white,
                    'Google', Colors.black, FontWeight.bold),
                buttonSosmed(
                    MyCustomIcons1.facebook,
                    Colors.white,
                    Colors.blue[700],
                    'Facebook',
                    Colors.white,
                    FontWeight.bold),
                buttonSosmed(
                    MyCustomIcons1.instagram,
                    Colors.white,
                    Colors.pinkAccent,
                    'Instagram',
                    Colors.white,
                    FontWeight.bold),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Stack buttonSosmed(IconData _ico, Color _icoColors, Color _buttonColors, _txt,
      Color _txtColors, FontWeight _fontWeight) {
    return Stack(
      children: <Widget>[
        RaisedButton(
          color: _buttonColors,
          child: Align(
              alignment: Alignment.center,
              child: Text(
                _txt,
                style: TextStyle(color: _txtColors, fontWeight: _fontWeight),
              )),
          onPressed: () {},
        ),
        Positioned(
            top: 12,
            left: 10,
            child: Icon(
              _ico,
              color: _icoColors,
            ))
      ],
    );
  }
}
