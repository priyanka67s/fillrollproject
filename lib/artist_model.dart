class Artist {
  final String id;
  final String name;
  final String thumb;

  Artist({
    required this.id,
    required this.name,
    required this.thumb,
  });

  factory Artist.fromJson(Map<String, dynamic> json) {
    return Artist(
      id: json['idArtist'],
      name: json['strArtist'],
      thumb: json['strArtistThumb'] ?? '',
    );
  }
}