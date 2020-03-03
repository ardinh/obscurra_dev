import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  List<String> _promoStudio = [
    'Promo 1',
    'Promo 2',
    'Promo 3',
    'Promo 4',
    'Promo 5',
  ];

  List<String> _recentExplore = [
    'Recent 1',
    'Recent 2',
    'Recent 3',
    'Recent 4',
  ];

  List<String> _topList = [
    'Top List 1',
    'Top List 2',
    'Top List 3',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: <Widget>[
        Container(
          height: 230,
          decoration: BoxDecoration(
            color: Colors.amber,
          ),
        ),

        Container(
          padding: EdgeInsets.only(top: 25),
          height: 240,
          //decoration: BoxDecoration(color: Colors.red),
          child: Column(
            children: <Widget>[
              //-- Promo Studio
              Container(
                margin: EdgeInsets.only(left: 5),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Promo Studio",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Container(
                height: 190,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _promoStudio.length,
                    itemBuilder: (context, i) {
                      return cardPromoStudio();
                    }),
              ),
            ],
          ),
        ),
        //-- Promo Studio

        //-- Recent Explore
        Container(
          margin: EdgeInsets.only(top: 10, left: 5),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              "Recent Explore",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
        Container(
          height: 240,
          //decoration: BoxDecoration(color: Colors.red),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _recentExplore.length,
              itemBuilder: (context, i) {
                return cardRecentExplore();
              }),
        ),
        //-- Recent Explore

        //-- Top List
        Container(
          margin: EdgeInsets.only(top: 20, left: 5),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              "Top List",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
        Container(
          height: 240,
          //decoration: BoxDecoration(color: Colors.red),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _topList.length,
              itemBuilder: (context, i) {
                return cardTopList();
              }),
        ),
        //-- Top List
      ],
    ));
  }

  Center cardTopList() {
    return Center(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        elevation: 3,
        margin: EdgeInsets.only(left: 5, right: 5),
        child: Container(
          height: 230,
          width: 150,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(5)),
          child: Column(
            children: <Widget>[
              Container(
                height: 115,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(5))),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Center cardRecentExplore() {
    return Center(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        elevation: 3,
        margin: EdgeInsets.only(left: 5, right: 5),
        child: Container(
          height: 230,
          width: 180,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(5)),
          child: Column(
            children: <Widget>[
              Container(
                height: 115,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(5))),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Center cardPromoStudio() {
    return Center(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        elevation: 3,
        margin: EdgeInsets.only(left: 5, right: 5),
        child: Container(
          height: 170,
          width: 290,
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(5)),
        ),
      ),
    );
  }
}
