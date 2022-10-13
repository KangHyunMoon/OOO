import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';

//import 'package:flutter/material.dart';

class ServerProxy {
  static var _proxyInstance;
  var _socket;
  var _vecListener = <IServerProxy>[];

  final ip = '130.162.146.126';
  final port = 80;

  static ServerProxy getInstance() {
    if (_proxyInstance == null) {
      _proxyInstance = new ServerProxy();
    }
    return _proxyInstance;
  }

  void _socketInit(_ip, _port) async {
    try {
      // connect to the socket server\
      _socket = await Socket.connect(_ip, _port);

      print(
          'Connected to: ${_socket.remoteAddress.address}:${_socket.remotePort}');

      // listen for responses from the server
      _socket.listen(
        // handle data from the server
        (Uint8List data) {
          final serverResponse = String.fromCharCodes(data);
          print('Server: $serverResponse');

          _onDataReceived(serverResponse);
        },

        // handle errors
        onError: (error) {
          print("Server error : " + error);
          _socket.destroy();
        },

        // handle server ending connection
        onDone: () {
          print('Server destroy.');
          _socket.destroy();
        },
      );
    } catch (e) {
      print("cathch : " + e.toString());
    }

    //socket.write("1234");

    //print("2");
  }

  bool send(String _message) {
    if (_socket == null) {
      print("socket null");
      return false;
    }

    try {
      print("send message : " + _message);
      _socket.write(_message);
    } catch (e) {
      print("send message fail!");
    }

    return true;
  }

  void _onDataReceived(String data) {
    print('onDataReceived: ' + data);

    if (_vecListener.isEmpty == true) {
      return;
    }

    for (int i = 0; i < _vecListener.length; i++) {
      _vecListener[i].onDataReceived(data);
    }
  }

  bool initialize() {
    _socketInit(ip, port);
    return true;
  }

  bool registerServerProxy(IServerProxy _widget) {
    _vecListener.add(_widget);
    return true;
  }
}

abstract class IServerProxy {
  void onDataReceived(String _data);
}
