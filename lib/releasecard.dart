import 'package:flutter/material.dart';
class ReleaseCard extends StatelessWidget {
  final String id;
  final String title;
  final String artist;
  final String thumb;
  final String previewUrl;

  ReleaseCard({
    required this.id,
    required this.title,
    required this.artist,
    required this.thumb,
    required this.previewUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            color: Colors.grey[850],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(thumb),
                 SizedBox(height: 10,),
                 Text(
                    title,
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                SizedBox(height: 5,),
                 Text(
                    artist,
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}