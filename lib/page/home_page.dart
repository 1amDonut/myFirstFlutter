import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context){
    final tabs = [
      Container(),
      Container(),
    ];

    return Scaffold(
      appBar:AppBar(
        title: Text('test'),
      )
    );
  }
}