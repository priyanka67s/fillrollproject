import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:audioplayers/audioplayers.dart';
import 'artistcard.dart';
import 'musicstate.dart';
import 'mymusic.dart';


class HomeScreen extends StatelessWidget {
  final AudioPlayer _audioPlayer = AudioPlayer();

  void _playPreview(String url) {
    _audioPlayer.play(UrlSource(url));
  }

  void _stopPreview() {
    _audioPlayer.stop();
  }

  @override
  Widget build(BuildContext context) {
    final musicProvider = Provider.of<MusicProvider>(context);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white30,
              child: Icon(Icons.person, color: Colors.white),
            ),
            SizedBox(width: 10),
            Center(child: Text('Hi John')),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Artists for you',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Chip(
                  label: Text('Relax'),
                  backgroundColor: Colors.grey[800],
                ),
                SizedBox(width: 10),
                Chip(
                  label: Text('Party'),
                  backgroundColor: Colors.grey[800],
                ),
                SizedBox(width: 10),
                Chip(
                  label: Text('Work out'),
                  backgroundColor: Colors.grey[800],
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Artists for you',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'View all',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            musicProvider.isLoading
                ? Center(child: CircularProgressIndicator())
                : Expanded(
              child: ArtistCard(
                artistName: 'The Weeknd',
                listeners: '100M listeners',
                imageUrl: 'data:image/jpeg;base64,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',
              ),
              ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'New releases',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Play all',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            musicProvider.isLoading
                ? Center(child: CircularProgressIndicator())
                : Expanded(
              child: ListView.builder(
                itemCount: musicProvider.albums.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final album = musicProvider.albums[index];
                  return GestureDetector(
                    onTap: () => _playPreview(album.previewUrl),
                    onDoubleTap: () {
                      musicProvider.saveAlbum(album);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Saved to My Music'),
                      ));
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey,
                      ),
                      child: Card(
                        //color: Colors.black,
                        child: Column(
                          crossAxisAlignment:CrossAxisAlignment.center ,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.network(album.thumb,fit: BoxFit.fill,
                            height: 80,width: 80,),
                            Text(album.title, style: TextStyle(color: Colors.white)),
                            SizedBox(height: 5,),
                            Text(album.artist, style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.red,
        currentIndex: 0,
        onTap: (index) {
          if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyMusicScreen()),
            );
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_music),
            label: 'My Music',
          ),
        ],
      ),
    );
  }
}