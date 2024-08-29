import 'dart:developer';
import 'package:url_launcher/url_launcher.dart';

class ContactUs {
  static void sendWhatsappMessage(String whatsappNumber) async {
    var whatsappUrl = "whatsapp://send?phone=$whatsappNumber&text=${Uri.encodeComponent("Hello")}";
    try {
      await launchUrl(Uri.parse(whatsappUrl));
    } catch (e) {
      //To handle error and display error message
      log("Unable to open whatsapp");
    }
  }

  static void launchEmailSubmission(String email) async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: email,
    );
    String url = params.toString();
    await launchUrl(Uri.parse(url));
  }

  static void launchWebsite(String url) async {
    await launchUrl(Uri.parse(url));
  }
}
