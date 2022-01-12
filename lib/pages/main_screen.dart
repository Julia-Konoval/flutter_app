import 'dart:js';

import 'package:flutter/material.dart';


class MainScreen extends StatelessWidget {
  const  MainScreen({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text(''),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text('Main Screen', style: TextStyle(color: Colors.white)),
          ElevatedButton(onPressed: () {
            Navigator.pushNamed(context, '/todo');
          }, child: Text('Go'))
        ],
      ),
    );
  }
}