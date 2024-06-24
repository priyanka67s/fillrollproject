import 'package:flutter/material.dart';
import 'package:project/release_model.dart';
import 'package:provider/provider.dart';

import 'homescreen.dart';
import 'musicstate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) =>MusicProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.black,
          textTheme: Theme
              .of(context)
              .textTheme
              .apply(
              bodyColor: Colors.white,
              displayColor: Colors.white

          ),

          useMaterial3: true,
        ),
        home: HomeScreen(),
      ),
    );
  }
}