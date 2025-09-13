import 'package:url_launcher/url_launcher.dart';

class LinkTool {
  static Future<void> openLink(String url) async {
      final Uri uri = Uri.parse(url);
      if (!await launchUrl(
        uri,
        mode: LaunchMode.externalApplication, // 👈 trên web = mở tab mới
      )) {
        throw Exception("Không mở được link: $url");
      }
    }
  
  static String getLinkDomain(String pImageName) {
    return "https://github.com/vishagna/portfolio/resources/$pImageName";
  }
}