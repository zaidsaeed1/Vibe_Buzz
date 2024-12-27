class Track {
  final String id;
  final String name;
  final String artist;
  final String albumArt;
  final String? album;
  final int duration;

  Track({
    required this.id,
    required this.name,
    required this.artist,
    required this.albumArt,
    this.album,
    required this.duration,
  });

  // Convert a Track object to a Map (used for inserting into the DB)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'artist': artist,
      'albumArt': albumArt,
      'album': album,
      'duration': duration,
    };
  }

  // Convert a Map into a Track object (used for fetching from the DB)
  static Track fromJson(Map<String, dynamic> json) {
    return Track(
      id: json['id'],
      name: json['name'],
      artist: json['artist'],
      albumArt: json['albumArt'],
      album: json['album'],
      duration: json['duration'],
    );
  }
}
