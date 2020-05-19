import 'package:flutter/material.dart';
import 'package:obscura/_GlobalScript.dart' as globalScript;

class SetMyProfilPage extends StatefulWidget {
  @override
  _SetMyProfilPageState createState() => _SetMyProfilPageState();
}

var settingSelected;

class _SetMyProfilPageState extends State<SetMyProfilPage> {
  var tfMyName = TextEditingController(text: globalScript.myName);
  var tfMyBio = TextEditingController(text: globalScript.myBio);
  var tfMyPhone = TextEditingController(text: globalScript.myPhone);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          settingSelected,
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
                (settingSelected == 'Name')
                    ? globalScript.myName = tfMyName.text
                    : (settingSelected == 'Bio')
                        ? globalScript.myBio = tfMyBio.text
                        : (settingSelected == 'Gender')
                            ? 0
                            : (settingSelected == 'Date of Birth')
                                ? 0
                                : (settingSelected == 'Phone')
                                    ? globalScript.myPhone = tfMyPhone.text
                                    : 0;
                Navigator.pop(context);
              }),
        ],
      ),
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: (settingSelected == 'Name')
            ? contentMyName()
            : (settingSelected == 'Bio')
                ? contentMyBio()
                : (settingSelected == 'Gender')
                    ? 0
                    : (settingSelected == 'Date of Birth')
                        ? 0
                        : (settingSelected == 'Phone') ? contentMyPhone() : 0,
      )),
    );
  }

  TextFormField contentMyName() {
    return TextFormField(
      controller: tfMyName,
      decoration: InputDecoration(hintText: settingSelected),
    );
  }

  TextFormField contentMyBio() {
    return TextFormField(
      controller: tfMyBio,
      decoration: InputDecoration(hintText: settingSelected),
    );
  }

  TextFormField contentMyPhone() {
    return TextFormField(
      controller: tfMyPhone,
      decoration: InputDecoration(hintText: settingSelected),
      keyboardType: TextInputType.phone,
    );
  }
}
