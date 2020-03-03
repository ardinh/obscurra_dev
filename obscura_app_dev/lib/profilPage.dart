import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: <Widget>[
        //-- Header
        Stack(
          children: <Widget>[
            Container(
              height: 300,
              //decoration: BoxDecoration(color: Colors.blue),
            ),
            Positioned(
              top: 60,
              left: 75,
              child: Column(
                children: <Widget>[
                  Center(
                    child: CircleAvatar(
                      radius: 60,
                      child: Icon(
                        Icons.person,
                        size: 60,
                      ),
                    ),
                  ),
                  Container(
                    height: 20,
                  ),
                  Text(
                    "Dika Desandra Ardiansyah",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: 6,
                  ),
                  Text(
                    "dika.naxbakrie33@gmail.com",
                    style: TextStyle(fontSize: 14),
                  ),
                  Container(
                    height: 6,
                  ),
                  Text(
                    "+628116346884",
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            )
          ],
        ),
        //-- Header

        Divider(color: Colors.grey),
        listMenu("Koin Obscura", "0", 13, FontWeight.normal),
        Divider(color: Colors.grey),
        listMenu("Voucher Saya", "", 13, FontWeight.normal),
        Divider(color: Colors.grey),
        listMenu("Ganti Password", "********", 13, FontWeight.normal),
        Divider(color: Colors.grey),
        listMenu("Telepon", "+628116346884", 13, FontWeight.normal),
        Divider(color: Colors.grey),
        listMenu("Undang Teman", "", 13, FontWeight.normal),
        Divider(color: Colors.grey),
        listMenu("Penilaian Saya", "", 13, FontWeight.normal),
        Divider(color: Colors.grey),
        listMenu("Pusat Bantuan", "", 13, FontWeight.normal),
        Divider(color: Colors.grey),
        listMenu("Keluar", "", 13, FontWeight.normal),
        Divider(color: Colors.grey),
      ],
    ));
  }

  GestureDetector listMenu(String _text, String _value, double _valueFontSize,
      FontWeight _valueFontWeight) {
    return GestureDetector(
      onTap: () {},
      child: Container(
          height: 30,
          padding: EdgeInsets.only(left: 15, right: 15),
          //decoration: BoxDecoration(color: Colors.amber),
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  _text,
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Positioned(
                  top: 7,
                  right: 40,
                  child: Text(_value,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: _valueFontSize,
                          fontWeight: _valueFontWeight))),
              Align(
                  alignment: Alignment.centerRight,
                  child: Icon(Icons.arrow_forward_ios)),
            ],
          )),
    );
  }
}
