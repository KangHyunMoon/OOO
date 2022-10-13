import 'package:flutter/material.dart';

import 'package:ooo_app/widget/server_proxy.dart';

import 'package:ooo_app/widget/bottom_bar.dart';
import 'package:ooo_app/screen/market_screen.dart';
import 'package:ooo_app/screen/etc_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late TabController controller;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OOO Project',
      theme: new ThemeData(primaryColor: Color.fromRGBO(60, 66, 82, 1.0)),
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              MarketScreen(),
              Container(
                child: Center(
                  child: Text('2'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('3'),
                ),
              ),
              EtcScreen(),
            ],
          ),
          bottomNavigationBar: Bottom(),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    ServerProxy.getInstance().initialize();
  }
}
