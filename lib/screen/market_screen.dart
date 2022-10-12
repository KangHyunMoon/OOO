import 'package:flutter/material.dart';
import 'package:ooo_app/screen/search_screen.dart';

class MarketScreen extends StatefulWidget {
  _MarketScreenState createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  static var MarketSceenTabIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MarketTab();
  }
}

class MarketTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(60, 66, 82, 1.0),
      child: DefaultTabController(
        initialIndex: _MarketScreenState.MarketSceenTabIndex,
        length: 3,
        child: Scaffold(
          /* app bar */
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(60, 66, 82, 1.0),
            title: Text('Market'),
            bottom: TabBar(
              onTap: (index) {
                _MarketScreenState.MarketSceenTabIndex = index;
              },
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white60,
              indicatorColor: Colors.transparent,
              tabs: [
                Tab(text: '지수'),
                Tab(text: '외환'),
                Tab(text: '주식'),
              ],
            ),

            /* Search Button Action */
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SearchScreen()));
                },
                icon: Icon(Icons.search),
              )
            ],
          ),

          /* TabBar View */
          body: TabBarView(
            physics: AlwaysScrollableScrollPhysics(),
            children: <Widget>[
              IndexTab(),
              Container(
                child: Center(
                  child: Text('외환'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('주식'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IndexTabTile extends StatelessWidget {
  var _ListTile;

  @override
  Widget build(BuildContext context) {
    return _ListTile;
  }

  IndexTabTile(String _tabText) {
    _ListTile = Container(
      //color: Color.fromRGBO(86, 93, 109, 1.0),
      margin: const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
      height: 120.0,
      decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        leading: Container(
          padding: EdgeInsets.only(right: 12.0),
          decoration: new BoxDecoration(
              border: new Border(
                  right: new BorderSide(width: 1.0, color: Colors.white24))),
          child: Icon(Icons.favorite, color: Colors.pink),
        ),
        title: Text(
          _tabText,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        subtitle: Text("1234"),
        trailing: Container(
          child: Text("234"),
        ),
      ),
    );
  }
}

class IndexTab extends StatelessWidget {
  List<IndexTabTile> indexList = [
    IndexTabTile('1'),
    IndexTabTile('2'),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          color: Color.fromARGB(255, 85, 93, 115),
          child: ListView.separated(
              padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 0),
              itemCount: indexList.length,
              itemBuilder: (context, index) {
                return indexList[index];
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: Colors.black,
                );
              })),
    );
  }
}

class ForexTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Tab(),
      ),
    );
  }
}

class StockTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Tab(),
      ),
    );
  }
}

/*
class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 7, 20, 7),
      child: Row(children: <Widget>[
        Image.asset(
          'images/stock.png',
          fit: BoxFit.contain,
          height: 25,
        )
      ]),
    );
  }
}
*/