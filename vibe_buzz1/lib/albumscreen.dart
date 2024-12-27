import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AlbumsScreen extends StatefulWidget {
  const AlbumsScreen({super.key});

  @override
  _AlbumsScreenState createState() => _AlbumsScreenState();
}

class _AlbumsScreenState extends State<AlbumsScreen> {
  final List<Map<String, String>> allSongs = [
    {"title": "Song 1", "file": "assets/song1.mp3"},
    {"title": "Song 2", "file": "assets/song2.mp3"},
    {"title": "Song 3", "file": "assets/song3.mp3"},
    {"title": "Song 4", "file": "assets/song4.mp3"},
    {"title": "Song 5", "file": "assets/song5.mp3"},
    {"title": "Song 6", "file": "assets/song6.mp3"},
    {"title": "Song 7", "file": "assets/song7.mp3"},
    {"title": "Song 8", "file": "assets/song8.mp3"},
  ];

  final AudioPlayer _audioPlayer = AudioPlayer(); // Audio player instance
  String? _currentPlaying; // To track the currently playing song

  // Function to play or stop a song
  Future<void> playPauseSong(String songFile, String songTitle) async {
    if (_currentPlaying == songTitle) {
      // Stop if the song is already playing
      await _audioPlayer.stop();
      setState(() {
        _currentPlaying = null;
      });
    } else {
      // Play the new song
      try {
        await _audioPlayer.setAsset(songFile);
        await _audioPlayer.play();
        setState(() {
          _currentPlaying = songTitle;
        });
      } catch (e) {
        print("Error playing song: $e");
      }
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Albums'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/pic.jpg'), // Background image
            fit: BoxFit.cover, // Ensures the image covers the entire screen
          ),
        ),
        child: Center(
          child: Card(
            elevation: 4,
            color: Colors.teal.shade100.withOpacity(
                0.8), // Semi-transparent card to overlay the background
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text(
                      'My Playlist',
                      style: TextStyle(color: Colors.black),
                    ),
                    content: SizedBox(
                      width: double.maxFinite,
                      child: ListView.builder(
                        itemCount: allSongs.length,
                        itemBuilder: (context, index) {
                          final song = allSongs[index];
                          final isPlaying = _currentPlaying == song["title"];
                          return ListTile(
                            title: Text(
                              song["title"] ?? "",
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            leading: Icon(
                              isPlaying
                                  ? Icons.pause_circle
                                  : Icons.play_circle,
                              color: Colors.teal,
                            ),
                            tileColor: Colors.teal.shade400,
                            onTap: () =>
                                playPauseSong(song["file"]!, song["title"]!),
                          );
                        },
                      ),
                    ),
                    backgroundColor: Colors.teal.shade800,
                  ),
                );
              },
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'My Playlist',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
