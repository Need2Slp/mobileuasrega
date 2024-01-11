import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mobileuasrega/pages/home_page.dart';
import 'package:mobileuasrega/pages/info_page.dart';
import 'package:mobileuasrega/pages/note_page.dart';

class ButtonNavbar extends StatefulWidget {
  const ButtonNavbar({Key? key}) : super(key: key);

  @override
  _ButtonNavbarState createState() => _ButtonNavbarState();
}

class _ButtonNavbarState extends State<ButtonNavbar> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: Colors.grey,
        items: <Widget>[
          Icon(Icons.home_rounded, color: Colors.indigo),
          Icon(Icons.notes, color: Colors.indigo),
          Icon(Icons.info, color: Colors.indigo),
        ],
        index: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      body: <Widget>[
        HomePage(),
        NotePage(),
        InfoPage(),
      ][currentIndex],
    );
  }
}
