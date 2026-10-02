import 'package:flutter/material.dart';

class Mainmenu extends StatefulWidget {
  const Mainmenu({super.key, required this.title});

  final String title;



  @override
  State<Mainmenu> createState() => _MainmenuState();

}

class _MainmenuState extends State<Mainmenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
    );
  }
}