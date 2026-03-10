import 'package:flutter/material.dart';
import '../sections/hero_section.dart';
import '../sections/about_section.dart';
import '../sections/skills_section.dart';
import '../sections/projects_section.dart';
import '../sections/experience_section.dart';
import '../sections/contact_section.dart';
import '../sections/education_section.dart';
import '../widgets/animated_background.dart';
import '../widgets/glass_nav_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 1. Animated Background Layer
          const AnimatedBackground(),

          // 2. Scrollable Content Layer
          ListView(
            children: const [
              HeroSection(),
              AboutSection(),
              ExperienceSection(),
              SkillsSection(),
              ProjectsSection(),
              EducationSection(),
              ContactSection(),
            ],
          ),

          // 3. Floating Navigation Bar Layer
          const Positioned(
            top: 40,
            left: 0,
            right: 0,
            child: Center(
              child: GlassNavBar(),
            ),
          ),
        ],
      ),
    );
  }
}
