import 'package:flutter/material.dart';
import 'package:soundconverge/models/chat.model.dart';
import 'package:soundconverge/screens/widgets/buttons.dart';
import 'package:soundconverge/services/deepLink.dart';

bool usrSending(entry) => entry.sid == 'usr';
bool urlExists(String? url) => url != null && url.isNotEmpty;
MusicButtons _mb = MusicButtons();

Widget botChatList(size, data, theme) => ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: data.length,
      shrinkWrap: true,
      itemBuilder: (ctx, i) {
        BotChat entry = data[i];
        return Container(
          margin: EdgeInsets.symmetric(vertical: 2),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: usrSending(entry)
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            children: [
              if (!usrSending(entry))
                Padding(
                  padding: const EdgeInsets.only(left: 12, top: 7),
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
                margin: const EdgeInsets.fromLTRB(7, 3, 12, 3),
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      entry.message,
                      style: TextStyle(
                          fontSize: 16,
                          color:
                              urlExists(entry.coverImgUrl) || usrSending(entry)
                                  ? Colors.white
                                  : theme.textTheme.headline1.color),
                    ),
                    // SizedBox(height: 5),
                    Wrap(
                      children: [
                        if (urlExists(entry.spotifyUrl))
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: _mb.spotifyBtn(
                                () => openNativeApp(entry.spotifyUrl!)),
                          ),
                        if (urlExists(entry.ytMusicUrl))
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: _mb.ytMusicBtn(
                                () => openNativeApp(entry.ytMusicUrl!)),
                          ),
                        if (urlExists(entry.gaanaUrl))
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: _mb
                                .gaanaBtn(() => openNativeApp(entry.gaanaUrl!)),
                          ),
                        if (urlExists(entry.jioSaavanUrl))
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: _mb.jioSaavanBtn(
                                () => openNativeApp(entry.jioSaavanUrl!)),
                          ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
