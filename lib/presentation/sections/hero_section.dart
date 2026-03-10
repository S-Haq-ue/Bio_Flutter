import 'package:flutter/material.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Hi, I'm Haq",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 24),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Text(
            "A Flutter Developer.",
            style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 64),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Text(
            "Building beautiful, high-performance apps across all platforms.",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 24),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
