import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:soundconverge/theme/colors.dart';

ButtonStyle style(color) => ButtonStyle(
      padding: MaterialStateProperty.all<EdgeInsets>(
          EdgeInsets.symmetric(horizontal: 10, vertical: 0)),
      backgroundColor: MaterialStateProperty.all<Color>(color),
      foregroundColor: MaterialStateProperty.all<Color>(white),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
    );

Widget platformBtn({onPressed, color, label, icon}) => TextButton(
    onPressed: onPressed,
    style: style(color),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        FaIcon(
          icon,
          size: 20,
        ),
        SizedBox(
          width: 10,
        ),
        Text(label)
      ],
    ));

Widget spotifyBtn(onPressed) => platformBtn(
    onPressed: onPressed,
    color: spotifyDefault,
    label: 'Spotify',
    icon: FontAwesomeIcons.spotify);

Widget ytMusicBtn(onPressed) => platformBtn(
    onPressed: onPressed,
    color: ytMusicDefault,
    icon: FontAwesomeIcons.youtube,
    label: 'YT Music');

Widget gaanaBtn(onPressed) => platformBtn(
    onPressed: onPressed,
    color: gaanaDefault,
    icon: FontAwesomeIcons.music,
    label: 'Gaana');

Widget wynkBtn(onPressed) => platformBtn(
    onPressed: onPressed,
    color: wynkDefault,
    icon: FontAwesomeIcons.music,
    label: 'Wynk');
