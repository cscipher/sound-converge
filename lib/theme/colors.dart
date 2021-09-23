import 'package:flutter/material.dart';

final Color lightPrimaryColor = Color(0xff3CD3AD);
final Color darkPrimaryColor = Color(0xff3CD3AD);
final Color lightBgColor = Colors.white;
final Color darkBgColor = Colors.black87;
final Color lightAccent = Color(0xff3CD3AD).withOpacity(0.3);
final Color darkAccent = Color(0xff3CD3AD).withOpacity(0.7);
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

final LinearGradient lg1 = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment(0.8, 0.0), // 10% of the width, so there are ten blinds.
  colors: <Color>[
    Color(0xff4CB8C4),
    Color(0xff3CD3AD),
  ], // red to yellow // repeats the gradient over the canvas
);

final Color ytMusicDefault = Color(0xffc3352e);
final Color gaanaDefault = Colors.orange.shade900;
final Color wynkDefault = Colors.red;
