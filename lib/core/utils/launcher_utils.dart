import 'package:url_launcher/url_launcher.dart';

class LauncherUtils {
  static to(String uri) async {
    await launchUrl(Uri.parse(uri));
  }
}
