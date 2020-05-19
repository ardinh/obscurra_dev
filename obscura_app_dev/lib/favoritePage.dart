import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget {
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  bool isLoading = false;

  List _listFavorite = [
    ['Studio A', 'Bandung', 'Rp2000000', 'Rp1000000', true],
    ['Studio B', 'Jakarta', 'Rp3000000', 'Rp2000000', true],
    ['Studio C', 'Yogyakarta', 'Rp4000000', 'Rp3000000', true],
    ['Studio D', 'Malang', 'Rp5000000', 'Rp4000000', true],
    ['Studio E', 'Bandung', 'Rp6000000', 'Rp5000000', true],
    ['Studio F', 'Bandung', 'Rp7000000', 'Rp6000000', true],
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Container(
            height: 35,
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(3)),
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Icon(
                    Icons.search,
                    size: 22,
                  ),
                ),
                Text(
                  'Obscura',
                  style: TextStyle(color: Colors.black, fontSize: 15),
                )
              ],
            )),
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {}),
          IconButton(icon: Icon(Icons.message), onPressed: () {}),
        ],
      ),
      body: SafeArea(
          child: isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : RefreshIndicator(
                  onRefresh: () async {
                    isLoading = true;
                    super.initState();
                    isLoading = false;
                  },
                  child: Container(
                    child: ListView(
                      padding: EdgeInsets.only(top: 5, bottom: 5),
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Wrap(
                                children: _listFavorite
                                    .map((_item) => contentFavorite(_item[0],
                                        _item[1], _item[2], _item[3], _item[4]))
                                    .toList()
                                    .cast()),
                          ],
                        ),
                      ],
                    ),
                  ),
                )),
    );
  }

  Card contentFavorite(_studioName, _location, _disc, _price, _isFavorite) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      elevation: 3,
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 100,
                width: 170,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5))),
              ),
              Positioned(
                right: 0,
                child: IconButton(
                    icon: _isFavorite
                        ? Icon(
                            Icons.favorite,
                            color: Colors.orange[900],
                          )
                        : Icon(
                            Icons.favorite_border,
                            color: Colors.orange[900],
                          ),
                    onPressed: null),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            height: 110,
            width: 170,
            decoration: BoxDecoration(
                //color: Colors.red,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(_studioName,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.place,
                      size: 11,
                      color: Colors.grey[600],
                    ),
                    Text(
                      _location,
                      style: TextStyle(color: Colors.grey[600], fontSize: 11),
                    ),
                  ],
                ),
                Text(
                  _disc,
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                      decoration: TextDecoration.lineThrough),
                ),
                RichText(
                    text: TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: _price,
                      style: TextStyle(
                          color: Colors.orange[900],
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  TextSpan(
                      text: '/day',
                      style: TextStyle(color: Colors.grey[600], fontSize: 12))
                ]))
              ],
            ),
          )
        ],
      ),
    );
  }
}
