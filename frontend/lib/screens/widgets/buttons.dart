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

  Widget _platformBtn(
          {onPressed, color, label, icon, bg = Colors.white, ic = null}) =>
      TextButton(
          onPressed: onPressed,
          style: _style(color, bg),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null)
                ic == null
                    ? FaIcon(
                        icon,
                        size: 20,
                      )
                    : ic,
              if (icon != null)
                SizedBox(
                  width: 7,
                ),
              Text(
                label,
                style: TextStyle(fontWeight: FontWeight.w500),
              )
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
      onPressed: onPressed,
      color: Colors.white,
      bg: gaanaDefault,
      label: 'Gaana');

  Widget jioSaavanBtn(onPressed) => _platformBtn(
      onPressed: onPressed,
      color: jioSaavanDefault,
      icon: 'temp',
      ic: Tab(
          icon: Image.asset('assets/images/jio-saavan.png',
              height: 30, width: 30)),
      label: 'Jio Saavn');

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
                  color: Colors.white,
                ),
                SizedBox(width: 5),
                Text(
                  'Music',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                )
              ],
            ),
          ),
        ),
      );
}
