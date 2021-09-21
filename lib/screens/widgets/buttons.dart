import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:soundconverge/theme/colors.dart';

class MusicButtons {
  ButtonStyle _style(color, bg) => ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(
            EdgeInsets.symmetric(horizontal: 10, vertical: 0)),
        backgroundColor: MaterialStateProperty.all<Color>(color),
        foregroundColor: MaterialStateProperty.all<Color>(bg),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
      );

  Widget _platformBtn({onPressed, color, label, icon, bg = Colors.white}) =>
      TextButton(
          onPressed: onPressed,
          style: _style(color, bg),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null)
                FaIcon(
                  icon,
                  size: 20,
                ),
              if (icon != null)
                SizedBox(
                  width: 7,
                ),
              Text(label)
            ],
          ));

  Widget spotifyBtn(onPressed) => _platformBtn(
      onPressed: onPressed,
      color: spotifyDefault,
      label: 'Spotify',
      icon: FontAwesomeIcons.spotify);

  Widget ytMusicBtn(onPressed) => _platformBtn(
      onPressed: onPressed,
      color: ytMusicDefault,
      icon: FontAwesomeIcons.youtube,
      label: 'Music');

  Widget gaanaBtn(onPressed) => _platformBtn(
      onPressed: onPressed, color: white, bg: gaanaDefault, label: 'Gaana');

  Widget wynkBtn(onPressed) => _platformBtn(
      onPressed: onPressed,
      color: wynkDefault,
      icon: FontAwesomeIcons.music,
      label: 'Wynk');

  Widget appleMusicBtn(onPressed) => InkWell(
        onTap: onPressed,
        child: Container(
          width: 85,
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
          decoration: BoxDecoration(
              gradient: lg, borderRadius: BorderRadius.circular(30)),
          child: Material(
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FaIcon(
                  FontAwesomeIcons.apple,
                  color: white,
                ),
                SizedBox(width: 5),
                Text(
                  'Music',
                  style: TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w600, color: white),
                )
              ],
            ),
          ),
        ),
      );
}
