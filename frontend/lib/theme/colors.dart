import 'package:flutter/material.dart';

final Color lightPrimaryColor = Color(0xffFF3366);
final Color darkPrimaryColor = Color(0xffFF3366);
final Color lightBgColor = Color(0xffF6F7F8);
final Color darkBgColor = Color(0xff011627);
final Color lightAccent = lightPrimaryColor.withOpacity(0.3);
final Color darkAccent = darkPrimaryColor.withOpacity(0.7);
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
