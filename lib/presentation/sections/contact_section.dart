import 'package:flutter/material.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 800,
      alignment: Alignment.center,
      child: Text(
        "Contact Section Placeholder",
        style: Theme.of(context).textTheme.displayMedium,
      ),
    );
  }
}
