import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'Music.dart';
import 'Map.dart';
import 'Calculate.dart';
import 'MenuMain.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavbarPage extends StatefulWidget {
  @override
  _NavbarPageState createState() => _NavbarPageState();
}

class _NavbarPageState extends State<NavbarPage> {
  int _selectedPage = 0;
  final _pageOptions = [
    MenuMainPage(),
    CalculatePage(),
    MapPage(),
    MusicPagerun()
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        
        body: _pageOptions[_selectedPage],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedPage,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey[500],
            iconSize: 24,
            onTap: (int index) {
              setState(() {
                _selectedPage = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(MdiIcons.homeOutline), title: Text('Home')),
              BottomNavigationBarItem(
                  icon: Icon(MdiIcons.calculatorVariant),
                  title: Text('Calculate')),
              BottomNavigationBarItem(
                  icon: Icon(MdiIcons.mapOutline), title: Text('Map')),
              BottomNavigationBarItem(
                  icon: Icon(MdiIcons.musicCircleOutline), title: Text('Music')),
            ]),
      ),
    );
  }
}
