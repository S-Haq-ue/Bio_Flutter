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
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  
  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _educationKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void _scrollToSection(String section) {
    GlobalKey? targetKey;
    switch (section) {
      case 'Home':
        targetKey = _heroKey;
        break;
      case 'About':
        targetKey = _aboutKey;
        break;
      case 'Skills':
        targetKey = _skillsKey;
        break;
      case 'Projects':
        targetKey = _projectsKey;
        break;
      case 'Experience':
        targetKey = _experienceKey;
        break;
      case 'Education':
        targetKey = _educationKey;
        break;
      case 'Contact':
        targetKey = _contactKey;
        break;
    }

    if (targetKey != null && targetKey.currentContext != null) {
      Scrollable.ensureVisible(
        targetKey.currentContext!,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                      _scrollToSection(item);
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
            controller: _scrollController,
            child: Column(
              children: [
                HeroSection(key: _heroKey),
                AboutSection(key: _aboutKey),
                ExperienceSection(key: _experienceKey),
                SkillsSection(key: _skillsKey),
                ProjectsSection(key: _projectsKey),
                EducationSection(key: _educationKey),
                ContactSection(key: _contactKey),
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
                child: GlassNavBar(onNavSelected: _scrollToSection),
              ),
            ),
        ],
      ),
    );
  }
}
