class Album {
  final String id;
  final String title;
  final String artist;
  final String thumb;
  final String previewUrl;

  Album({
    required this.id,
    required this.title,
    required this.artist,
    required this.thumb,
    required this.previewUrl,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['idAlbum'],
      title: json['strAlbum'],
      artist: json['strArtist'],
      thumb: json['strAlbumThumb'] ?? '',
      previewUrl: json['strPreview'] ?? '',
    );
  }
}
