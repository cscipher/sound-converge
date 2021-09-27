import 'package:flutter/material.dart';
import 'package:soundconverge/models/chat.model.dart';
import 'package:soundconverge/screens/widgets/buttons.dart';

bool usrSending(entry) => entry.sid == 'usr';
bool urlExists(String? url) => url != null && url.isNotEmpty;
MusicButtons _mb = MusicButtons();

Widget botChatList(size, data, theme) => ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: data.length,
      shrinkWrap: true,
      itemBuilder: (ctx, i) {
        BotChat entry = data[i];
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: usrSending(entry)
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
          children: [
            if (!usrSending(entry))
              Padding(
                padding: const EdgeInsets.only(left: 5, top: 7),
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/bot.png'),
                  radius: 15,
                ),
              ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: usrSending(entry)
                      ? theme.primaryColor
                      : theme.primaryColor.withAlpha(50),
                  image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.7), BlendMode.darken),
                      fit: BoxFit.cover,
                      image: NetworkImage(urlExists(entry.coverImgUrl)
                          ? entry.coverImgUrl!
                          : ''))),
              constraints: BoxConstraints(maxWidth: size.width * 0.6),
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    entry.message,
                    style: TextStyle(
                        fontSize: 16,
                        color: urlExists(entry.coverImgUrl) || usrSending(entry)
                            ? Colors.white
                            : theme.textTheme.headline1.color),
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
          ],
        );
      },
    );
