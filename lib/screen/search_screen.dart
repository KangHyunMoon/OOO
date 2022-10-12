import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchScreen extends StatefulWidget {
  _SearchScreen createState() => _SearchScreen();
}

class SearchScreenTile extends StatelessWidget {
  var _ListTile;

  @override
  Widget build(BuildContext context) {
    return _ListTile;
  }

  SearchScreenTile(String _tabText) {
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

class _SearchScreen extends State<SearchScreen> {
  List<SearchScreenTile> searchList = [
    SearchScreenTile('1'),
    SearchScreenTile('2'),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(60, 66, 82, 1.0),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(60, 66, 82, 1.0),
          title: Text("Search"),
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          color: Color.fromARGB(255, 85, 93, 115),
          child: Flexible(
            flex: 1,
            child: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none),
                      hintText: 'Search',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
                      prefixIcon: Container(
                        padding: EdgeInsets.all(15),
                        child: Icon(Icons.search),
                        width: 5,
                      )),
                ),
                Expanded(
                  child: Container(
                    color: Color.fromARGB(255, 85, 93, 115),
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: ListView.separated(
                        itemCount: searchList.length,
                        itemBuilder: (context, index) {
                          return searchList[index];
                        },
                        separatorBuilder: (context, index) {
                          return Divider(
                            color: Colors.black,
                          );
                        }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
