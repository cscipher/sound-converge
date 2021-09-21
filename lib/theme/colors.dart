import 'package:flutter/material.dart';

final Color primaryColor = Colors.blue;
final Color white = Colors.white;
final Color accent = Colors.grey;
final Color spotifyDefault = Color(0xFF1DB954);

final LinearGradient lg = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment(0.8, 0.0), // 10% of the width, so there are ten blinds.
  colors: <Color>[
    Color(0xffffffff),
    Color(0xfffa57c1),
    Color(0xffb166cc),
    Color(0xff7572ff),
    Color(0xff69a6f9)
  ], // red to yellow // repeats the gradient over the canvas
);

final Color ytMusicDefault = Color(0xffc3352e);
final Color gaanaDefault = Colors.orange.shade900;
final Color wynkDefault = Colors.red;
