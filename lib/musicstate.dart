import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project/release_model.dart';
import 'dart:convert';
import 'artist_model.dart';
import 'databasehelper.dart';


class MusicProvider with ChangeNotifier {
  List<Album> _albums = [];
  List<Artist> _artists = [];
  List<Album> _savedAlbums = [];
  String _errorMessage = '';
  bool _isLoading = false;

  List<Album> get albums => _albums;
  List<Artist> get artists => _artists;
  List<Album> get savedAlbums => _savedAlbums;
  String get errorMessage => _errorMessage;
  bool get isLoading => _isLoading;

  MusicProvider() {
    //fetchArtistData();
    fetchAlbumData();
    loadSavedAlbums();
  }

  // Future<void> fetchArtistData() async {
  //   final url = 'https://www.theaudiodb.com/api/v1/json/2/album.php?i=112024';
  //
  //   _isLoading = true;
  //   _errorMessage = '';
  //   notifyListeners();
  //
  //   try {
  //     final response = await http.get(Uri.parse(url));
  //     if (response.statusCode == 200) {
  //       final data = json.decode(response.body);
  //       final artists = (data['album'] as List).map((e) => Artist.fromJson(e)).toList();
  //       _artists = artists;
  //     } else {
  //       _errorMessage = 'Failed to load artist data';
  //     }
  //   } catch (error, stackTrace) {
  //     _errorMessage = 'An error occurred: $error';
  //     print('Error fetching artist data: $error');
  //     print('Stack trace: $stackTrace');
  //   } finally {
  //     _isLoading = false;
  //     notifyListeners();
  //   }
  // }

  Future<void> fetchAlbumData() async {
    final url = 'https://www.theaudiodb.com/api/v1/json/2/album.php?i=112024';

    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final albums = (data['album'] as List).map((e) => Album.fromJson(e)).toList();
        _albums = albums;
      } else {
        _errorMessage = 'Failed to load album data';
      }
    } catch (error, stackTrace) {
      _errorMessage = 'An error occurred: $error';
      print('Error fetching album data: $error');
      print('Stack trace: $stackTrace');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadSavedAlbums() async {
    try {
      _savedAlbums = await DatabaseHelper.instance.getSavedAlbums();
      notifyListeners();
    } catch (error, stackTrace) {
      _errorMessage = 'Failed to load saved albums: $error';
      print('Error loading saved albums: $error');
      print('Stack trace: $stackTrace');
    }
  }

  Future<void> saveAlbum(Album album) async {
    try {
      await DatabaseHelper.instance.insertAlbum(album);
      loadSavedAlbums();
    } catch (error, stackTrace) {
      _errorMessage = 'Failed to save album: $error';
      print('Error saving album: $error');
      print('Stack trace: $stackTrace');
    }
  }

  Future<void> removeAlbum(Album album) async {
    try {
      await DatabaseHelper.instance.deleteAlbum(album.id!);
      loadSavedAlbums();
    } catch (error, stackTrace) {
      _errorMessage = 'Failed to remove album: $error';
      print('Error removing album: $error');
      print('Stack trace: $stackTrace');
    }
  }
}