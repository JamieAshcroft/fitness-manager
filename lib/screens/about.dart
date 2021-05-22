import 'package:flutter/material.dart';

class AboutWidget extends StatefulWidget {
  @override
  _AboutWidgetState createState() => _AboutWidgetState();
}

class _AboutWidgetState extends State<AboutWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello There'),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.blueGrey.shade900,
      ),
    );
  }
}
