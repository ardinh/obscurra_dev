import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = false;

  List _listPromoDiscount = [
    ['Promo 1', 'Rp1000000', false],
    ['Promo 2', 'Rp2000000', false],
    ['Promo 3', 'Rp3000000', false],
    ['Promo 4', 'Rp4000000', false],
    ['Promo 5', 'Rp5000000', false],
  ];

  List _listRecommendForYou = [
    ['Recommend 1', 'Rp1000000', false],
    ['Recommend 2', 'Rp2000000', false],
    ['Recommend 3', 'Rp3000000', false],
    ['Recommend 4', 'Rp4000000', false],
    ['Recommend 5', 'Rp5000000', false],
  ];

  List _listLastestSeen = [
    ['Studio A', 'Bandung', 'Rp2000000', 'Rp1000000', true],
    ['Studio B', 'Jakarta', 'Rp3000000', 'Rp2000000', true],
    ['Studio C', 'Yogyakarta', 'Rp4000000', 'Rp3000000', true],
    ['Studio D', 'Malang', 'Rp5000000', 'Rp4000000', false],
  ];

  List _listLastestCity = [
    ['Studio A', 'Bandung', 'Rp2000000', 'Rp1000000', false],
    ['Studio B', 'Jakarta', 'Rp3000000', 'Rp2000000', true],
    ['Studio C', 'Yogyakarta', 'Rp4000000', 'Rp3000000', false],
    ['Studio D', 'Malang', 'Rp5000000', 'Rp4000000', true]
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
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
        elevation: 0,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {}),
          IconButton(icon: Icon(Icons.message), onPressed: () {}),
        ],
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            isLoading = true;
            super.initState();
            isLoading = false;
          },
          child: isLoading
              ? Center(child: CircularProgressIndicator())
              : Container(
                  child: ListView(
                    children: <Widget>[
                      //-- Promos & Discounts Studio
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 5),
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  "Promos & Discounts Studio",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                            Container(
                              //color: Colors.amber,
                              height: 190,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: _listPromoDiscount.length,
                                  itemBuilder: (context, i) {
                                    return contentPromoDiscount(
                                        _listPromoDiscount[i][0],
                                        _listPromoDiscount[i][1],
                                        _listPromoDiscount[i][2]);
                                  }),
                            ),
                          ],
                        ),
                      ),
                      //-- Promos & Discounts Studio

                      //-- Lastest Seen
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 5),
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  "Lastest Seen",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                            Container(
                              //color: Colors.amber,
                              child: Wrap(
                                children: _listLastestSeen
                                    .map((_item) => contentLastestSeen(_item[0],
                                        _item[1], _item[2], _item[3], _item[4]))
                                    .toList()
                                    .cast(),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                  child: Text(
                                'See More',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              )),
                            )
                          ],
                        ),
                      ),
                      //-- Lastest Seen

                      //-- Recommended For You
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 5),
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  "Recommended For You",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                            Container(
                              //color: Colors.amber,
                              height: 190,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: _listRecommendForYou.length,
                                  itemBuilder: (context, i) {
                                    return contentRecommendedForYou(
                                      _listRecommendForYou[i][0],
                                      _listRecommendForYou[i][1],
                                      _listRecommendForYou[i][2],
                                    );
                                  }),
                            ),
                          ],
                        ),
                      ),
                      //-- Recommended For You

                      //-- Category
                      Container(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 5),
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  "Category",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                            Container(
                                //color: Colors.amber,
                                child: Wrap(
                              children: <Widget>[
                                contentCategory('Wedding'),
                                contentCategory('Endorse'),
                                contentCategory('Product'),
                                contentCategory('Hunting'),
                                contentCategory('Food'),
                                contentCategory('More')
                              ],
                            )),
                          ],
                        ),
                      ),
                      //-- Category

                      //-- Lastest City
                      // Container(
                      //   padding: EdgeInsets.only(top: 10),
                      //   height: 259,
                      //   decoration:
                      //       BoxDecoration(color: Color.fromARGB(255, 240, 240, 240)),
                      //   child: Column(
                      //     children: <Widget>[
                      //       Container(
                      //         margin: EdgeInsets.only(left: 5),
                      //         child: Align(
                      //           alignment: Alignment.bottomLeft,
                      //           child: Text(
                      //             "Lastest City",
                      //             style: TextStyle(fontSize: 20),
                      //           ),
                      //         ),
                      //       ),
                      //       Container(
                      //         //color: Colors.amber,
                      //         height: 225,
                      //         child: ListView.builder(
                      //             scrollDirection: Axis.horizontal,
                      //             itemCount: _listLastestCity.length,
                      //             itemBuilder: (context, i) {
                      //               return contentLastestCity(
                      //                   _listLastestCity[i][0],
                      //                   _listLastestCity[i][1],
                      //                   _listLastestCity[i][2],
                      //                   _listLastestCity[i][3],
                      //                   _listLastestCity[i][4]);
                      //             }),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      //-- Lastest City
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  Card contentLastestCity(_studioName, _location, _disc, _price, _isFavorite) {
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

  GestureDetector contentCategory(String _name) {
    return GestureDetector(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
            height: 80,
            width: 80,
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(50)),
          ),
          Text(_name),
        ],
      ),
      onTap: () {
        print(_name);
      },
    );
  }

  Card contentLastestSeen(_studioName, _location, _disc, _price, _isFavorite) {
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

  Center contentRecommendedForYou(_studioName, _price, _isFavorite) {
    return Center(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        elevation: 3,
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 140,
                  width: 290,
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
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              height: 42,
              width: 290,
              decoration: BoxDecoration(
                  //color: Colors.red,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    _studioName,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(_price)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Center contentPromoDiscount(_studioName, _price, _isFavorite) {
    return Center(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        elevation: 3,
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 140,
                  width: 290,
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
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              height: 42,
              width: 290,
              decoration: BoxDecoration(
                  //color: Colors.red,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    _studioName,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(_price)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
