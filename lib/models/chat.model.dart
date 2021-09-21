import 'package:flutter/material.dart';

class BotChat {
  final String message;
  final String sid;
  final String rid;
  final String spotifyUrl;
  final String gaanaUrl;
  final String wynkUrl;
  final String appleMusicUrl;
  final String ytMusicUrl;
  final String coverImgUrl;

  BotChat(
      {this.message = '',
      this.rid = 'bid',
      this.sid = 'usr',
      this.coverImgUrl = '',
      this.spotifyUrl = '',
      this.appleMusicUrl = '',
      this.gaanaUrl = '',
      this.wynkUrl = '',
      this.ytMusicUrl = ''});
}
