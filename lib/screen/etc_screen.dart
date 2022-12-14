import 'package:flutter/material.dart';
import 'package:ooo_app/widget/server_proxy.dart';

class EtcScreen extends StatefulWidget {
  _EtcScreenState createState() => _EtcScreenState();
}

class _EtcScreenState extends State<EtcScreen> with IServerProxy {
  var _etcMenu = <Widget>[
    Container(
      color: Colors.white,
      child: Text("1"),
    ),
    Container(
      color: Colors.white,
      child: Text("1"),
    ),
    Container(
      color: Colors.white,
      child: Text("1"),
    ),
    Container(
      color: Colors.white,
      child: Text("1"),
    ),
  ];

  @override
  void initState() {
    super.initState();

    ServerProxy.getInstance().registerServerProxy(this);

    ServerProxy.getInstance().send("zz");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(60, 66, 82, 1.0),
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 85, 93, 115),
        //backgroundColor: Color.fromRGBO(60, 66, 82, 1.0),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(60, 66, 82, 1.0),
          title: Text("Dev Menu"),
        ),

        body: Container(
          child: ListView.separated(
              //padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 0),
              itemCount: _etcMenu.length,
              itemBuilder: (context, index) {
                return _etcMenu[index];
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: Colors.black,
                );
              }),
        ),
      ),
    );
  }

  @override
  void onDataReceived(String _data) {
    print("1234");
  }
}
