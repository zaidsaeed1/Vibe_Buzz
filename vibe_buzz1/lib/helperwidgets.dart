import 'package:flutter/material.dart';
import 'package:vibe_buzz1/albumscreen.dart';
import 'package:vibe_buzz1/favouritescreen.dart';
import 'package:vibe_buzz1/homescreen.dart';

Widget _buildNavBar(BuildContext context, int currentIndex) {
  return BottomNavigationBar(
    currentIndex: currentIndex,
    selectedItemColor: Colors.cyanAccent,
    backgroundColor: Colors.black,
    items: const [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      BottomNavigationBarItem(icon: Icon(Icons.library_music), label: 'Albums'),
      BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
    ],
    onTap: (index) {
      if (index == 0) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const HomeScreen()));
      }
      if (index == 1) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const AlbumsScreen()));
      }
      if (index == 2) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const FavoritesScreen()));
      }
    },
  );
}
