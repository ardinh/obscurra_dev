import 'package:flutter/material.dart';
import 'setMyProfilPage.dart' as setMyProfilPage;
import 'package:obscura/_GlobalScript.dart' as globalScript;

class MyProfilPage extends StatefulWidget {
  @override
  _MyProfilPageState createState() => _MyProfilPageState();
}

class _MyProfilPageState extends State<MyProfilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'My Profil',
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
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.check),
              onPressed: () {
                print('Save Change');
              }),
        ],
      ),
      body: SafeArea(
        child: Container(
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
                        child: GestureDetector(
                          child: CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.white,
                            child: Icon(Icons.person,
                                size: 50,
                                color: Color.fromARGB(255, 12, 12, 13)),
                          ),
                          onTap: () {
                            print('Circularnya');
                          },
                        ),
                      ),
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

              contentButton(context, 'Name', globalScript.myName),
              Divider(
                height: 1,
              ),
              ButtonTheme(
                height: 50,
                child: FlatButton(
                    color: Colors.white,
                    onPressed: () {},
                    child: Row(
                      children: <Widget>[
                        Container(
                          //color: Colors.amber,
                          child: Row(
                            children: <Widget>[Text('Username')],
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
                                      (globalScript.username == null)
                                          ? ''
                                          : globalScript.username,
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey[500]),
                                    ),
                                  ),
                                ],
                              ),
                            ))
                      ],
                    )),
              ),
              Divider(
                height: 1,
              ),
              contentButton(context, 'Bio', globalScript.myBio),
              Divider(
                height: 1,
              ),
              contentButton(context, 'Gender', globalScript.myGender),
              Divider(
                height: 1,
              ),
              contentButton(context, 'Date of Birth', globalScript.myDOB),
              Divider(
                height: 1,
              ),
              contentButton(context, 'Phone', globalScript.myPhone),
              Divider(
                height: 1,
              ),
              contentButton(context, 'My Social Media', ''),
            ],
          ),
        ),
      ),
    );
  }

  ButtonTheme contentButton(BuildContext context, _txt, _txtData) {
    return ButtonTheme(
      height: 50,
      child: FlatButton(
          color: Colors.white,
          onPressed: () {
            setMyProfilPage.settingSelected = '';
            setMyProfilPage.settingSelected = _txt;
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return setMyProfilPage.SetMyProfilPage();
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
                            (_txtData == null) ? '' : _txtData,
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
