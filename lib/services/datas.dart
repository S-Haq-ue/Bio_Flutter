import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

List<String> navBarItems = [
  "Profile",
  "Skills",
  "Projects",
  "Education",
  "Contact",
  "About",
];

List<Map> skills = [
  {
    "name": "Flutter",
    "logo": const Image(image: AssetImage('assets/images/flutter.png')),
  },
  {
    "name": "Firebase",
    "logo": const Image(image: AssetImage('assets/images/firebase.png')),
  },
  {
    "name": "HTML",
    "logo": const Image(image: AssetImage('assets/images/html5.png')),
  },
  {
    "name": "CSS",
    "logo": const Image(image: AssetImage('assets/images/css3.png')),
  },
  {
    "name": "javaScript",
    "logo": const Image(image: AssetImage('assets/images/javascript.png')),
  },
  {
    "name": "java",
    "logo": const Image(image: AssetImage('assets/images/java.png')),
  },
  {
    "name": "python",
    "logo": const Image(image: AssetImage('assets/images/python.png')),
  },
  {
    "name": "Burp Suit",
    "logo": const Image(image: AssetImage('assets/images/burp_suit.png')),
  }
];

List<Map> skillsPlatform = [
  {
    "name": "Android Developer",
    "logo": const Image(image: AssetImage('assets/images/android.png')),
  },
  {
    "name": "iOS Developer",
    "logo": const Icon(Bootstrap.apple, size: 20,color: Colors.white54,),
  },
  {
    "name": "Web Developer",
    "logo": const Icon(Bootstrap.browser_chrome, size: 20,color: Colors.white54,),
  },
  {
    "name": "Penetration Testing",
    "logo": const Icon(Bootstrap.bug_fill, size: 20,color: Colors.white54,),
  },
];
