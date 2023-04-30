import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:rj_studio/screen/aboutus.dart';
import 'package:rj_studio/screen/home.dart';
import 'package:rj_studio/screen/mybooking.dart';
import 'package:rj_studio/screen/profile.dart';

class NavPage extends StatefulWidget {
  @override
  _NavPageState createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  Color color = Color(0xFF4070FA);

  @override
  void initState() {
    super.initState();

  }

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildPages(),
      bottomNavigationBar: buildBar(),
    );
  }

  Widget buildPages() {
    switch (index) {
      case 1:
        return MyBooking_Page();
      case 2:
        return About_Us();
      case 3:
        return Profile_Page();
      default:
        return HomePage();
    }
  }

  Widget buildBar() {
    final inactiveColor = Colors.grey.shade800;

    return BottomNavyBar(
      itemCornerRadius: 15.0,
      selectedIndex: index,
      onItemSelected: (index) => setState(() => this.index = index),
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
          title: Text('Home'),
          textAlign: TextAlign.center,
          icon: LineIcon.home(),
          activeColor: color,
          inactiveColor: inactiveColor,
        ),
        BottomNavyBarItem(
          title: Text('My Booking'),
          textAlign: TextAlign.center,
          icon: LineIcon.book(),
          activeColor: color,
          inactiveColor: inactiveColor,
        ),
        BottomNavyBarItem(
          title: Text('About Us'),
          textAlign: TextAlign.center,
          icon: LineIcon.infoCircle(),
          activeColor: color,
          inactiveColor: inactiveColor,

        ),
        BottomNavyBarItem(
          title: Text('Profile'),
          textAlign: TextAlign.center,
          icon: LineIcon.userCircle(),
          activeColor: color,
          inactiveColor: inactiveColor,
        ),
      ],
    );
  }
}