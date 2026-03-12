import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  final ScrollController scrollController = ScrollController();
  
  final GlobalKey heroKey = GlobalKey();
  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey experienceKey = GlobalKey();
  final GlobalKey skillsKey = GlobalKey();
  final GlobalKey projectsKey = GlobalKey();
  final GlobalKey educationKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  void scrollToSection(String section) {
    GlobalKey? targetKey;
    switch (section) {
      case 'Home':
        targetKey = heroKey;
        break;
      case 'About':
        targetKey = aboutKey;
        break;
      case 'Skills':
        targetKey = skillsKey;
        break;
      case 'Projects':
        targetKey = projectsKey;
        break;
      case 'Experience':
        targetKey = experienceKey;
        break;
      case 'Education':
        targetKey = educationKey;
        break;
      case 'Contact':
        targetKey = contactKey;
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
    scrollController.dispose();
    super.dispose();
  }
}
