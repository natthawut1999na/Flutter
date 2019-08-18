import 'package:flutter/material.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
final Color backgroundColor = Color.fromRGBO(51, 51, 51, 1);
class WidgetBottom extends StatefulWidget {
  @override
  _WidgetBottomState createState() => _WidgetBottomState();
}

class _WidgetBottomState extends State<WidgetBottom> {
  int _currentindex;
  @override
  void initState() {
    super.initState();
    _currentindex = 0;
  }

  void changePage(int index) {
    setState(() {
      _currentindex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    var bubbleBottomBarItem = BubbleBottomBarItem(
                  backgroundColor: Colors.black,
                  icon: Icon(
                    Icons.home,
                    color: Colors.black,
                  ),
                  activeIcon: Icon(Icons.home, color: Colors.white),
                  title: Text("Home", style: TextStyle(color: Colors.white)));
    return Scaffold(
      backgroundColor: backgroundColor,
      bottomNavigationBar: Padding(
          padding: EdgeInsets.only(bottom: 12),
          child: BubbleBottomBar(
            backgroundColor: Colors.transparent,
            opacity: 1,
            elevation: 0,
            currentIndex: _currentindex,
            onTap: changePage,
            items: <BubbleBottomBarItem>[
              bubbleBottomBarItem,
              BubbleBottomBarItem(
                  backgroundColor: Colors.black,
                  icon: Icon(
                    Icons.home,
                    color: Colors.black,
                  ),
                  activeIcon: Icon(Icons.home, color: Colors.white),
                  title: Text("Ca", style: TextStyle(color: Colors.white))),
              BubbleBottomBarItem(
                  backgroundColor: Colors.black,
                  icon: Icon(
                    Icons.home,
                    color: Colors.black,
                  ),
                  activeIcon: Icon(Icons.home, color: Colors.white),
                  title: Text("Home", style: TextStyle(color: Colors.white))),
              BubbleBottomBarItem(
                  backgroundColor: Colors.black,
                  icon: Icon(
                    Icons.music_note,
                    color: Colors.black,
                  ),
                  activeIcon: Icon(Icons.music_note, color: Colors.white),
                  title: Text(
                    "Music",
                    style: TextStyle(color: Colors.white),
                  )),
            ],
          )),
          
    );
  }
}
