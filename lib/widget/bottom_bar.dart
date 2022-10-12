import 'package:flutter/material.dart';

class Bottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(60, 66, 82, 1.0),
      child: Container(
        height: 70,
        child: TabBar(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white60,
          indicatorColor: Colors.transparent,
          tabs: <Widget>[
            Tab(
              icon: Icon(
                IconData(0xe0be, fontFamily: 'MaterialIcons'),
                size: 18,
              ),
              child: Text(
                'MARKET',
                style: TextStyle(fontSize: 9),
              ),
            ),
            Tab(
              icon: Icon(
                IconData(0xe5fa, fontFamily: 'MaterialIcons'),
                size: 18,
              ),
              child: Text(
                'INTEREST',
                style: TextStyle(fontSize: 9),
              ),
            ),
            Tab(
              icon: Icon(
                IconData(0xe1f2, fontFamily: 'MaterialIcons'),
                size: 18,
              ),
              child: Text(
                'PORTFOLIO',
                style: TextStyle(fontSize: 9),
              ),
            ),
            Tab(
              icon: Icon(
                Icons.list,
                size: 18,
              ),
              child: Text(
                'ETC',
                style: TextStyle(fontSize: 9),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
