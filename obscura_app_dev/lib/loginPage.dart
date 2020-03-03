import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //-- untuk mengambil text
  TextEditingController user = new TextEditingController();
  TextEditingController pass = new TextEditingController();
  String msg = '';

  Future<List> _login() async {
    final response = await http.post(
        'http://192.168.5.178:8080/trisco_hrms/login.php',
        body: {'username': user.text, 'password': pass.text});
    //print(response.body);

    var getData = json.decode(response.body);

    if (getData.length == 0) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Notification'),
            content: Text('Wrong username or password.'),
            actions: <Widget>[
              FlatButton(
                  child: Text('Close'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  })
            ],
          );
        },
      );
    } else {
      if (getData[0]['active'] == '0') {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Notification'),
              content: Text('User not active. Please contact EDP Team.'),
              actions: <Widget>[
                FlatButton(
                    child: Text('Close'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    })
              ],
            );
          },
        );
      } else {
        Navigator.pushReplacementNamed(context, '/mdiPage');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Align(
      alignment: Alignment.bottomCenter,
      child: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 80),
            width: 150,
            height: 150,
            child: Image(
              image: AssetImage('images/School-role.png'),
              fit: BoxFit.contain,
            ),
          ),
          Align(
              alignment: Alignment.center,
              child: Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text(
                    'HRM System Apps',
                    style: TextStyle(fontSize: 25),
                  ))),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5)),
            margin: EdgeInsets.fromLTRB(20, 20, 20, 5),
            padding: EdgeInsets.fromLTRB(10, 0, 10, 25),
            child: Column(
              children: <Widget>[
                TextField(
                  controller: user,
                  decoration: InputDecoration(
                      icon: Icon(Icons.account_box),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue)),
                      labelText: 'Username'),
                ),
                TextField(
                  controller: pass,
                  obscureText: true,
                  decoration: InputDecoration(
                      icon: Icon(Icons.vpn_key),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue)),
                      labelText: 'Password'),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Text('Forgot Password?',
                    style: TextStyle(color: Colors.blue)),
              ),
              Container(
                margin: EdgeInsets.only(right: 20),
                child: RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text('Login'),
                  onPressed: () {
                    _login();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
