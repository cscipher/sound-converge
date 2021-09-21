import 'package:flutter/material.dart';
import 'package:soundconverge/models/chat.model.dart';
import 'package:soundconverge/models/chatData.dart';
import 'package:soundconverge/screens/widgets/buttons.dart';
import 'package:soundconverge/theme/colors.dart';

bool usrSending(entry) => entry.sid == 'usr';
bool urlExists(String url) => url != null && url.isNotEmpty;

Widget botChatList(size) => ListView.builder(
      itemCount: chatdata.length,
      itemBuilder: (ctx, i) {
        BotChat entry = chatdata[i];
        return Container(
          width: 10,
          decoration: BoxDecoration(
              color: usrSending(entry)
                  ? primaryColor.withAlpha(130)
                  : primaryColor.withAlpha(50),
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(entry.coverImgUrl))),
          alignment: usrSending(entry) ? Alignment.topRight : Alignment.topLeft,
          constraints: BoxConstraints(maxWidth: size.width * 0.75),
          margin: const EdgeInsets.all(7),
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Text(
                entry.message,
                style: TextStyle(
                    color: urlExists(entry.coverImgUrl) ? white : Colors.black),
              ),
              Wrap(
                children: [
                  if (urlExists(entry.spotifyUrl))
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: spotifyBtn(() {}),
                    ),
                  if (urlExists(entry.ytMusicUrl))
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: ytMusicBtn(() {}),
                    ),
                  if (urlExists(entry.gaanaUrl))
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: gaanaBtn(() {}),
                    ),
                  if (urlExists(entry.wynkUrl))
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: wynkBtn(() {}),
                    ),
                ],
              )
            ],
          ),
        );
      },
    );
