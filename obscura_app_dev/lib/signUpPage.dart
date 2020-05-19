import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:obscura/mdiPage.dart';
import '_GlobalScript.dart' as globalScript;

var tfPhone;

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  var tfName = TextEditingController();
  var tfUsername = TextEditingController();
  var tfPassword = TextEditingController();

  Future userSignUp(_phone, _name, _username, _password) async {
    var url = globalScript.api + '/user';
    var response = await http.post(url, body: {
      'phone': _phone,
      'name': _name,
      'username': _username,
      'password': _password,
    });

    setState(() {
      if (response.statusCode == 201) {
        globalScript.isLogin = true;
        globalScript.username = _username.toString();
        getUserID(_username);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return MDIPage();
        }));
      }
    });
  }

  List userData;
  Future getUserID(_username) async {
    var url = globalScript.api + '/user?id=' + _username;
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonObject = jsonDecode(response.body);
      userData = (jsonObject as Map<String, dynamic>)['data'];
      globalScript.userid = userData[0]['user_id'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sign Up'),
          backgroundColor: Color.fromARGB(255, 12, 12, 13),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                color: Colors.grey[100],
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: tfName,
                      decoration: InputDecoration(hintText: 'Name'),
                    ),
                    TextField(
                      controller: tfUsername,
                      decoration: InputDecoration(hintText: 'Username'),
                    ),
                    TextField(
                      controller: tfPassword,
                      obscureText: true,
                      decoration: InputDecoration(hintText: 'Password'),
                    ),
                    RaisedButton(
                        color: Color.fromARGB(255, 12, 12, 13),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        onPressed: () {
                          if (tfName.text != '' &&
                              tfUsername.text != '' &&
                              tfPassword.text != '') {
                            userSignUp(tfPhone, tfName.text, tfUsername.text,
                                tfPassword.text);
                          }
                        })
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
