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
import '../../core/utils/responsive.dart';
import 'package:provider/provider.dart';
import '../../core/providers/home_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = context.read<HomeProvider>();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: Responsive.isMobile(context)
          ? AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              iconTheme: IconThemeData(
                color: Theme.of(context).textTheme.bodyLarge?.color ?? Colors.black,
              ),
            )
          : null,
      drawer: Responsive.isMobile(context)
          ? Drawer(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor.withValues(alpha: 0.95),
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
                children: ['Home', 'About', 'Experience', 'Skills', 'Projects', 'Education', 'Contact'].map((item) {
                  return ListTile(
                    title: Text(
                      item,
                      style: TextStyle(
                        fontSize: 18, 
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).textTheme.bodyLarge?.color,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context); // close drawer
                      homeProvider.scrollToSection(item);
                    },
                  );
                }).toList(),
              ),
            )
          : null,
      body: Stack(
        children: [
          // 1. Animated Background Layer
          const AnimatedBackground(),

          // 2. Scrollable Content Layer
          SingleChildScrollView(
            controller: homeProvider.scrollController,
            child: Column(
              children: [
                HeroSection(key: homeProvider.heroKey),
                AboutSection(key: homeProvider.aboutKey),
                ExperienceSection(key: homeProvider.experienceKey),
                SkillsSection(key: homeProvider.skillsKey),
                ProjectsSection(key: homeProvider.projectsKey),
                EducationSection(key: homeProvider.educationKey),
                ContactSection(key: homeProvider.contactKey),
              ],
            ),
          ),

          // 3. Floating Navigation Bar Layer
          if (!Responsive.isMobile(context))
            Positioned(
              top: 40,
              left: 0,
              right: 0,
              child: Center(
                child: GlassNavBar(onNavSelected: homeProvider.scrollToSection),
              ),
            ),
        ],
      ),
    );
  }
}
