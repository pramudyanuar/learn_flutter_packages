import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class ConvexBottombar extends StatefulWidget {
  @override
  State<ConvexBottombar> createState() => _ConvexBottombarState();
}

class _ConvexBottombarState extends State<ConvexBottombar> {
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Convex Bottombar'),
      ),
      bottomNavigationBar: SalomonBottomBar(
          currentIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),
          items: [
            /// Home
            SalomonBottomBarItem(
              icon: Icon(Icons.home),
              title: Text("Home"),
              selectedColor: Colors.purple,
            ),

            SalomonBottomBarItem(
              icon: Icon(Icons.camera_enhance),
              title: Text("Camera"),
              selectedColor: Colors.red,
            ),

            /// Likes
            SalomonBottomBarItem(
              icon: Icon(Icons.favorite_border),
              title: Text("Likes"),
              selectedColor: Colors.pink,
            ),

            /// Search
            SalomonBottomBarItem(
              icon: Icon(Icons.search),
              title: Text("Search"),
              selectedColor: Colors.orange,
            ),

            /// Profile
            SalomonBottomBarItem(
              icon: Icon(Icons.person),
              title: Text("Profile"),
              selectedColor: Colors.teal,
            ),
          ],
        ),
    );
  }
}