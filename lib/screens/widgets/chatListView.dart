import 'package:flutter/material.dart';
import 'package:soundconverge/models/chat.model.dart';
import 'package:soundconverge/screens/widgets/buttons.dart';
import 'package:soundconverge/theme/colors.dart';

bool usrSending(entry) => entry.sid == 'usr';
bool urlExists(String url) => url != null && url.isNotEmpty;
MusicButtons _mb = MusicButtons();

Widget botChatList(size, data) => ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: data.length,
      shrinkWrap: true,
      itemBuilder: (ctx, i) {
        BotChat entry = data[i];
        return Align(
          alignment: usrSending(entry) ? Alignment.topRight : Alignment.topLeft,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: usrSending(entry)
                    ? primaryColor.withAlpha(130)
                    : primaryColor.withAlpha(50),
                image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.7), BlendMode.darken),
                    fit: BoxFit.cover,
                    image: NetworkImage(entry.coverImgUrl))),
            constraints: BoxConstraints(maxWidth: size.width * 0.70),
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  entry.message,
                  style: TextStyle(
                      color:
                          urlExists(entry.coverImgUrl) ? white : Colors.black),
                ),
                SizedBox(height: 5),
                Wrap(
                  children: [
                    if (urlExists(entry.spotifyUrl))
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: _mb.spotifyBtn(() {}),
                      ),
                    if (urlExists(entry.appleMusicUrl))
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 6),
                        child: _mb.appleMusicBtn(() {}),
                      ),
                    if (urlExists(entry.ytMusicUrl))
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: _mb.ytMusicBtn(() {}),
                      ),
                    if (urlExists(entry.gaanaUrl))
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: _mb.gaanaBtn(() {}),
                      ),
                    if (urlExists(entry.wynkUrl))
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: _mb.wynkBtn(() {}),
                      ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
