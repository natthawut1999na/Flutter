import 'package:flutter/material.dart';
import 'Menu.dart';

class PageMenu extends StatefulWidget {
  @override
  _PageMenuState createState() => _PageMenuState();
}

class _PageMenuState extends State<PageMenu> {
  // Widget _buildRadilSeekBar() {
  // }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(backgroundColor: backgroundColor, body: Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Sidebar()
      ],
    ));
  }
}
