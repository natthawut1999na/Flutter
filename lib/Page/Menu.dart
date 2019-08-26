import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

final Color backgroundColor = Color.fromRGBO(51, 51, 51, 1);
final Color colorwidget = Color.fromRGBO(51, 51, 51, 1);

class Sidebar extends StatefulWidget {
  @override
  _SidebarState createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> with SingleTickerProviderStateMixin {
  bool isCollapsed = true;
  bool _isVisible = true;
  double screenWidth, screenHeight;
  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<Offset> _slideAnimation;
  Animation<double> _menuScaleAnimation;
  int _currentindex;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _scaleAnimation = Tween<double>(begin: 1, end: 0.6).animate(_controller);
    _menuScaleAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(_controller);
    super.initState();
    _currentindex = 0;
  }

  void changePage(int index) {
    setState(() {
      _currentindex = index;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;

    return Scaffold(
      backgroundColor: backgroundColor,
      bottomNavigationBar: Visibility(
        visible: _isVisible,
        child: Padding(
            padding: EdgeInsets.only(bottom: 0),
            child: BubbleBottomBar(
              backgroundColor: colorwidget,
              opacity: 1,
              elevation: 0,
              currentIndex: _currentindex,
              onTap: changePage,
              items: <BubbleBottomBarItem>[
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
                      MdiIcons.dumbbell,
                      color: Colors.black,
                    ),
                    activeIcon: Icon(MdiIcons.dumbbell, color: Colors.white),
                    title: Text("Calculate",
                        style: TextStyle(color: Colors.white))),
                BubbleBottomBarItem(
                    backgroundColor: Colors.black,
                    icon: Icon(
                      Icons.map,
                      color: Colors.black,
                    ),
                    activeIcon: Icon(Icons.map, color: Colors.white),
                    title: Text("Map", style: TextStyle(color: Colors.white))),
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
      ),
      body: Stack(
        children: <Widget>[menu(context), dashboard(context)],
      ),
    );
  }

  Widget menu(context) {
    return SlideTransition(
      position: _slideAnimation,
      child: ScaleTransition(
        scale: _menuScaleAnimation,
        child: Padding(
          padding: const EdgeInsets.only(left: 18.0, top: 50),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 0.1 * screenWidth),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          alignment: Alignment.center,
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://thaihitz.com/wp-content/uploads/2019/07/Spider-Man-1.jpg")),
                      borderRadius: BorderRadius.all(Radius.circular(80.0)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 0.11 * screenWidth),
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Tom Holland",
                        style: TextStyle(
                            fontSize: 17,
                            fontFamily: 'Nexa-Light',
                            color: Colors.white),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 0.07 * screenHeight),
                Row(
                  children: <Widget>[
                    Icon(Icons.settings, color: Colors.white),
                    Text(
                      " Dashboard",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Nexa-Light'),
                          
                    ),
                    
                  ],
                ),
                SizedBox(height: 10),
                Row(children: <Widget>[
                  Icon(Icons.settings, color: Colors.white),
                  Text(
                    " Messages",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Nexa-Light'),
                  ),
                ]),
                SizedBox(height: 10),
                Row(children: <Widget>[
                  Icon(Icons.settings, color: Colors.white),
                  Text(
                    " Utility Bills",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Nexa-Light'),
                  ),
                ]),
                SizedBox(height: 10),
                Row(children: <Widget>[
                  Icon(Icons.settings, color: Colors.white),
                  Text(
                    " Funds Transfer",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Nexa-Light'),
                  ),
                ]),
                SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    Icon(Icons.settings, color: Colors.white),
                    Text(
                      " Branches",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Nexa-Light'),
                    ),
                  ],
                ),
                SizedBox(
                  height: .20 * screenHeight,
                ),
                Row(
                  children: <Widget>[
                    FlatButton.icon(
                      icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                      label: Text(
                        "Logout",
                        style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 18,
                            fontFamily: 'Nexa-Light'),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget dashboard(context) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 300),
      top: isCollapsed ? 0 : -0.1 * screenHeight,
      bottom: isCollapsed ? 0 : -0.1 * screenHeight,
      left: isCollapsed ? 0 : 0.4 * screenWidth,
      right: isCollapsed ? 0 : -0.4 * screenWidth,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Material(
          animationDuration: Duration(),
          borderRadius: BorderRadius.all(Radius.circular(5)),
          elevation: 8,
          color: colorwidget,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: ClampingScrollPhysics(),
            child: Container(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        child: Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                        onTap: () {
                          setState(() {
                            if (isCollapsed)
                              _controller.forward();
                            else
                              _controller.reverse();
                            isCollapsed = !isCollapsed;
                          });
                        },
                      ),
                      Text(
                        "My Card",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontFamily: 'Nexa-Bold'),
                      ),
                      Icon(
                        Icons.info_outline,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: 200,
                    child: PageView(
                      controller: PageController(viewportFraction: 0.8),
                      scrollDirection: Axis.horizontal,
                      pageSnapping: true,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          color: Colors.redAccent,
                          width: 100,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          color: Colors.blueAccent,
                          width: 100,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          color: Colors.greenAccent,
                          width: 100,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 50),
                  Text(
                    "DATA",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontFamily: 'Nexa-Bold'),
                  ),
                  SizedBox(height: 10),
                  Container(
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (centext, index) {
                        return ListTile(
                          title: Text("Mac"),
                          subtitle: Text("apple"),
                          trailing: Text("-2900"),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Divider(height: 10);
                      },
                      itemCount: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
