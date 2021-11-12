import 'package:flutter/material.dart';
import 'package:jupViec/screen/favorite_page.dart';
import 'package:jupViec/screen/history_page.dart';
import 'package:jupViec/screen/notification_page.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'screen/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JupViec',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: SizedBox.expand(
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => _currentIndex = index);
            },
            children: <Widget>[
              HomePage(),
              FavoritePage(),
              HistoryPage(),
              NotificationPage(),
            ],
          ),
        ),
        bottomNavigationBar: SalomonBottomBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() => _currentIndex = index);
            _pageController.jumpToPage(index);
          },
          items: [
            /// Home
            SBBItem(
              icon: Icon(Icons.home),
              title: Text("Home"),
              selectedColor: Colors.purple,
            ),

            /// Likes
            SBBItem(
              icon: Icon(Icons.favorite_border),
              title: Text("Favorite"),
              selectedColor: Colors.pink,
            ),

            /// Search
            SBBItem(
              icon: Icon(Icons.history),
              title: Text("History"),
              selectedColor: Colors.orange,
            ),

            /// Profile
            SBBItem(
              icon: Icon(Icons.notifications_none),
              title: Text("Notification"),
              selectedColor: Colors.teal,
            ),
          ],
        ),
      ),
    );
  }
}
