import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'musicstate.dart';
import 'package:audioplayers/audioplayers.dart';
class MyMusicScreen extends StatelessWidget {
  final AudioPlayer _audioPlayer = AudioPlayer();

  void _playPreview(String url) {
    _audioPlayer.play(UrlSource(url));
  }


  @override
  Widget build(BuildContext context) {

    final musicProvider = Provider.of<MusicProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('My Music'),
      ),
      body: ListView.builder(
        itemCount: musicProvider.savedAlbums.length,
        itemBuilder: (context, index) {
          final Album = musicProvider.savedAlbums[index];
          return ListTile(
            leading: Image.network(Album.thumb),
            title: Text(Album.title),
            subtitle: Text(Album.artist),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => musicProvider.removeAlbum(Album),
            ),
            onTap: () => _playPreview(Album.previewUrl),
          );
        },
      ),
    );
  }
}