import 'package:flutter/material.dart';
import 'package:soundconverge/models/chat.model.dart';
import 'package:soundconverge/models/chatData.dart';
import 'package:soundconverge/theme/colors.dart';


bool usrSending(entry) => entry.sid == 'usr';


Widget botChatList(size) => ListView.builder(
      itemCount: chatdata.length,
      itemBuilder: (ctx, i) {
        BotChat entry = chatdata[i];
        return Container(
          width: 10,
          color: usrSending(entry)
              ? primaryColor.withAlpha(130)
              : primaryColor.withAlpha(50),
          alignment: usrSending(entry) ? Alignment.topRight : Alignment.topLeft,
          constraints: BoxConstraints(maxWidth: size.width * 0.75),
          margin: const EdgeInsets.all(7),
          padding: const EdgeInsets.all(15),
          child: Text(entry.message!),
        );
      },
    );
