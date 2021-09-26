class BotChat {
  final String message;
  String sid;
  String rid;
  String? spotifyUrl;
  String? gaanaUrl;
  String? wynkUrl;
  String? appleMusicUrl;
  String? ytMusicUrl;
  String? coverImgUrl;

  BotChat({
    required this.message,
    this.rid = 'bid',
    this.sid = 'usr',
    this.coverImgUrl,
    this.spotifyUrl,
    this.appleMusicUrl,
    this.gaanaUrl,
    this.wynkUrl,
    this.ytMusicUrl,
  });

  factory BotChat.fromJson(Map<String, dynamic> json) {
    return BotChat(message: json['message']);
  }
}
