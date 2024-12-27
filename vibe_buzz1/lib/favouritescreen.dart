import 'package:flutter/material.dart';
import 'package:vibe_buzz1/albumscreen.dart';
import 'package:vibe_buzz1/homescreen.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  final Set<String> favoriteSongs;

  const FavoritesScreen({super.key, required this.favoriteSongs});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
        backgroundColor: Colors.teal,
      ),
      body: favoriteSongs.isEmpty
          ? const Center(child: Text('No favorites yet!'))
          : ListView(
              children: favoriteSongs.map((song) {
                return ListTile(
                  title: Text(song),
                  leading: const Icon(Icons.music_note),
                );
              }).toList(),
            ),
    );
  }
}
