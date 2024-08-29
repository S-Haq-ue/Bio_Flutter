import 'package:flutter/material.dart';
import 'package:haq_wt_u_nd_2_know/services/datas.dart';
import 'package:haq_wt_u_nd_2_know/widgets/contact_us.dart';

class ContactDetails extends StatelessWidget {
  final double screenSize;
  const ContactDetails({
    super.key,
    required this.screenSize,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: screenSize),
      child: Wrap(
        children: [
          for (int i = 0; i < contact.length; i++)
            Padding(
              padding: const EdgeInsets.all(2),
              child: SizedBox(
                width: 250,
                child: ListTile(
                  leading: SizedBox(
                    height: 20,
                    width: 20,
                    child: contact[i]["logo"],
                  ),
                  title: Text(
                    contact[i]["id"],
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    if (i == 0) {
                      ContactUs.launchEmailSubmission(contact[i]["url"]);
                    } else if (i == contact.length - 1) {
                      ContactUs.sendWhatsappMessage(contact[i]["url"]);
                    } else {
                      ContactUs.launchWebsite(contact[i]["url"]);
                    }
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}
