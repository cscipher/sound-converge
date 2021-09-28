import 'package:url_launcher/url_launcher.dart';

openNativeApp(String url) async {
  final bool canOpen = await canLaunch(url);
  print(canOpen);
  if (canOpen) {
    await launch(url, universalLinksOnly: true);
  } else {
    await launch(url, forceWebView: true);
  }
}
