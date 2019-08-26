import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MenuMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Color(0xFFFE1483),
          ),
          onPressed: () {},
        ),
        title: Text(
          'Home',
          style: TextStyle(
            color: Color(0xFFFE1483),
            fontFamily: "Nexa-bold",
            fontSize: ScreenUtil.getInstance().setSp(46),
          ),
        ),
        centerTitle: true,
        actions: <Widget>[],
      ),
    );
  }
}
