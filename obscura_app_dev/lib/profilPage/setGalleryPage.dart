import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:obscura/_GlobalScript.dart' as globalScript;
import 'package:http/http.dart' as http;

class SetGalleryPage extends StatefulWidget {
  @override
  _SetGalleryPageState createState() => _SetGalleryPageState();
}

var settingSelected;

class _SetGalleryPageState extends State<SetGalleryPage> {
  bool isLoading = false;
  var tfName = TextEditingController(text: globalScript.galleryName);
  var tfPhone = TextEditingController(text: globalScript.galleryPhone);
  var tfPostCode = TextEditingController(text: globalScript.galleryPostCode);

  List listProvince;
  Future getProvince() async {
    isLoading = true;
    var url = 'http://dev.farizdotid.com/api/daerahindonesia/provinsi';
    var response = await http.get(url);
    var jsonObject = jsonDecode(response.body);

    setState(() {
      listProvince = (jsonObject as Map<String, dynamic>)['semuaprovinsi'];
    });
    isLoading = false;
  }

  List listCity;
  Future getCity() async {
    var url = 'http://dev.farizdotid.com/api/daerahindonesia/provinsi/' +
        globalScript.galleryProvinceID +
        '/kabupaten';
    var response = await http.get(url);
    var jsonObject = jsonDecode(response.body);

    setState(() {
      listCity = (jsonObject as Map<String, dynamic>)['kabupatens'];
    });
  }

  List listKecamatan;
  Future getKecamatan() async {
    var url =
        'http://dev.farizdotid.com/api/daerahindonesia/provinsi/kabupaten/' +
            globalScript.galleryCityID +
            '/kecamatan';
    var response = await http.get(url);
    var jsonObject = jsonDecode(response.body);

    setState(() {
      listKecamatan = (jsonObject as Map<String, dynamic>)['kecamatans'];
    });
    isLoading = false;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProvince();
    getCity();
    getKecamatan();
  }

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
          settingSelected,
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.check),
              onPressed: () {
                (settingSelected == "Gallery Name")
                    ? globalScript.galleryName = tfName.text
                    : (settingSelected == "Phone")
                        ? globalScript.galleryPhone = tfPhone.text
                        : (settingSelected == "Province")
                            ? 0
                            : (settingSelected == "City")
                                ? 0
                                : (settingSelected == "Kecamatan")
                                    ? 0
                                    : (settingSelected == "Post Code")
                                        ? globalScript.galleryPostCode =
                                            tfPostCode.text
                                        : 0;
                Navigator.pop(context);
              })
        ],
      ),
      body: SafeArea(
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                child: (settingSelected == "Gallery Name")
                    ? contentGalleryName()
                    : (settingSelected == "Phone")
                        ? contentGalleryPhone()
                        : (settingSelected == "Province")
                            ? contentProvince()
                            : (settingSelected == "City")
                                ? contentCity()
                                : (settingSelected == "Kecamatan")
                                    ? contentKecamatan()
                                    : (settingSelected == "Post Code")
                                        ? contentPostCode()
                                        : 0),
      ),
    );
  }

  Container contentPostCode() {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: TextFormField(
        controller: tfPostCode,
        decoration: InputDecoration(hintText: settingSelected),
        keyboardType: TextInputType.number,
      ),
    );
  }

  Container contentGalleryName() {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: TextFormField(
        controller: tfName,
        decoration: InputDecoration(hintText: settingSelected),
      ),
    );
  }

  Container contentGalleryPhone() {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: TextFormField(
        controller: tfPhone,
        decoration: InputDecoration(hintText: settingSelected),
        keyboardType: TextInputType.phone,
      ),
    );
  }

  ListView contentProvince() {
    return ListView(
        padding: EdgeInsets.only(left: 15),
        children: listProvince
            .map((item) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    GestureDetector(
                      child: Container(
                        height: 40,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            item['nama'],
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      onTap: () {
                        globalScript.galleryProvinceID = item['id'];
                        globalScript.galleryProvince = item['nama'];
                        Navigator.pop(context);
                      },
                    ),
                    Divider(height: 1),
                  ],
                ))
            .toList());
  }

  ListView contentCity() {
    return ListView(
        padding: EdgeInsets.only(left: 15),
        children: listCity
            .map((item) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    GestureDetector(
                      child: Container(
                        height: 40,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            item['nama'],
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      onTap: () {
                        globalScript.galleryCityID = item['id'];
                        globalScript.galleryCity = item['nama'];
                        Navigator.pop(context);
                      },
                    ),
                    Divider(height: 1),
                  ],
                ))
            .toList());
  }

  ListView contentKecamatan() {
    return ListView(
        padding: EdgeInsets.only(left: 15),
        children: listKecamatan
            .map((item) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    GestureDetector(
                      child: Container(
                        height: 40,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            item['nama'],
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      onTap: () {
                        globalScript.galleryKecamatanID = item['id'];
                        globalScript.galleryKecamatan = item['nama'];
                        Navigator.pop(context);
                      },
                    ),
                    Divider(height: 1),
                  ],
                ))
            .toList());
  }
}
