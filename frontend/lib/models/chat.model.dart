class BotChat {
  final String message;
  String sid;
  String rid;
  String? spotifyUrl;
  String? gaanaUrl;
  String? appleMusicUrl;
  String? ytMusicUrl;
  String? jioSaavanUrl;
  String? coverImgUrl;

  BotChat({
    required this.message,
    this.rid = 'bid',
    this.sid = 'usr',
    this.coverImgUrl,
    this.spotifyUrl,
    this.jioSaavanUrl,
    this.appleMusicUrl,
    this.gaanaUrl,
    this.ytMusicUrl,
  });

  factory BotChat.fromJson(Map<String, dynamic> json) {
    return BotChat(
      message: json['message'],
      spotifyUrl: json['spotifyUrl'],
      jioSaavanUrl: json['jioSaavanUrl'],
      ytMusicUrl: json['ytMusicUrl'],
      gaanaUrl: json['gaanaUrl'],
      rid: 'usr',
      sid: 'bid',
    );
  }
}


/**
 * {
  "message": "I've found some results...",
  "spotifyUrl": "....",
  "jioSaavanUrl": "....",
  "youtubeMusicUrl": "....",
  "gaanaUrl": "..."
}
 */