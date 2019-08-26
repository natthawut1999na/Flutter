import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttery_seekbar/fluttery_seekbar.dart';
import 'dart:math';

class MusicPagerun extends StatefulWidget {
  @override
  _MusicPagerunState createState() => _MusicPagerunState();
}

class _MusicPagerunState extends State<MusicPagerun> {
  double _thumbPercent = 0.4;
  Widget _builRedialSeekBar() {
    return RadialSeekBar(
      trackColor: Colors.red.withOpacity(.5),
      trackWidth: 2.0,
      progressColor: Color(0xFFFE1483),
      progressWidth: 5.0,
      thumbPercent: _thumbPercent,
      thumb: CircleThumb(
        color: Color(0xFFFE1483),
        diameter: 20.0,
      ),
      progress: _thumbPercent,
      onDragUpdate: (double percent) {
        setState(() {
          _thumbPercent = percent;
        });
      },
    );
  }

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
            'Music',
            style: TextStyle(
              color: Color(0xFFFE1483),
              fontFamily: "Nexa-bold",
              fontSize: ScreenUtil.getInstance().setSp(46),
            ),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            SizedBox(height:25.0),
          Center(
              child: Container(
            width: 250,
            height: 250,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xFFFE1483).withOpacity(.5),
                      shape: BoxShape.circle),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: _builRedialSeekBar(),
                  ),
                ),
                Center(
                  child: Container(
                    width: 200.0,
                    height: 200.0,
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: ClipOval(
                        clipper: MClipper(),
                        child: Image.asset(
                          "assets/image_01.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ))
        ]));
  }
}

class MClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: min(size.width / 2, size.height / 2));
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}
