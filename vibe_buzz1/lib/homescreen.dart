// import 'package:flutter/material.dart';
// import 'package:just_audio/just_audio.dart';
// import 'package:vibe_buzz1/albumscreen.dart';
// import 'package:vibe_buzz1/favouritescreen.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   final List<Map<String, String>> songs = [
//     {
//       "title": "MAN BHARAYA",
//       "file": "assets/song1.mp3",
//       "image": "assets/app_icon.png"
//     },
//     {
//       "title": "AADAT",
//       "file": "assets/song2.mp3",
//       "image": "assets/image1.jpg"
//     },
//     {
//       "title": "MILNE HAI MUJHSE AAI",
//       "file": "assets/song3.mp3",
//       "image": "assets/image1.jpg"
//     },
//     {
//       "title": "Song 4",
//       "file": "assets/song4.mp3",
//       "image": "assets/image1.jpg"
//     },
//     {
//       "title": "Song 5",
//       "file": "assets/song5.mp3",
//       "image": "assets/images/song5.jpg"
//     },
//     {
//       "title": "Song 6",
//       "file": "assets/song6.mp3",
//       "image": "assets/images/song6.jpg"
//     },
//     {
//       "title": "Song 7",
//       "file": "assets/song7.mp3",
//       "image": "assets/images/song7.jpg"
//     },
//     {
//       "title": "Song 8",
//       "file": "assets/song8.mp3",
//       "image": "assets/images/song8.jpg"
//     },
//     {
//       "title": "Song 9",
//       "file": "assets/song9.mp3",
//       "image": "assets/images/song9.jpg"
//     },
//     {
//       "title": "Song 10",
//       "file": "assets/song10.mp3",
//       "image": "assets/images/song10.jpg"
//     },
//     {
//       "title": "Song 11",
//       "file": "assets/song11.mp3",
//       "image": "assets/images/song11.jpg"
//     },
//     {
//       "title": "Song 12",
//       "file": "assets/song12.mp3",
//       "image": "assets/images/song12.jpg"
//     },
//     {
//       "title": "Song 13",
//       "file": "assets/song13.mp3",
//       "image": "assets/images/song13.jpg"
//     },
//   ];
//
//   final Set<String> favoriteSongs = {}; // To track favorites
//   final AudioPlayer _audioPlayer = AudioPlayer(); // Audio player instance
//
//   String? _currentPlaying; // To track the currently playing song
//
//   // Function to toggle favorite status
//   void toggleFavorite(String songTitle) {
//     setState(() {
//       if (favoriteSongs.contains(songTitle)) {
//         favoriteSongs.remove(songTitle);
//       } else {
//         favoriteSongs.add(songTitle);
//       }
//     });
//   }
//
//   // Function to play or stop a song
//   Future<void> playPauseSong(String songFile, String songTitle) async {
//     if (_currentPlaying == songTitle) {
//       // Stop if the song is already playing
//       await _audioPlayer.stop();
//       setState(() {
//         _currentPlaying = null;
//       });
//     } else {
//       // Play the new song
//       try {
//         await _audioPlayer.setAsset(songFile);
//         await _audioPlayer.play();
//         setState(() {
//           _currentPlaying = songTitle;
//         });
//       } catch (e) {
//         print("Error playing song: $e");
//       }
//     }
//   }
//
//   @override
//   void dispose() {
//     _audioPlayer.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Songs'),
//         backgroundColor: Colors.teal,
//       ),
//       body: GridView.builder(
//         padding: const EdgeInsets.all(10),
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2, // Two tiles per row
//           mainAxisSpacing: 10,
//           crossAxisSpacing: 10,
//           childAspectRatio: 1, // Square tiles
//         ),
//         itemCount: songs.length,
//         itemBuilder: (context, index) {
//           final song = songs[index];
//           final isPlaying = _currentPlaying == song["title"];
//
//           return Container(
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage(song["image"]!),
//                 fit: BoxFit.cover,
//               ),
//               borderRadius: BorderRadius.circular(15),
//             ),
//             child: Card(
//               color: Colors.black.withOpacity(0.5),
//               elevation: 6,
//               margin: EdgeInsets.zero,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     song["title"] ?? "",
//                     style: const TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 16,
//                       color: Colors.white,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                   const SizedBox(height: 8),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       IconButton(
//                         icon: Icon(
//                           isPlaying ? Icons.pause_circle : Icons.play_circle,
//                           color: Colors.white,
//                           size: 30,
//                         ),
//                         onPressed: () =>
//                             playPauseSong(song["file"]!, song["title"]!),
//                       ),
//                       IconButton(
//                         icon: Icon(
//                           favoriteSongs.contains(song["title"])
//                               ? Icons.favorite
//                               : Icons.favorite_border,
//                           color: favoriteSongs.contains(song["title"])
//                               ? Colors.red
//                               : Colors.white,
//                           size: 30,
//                         ),
//                         onPressed: () => toggleFavorite(song["title"]!),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: 0,
//         selectedItemColor: Colors.teal,
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//           BottomNavigationBarItem(icon: Icon(Icons.album), label: 'Albums'),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.favorite), label: 'Favorites'),
//         ],
//         onTap: (index) {
//           if (index == 1) {
//             Navigator.push(context,
//                 MaterialPageRoute(builder: (context) => AlbumsScreen()));
//           } else if (index == 2) {
//             Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) =>
//                         FavoritesScreen(favoriteSongs: favoriteSongs)));
//           }
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:audio_session/audio_session.dart';
import 'package:rxdart/rxdart.dart';
import 'package:vibe_buzz1/albumscreen.dart';
import 'dart:math';

import 'package:vibe_buzz1/favouritescreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  final AudioPlayer _audioPlayer = AudioPlayer();
  final List<Map<String, String>> songs = [
    {
      "title": "MAN BHARAYA",
      "file": "assets/song1.mp3",
      "image": "assets/image1.jpg"
    },
    {
      "title": "AADAT",
      "file": "assets/song2.mp3",
      "image": "assets/image1.jpg"
    },
    {
      "title": "MILNE HAI MUJHSE AAI",
      "file": "assets/song3.mp3",
      "image": "assets/image1.jpg"
    },
    {
      "title": "ABAD KRDO",
      "file": "assets/song4.mp3",
      "image": "assets/image1.jpg"
    },
    {
      "title": "JANAY IS DIL KA HAAL",
      "file": "assets/song5.mp3",
      "image": "assets/image1.jpg"
    },
    {
      "title": "KRDO KARAM",
      "file": "assets/song6.mp3",
      "image": "assets/image1.jpg"
    },
    {
      "title": "KESARIYA",
      "file": "assets/song7.mp3",
      "image": "assets/image1.jpg"
    },
    {
      "title": "KUCH IS TRAH",
      "file": "assets/song8.mp3",
      "image": "assets/image1.jpg"
    },
  ];

  final Set<String> favoriteSongs = {};
  int? _currentIndex;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _init();
  }

  Future<void> _init() async {
    // Configure the audio session for music playback
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.music());

    // Listen to errors during playback
    _audioPlayer.playbackEventStream.listen(
      (event) {},
      onError: (Object e, StackTrace st) {
        print('A stream error occurred: $e');
      },
    );

    // Setup playlist
    final playlist = ConcatenatingAudioSource(
      children: songs.map((song) => AudioSource.asset(song["file"]!)).toList(),
    );

    try {
      await _audioPlayer.setAudioSource(playlist);
    } catch (e) {
      print("Error loading playlist: $e");
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      _audioPlayer.pause();
    }
  }

  // Play a specific song by index
  Future<void> playSong(int index) async {
    try {
      await _audioPlayer.seek(Duration.zero, index: index);
      await _audioPlayer.play();
      setState(() {
        _currentIndex = index;
      });
    } catch (e) {
      print("Error playing song: $e");
    }
  }

  // Toggle play/pause
  Future<void> togglePlayback() async {
    try {
      if (_audioPlayer.playing) {
        await _audioPlayer.pause();
      } else {
        await _audioPlayer.play();
      }
      setState(() {});
    } catch (e) {
      print("Error toggling playback: $e");
    }
  }

  // Skip to next song
  Future<void> playNext() async {
    try {
      if (_audioPlayer.hasNext) {
        await _audioPlayer.seekToNext();
        await _audioPlayer.play();
      }
    } catch (e) {
      print("Error playing next song: $e");
    }
  }

  // Skip to previous song
  Future<void> playPrevious() async {
    try {
      if (_audioPlayer.hasPrevious) {
        await _audioPlayer.seekToPrevious();
        await _audioPlayer.play();
      }
    } catch (e) {
      print("Error playing previous song: $e");
    }
  }

  // Toggle shuffle mode
  Future<void> toggleShuffle() async {
    try {
      final enabled = !_audioPlayer.shuffleModeEnabled;
      await _audioPlayer.setShuffleModeEnabled(enabled);
      setState(() {});
    } catch (e) {
      print("Error toggling shuffle: $e");
    }
  }

  // Toggle loop mode
  Future<void> toggleLoopMode() async {
    try {
      LoopMode nextMode;
      switch (_audioPlayer.loopMode) {
        case LoopMode.off:
          nextMode = LoopMode.all;
          break;
        case LoopMode.all:
          nextMode = LoopMode.one;
          break;
        case LoopMode.one:
          nextMode = LoopMode.off;
          break;
      }
      await _audioPlayer.setLoopMode(nextMode);
      setState(() {});
    } catch (e) {
      print("Error toggling loop mode: $e");
    }
  }

  void toggleFavorite(String songTitle) {
    setState(() {
      if (favoriteSongs.contains(songTitle)) {
        favoriteSongs.remove(songTitle);
      } else {
        favoriteSongs.add(songTitle);
      }
    });
  }

  Stream<Duration> get _positionStream => _audioPlayer.positionStream;
  Stream<Duration?> get _durationStream => _audioPlayer.durationStream;

  String formatDuration(Duration? duration) {
    if (duration == null) return '--:--';
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Songs'),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            icon: Icon(_audioPlayer.shuffleModeEnabled
                ? Icons.shuffle_on_outlined
                : Icons.shuffle),
            onPressed: toggleShuffle,
          ),
          IconButton(
            icon: Icon(_audioPlayer.loopMode == LoopMode.off
                ? Icons.repeat
                : _audioPlayer.loopMode == LoopMode.one
                    ? Icons.repeat_one
                    : Icons.repeat_on),
            onPressed: toggleLoopMode,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1,
              ),
              itemCount: songs.length,
              itemBuilder: (context, index) {
                final song = songs[index];
                final isPlaying =
                    _currentIndex == index && _audioPlayer.playing;

                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(song["image"]!),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Card(
                    color: Colors.black.withOpacity(0.5),
                    elevation: 6,
                    margin: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          song["title"] ?? "",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              icon: Icon(
                                isPlaying
                                    ? Icons.pause_circle
                                    : Icons.play_circle,
                                color: Colors.white,
                                size: 30,
                              ),
                              onPressed: () {
                                if (_currentIndex == index) {
                                  togglePlayback();
                                } else {
                                  playSong(index);
                                }
                              },
                            ),
                            IconButton(
                              icon: Icon(
                                favoriteSongs.contains(song["title"])
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: favoriteSongs.contains(song["title"])
                                    ? Colors.red
                                    : Colors.white,
                                size: 30,
                              ),
                              onPressed: () => toggleFavorite(song["title"]!),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          // Playback controls and progress bar
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.blueGrey,
            child: Column(
              children: [
                StreamBuilder<Duration>(
                  stream: _positionStream,
                  builder: (context, snapshot) {
                    final position = snapshot.data ?? Duration.zero;
                    return StreamBuilder<Duration?>(
                      stream: _durationStream,
                      builder: (context, snapshot) {
                        final duration = snapshot.data ?? Duration.zero;
                        return Column(
                          children: [
                            Slider(
                              value: position.inMilliseconds.toDouble(),
                              max: duration.inMilliseconds.toDouble(),
                              onChanged: (value) {
                                _audioPlayer.seek(
                                  Duration(milliseconds: value.toInt()),
                                );
                              },
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(formatDuration(position)),
                                  Text(formatDuration(duration)),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.skip_previous, size: 32),
                      onPressed: playPrevious,
                    ),
                    StreamBuilder<bool>(
                      stream: _audioPlayer.playingStream,
                      builder: (context, snapshot) {
                        final isPlaying = snapshot.data ?? false;
                        return IconButton(
                          icon: Icon(
                            isPlaying ? Icons.pause_circle : Icons.play_circle,
                            size: 48,
                          ),
                          onPressed: togglePlayback,
                        );
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.skip_next, size: 32),
                      onPressed: playNext,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.teal,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.album), label: 'Albums'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorites'),
        ],
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AlbumsScreen()),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      FavoritesScreen(favoriteSongs: favoriteSongs)),
            );
          }
        },
      ),
    );
  }
}
