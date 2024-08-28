import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haq_wt_u_nd_2_know/widgets/custom_drawer.dart';
import 'package:haq_wt_u_nd_2_know/widgets/nav_bar.dart';
import 'package:haq_wt_u_nd_2_know/provider/common_provider.dart';
import 'package:haq_wt_u_nd_2_know/services/constant.dart';
import 'package:haq_wt_u_nd_2_know/services/datas.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Consumer<CommonProvider>(builder: (context, commonProvider, child) {
        return Scaffold(
          key: commonProvider.scaffoldKey,
          backgroundColor: backGroundColor,
          endDrawer: constraints.maxWidth > webPageSize ? null : const CustomDrawer(),
          body: ListView(
            children: [
              //Header
              NavBar(screenWidth: constraints.maxWidth, commonProvider: commonProvider),
              //body
              SizedBox(
                height: 600,
                width: double.maxFinite,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (constraints.maxWidth < webPageSize)
                              SizedBox(
                                width: 500,
                                child: Image.asset(
                                  backgroundImage,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            Text(
                              "SHAMEEMUL HAQUE P",
                              style: GoogleFonts.teko(
                                color: Colors.white,
                                fontSize: 50,
                              ),
                            ),
                            Text(
                              "FLUTTER DEVELOPER",
                              style: GoogleFonts.unicaOne(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            if (constraints.maxWidth < webPageSize)
                              const SizedBox(
                                height: 20,
                              ),
                          ],
                        ),
                      ),
                    ),
                    if (constraints.maxWidth > webPageSize)
                      Flexible(
                        child: Image.asset(
                          backgroundImage,
                          fit: BoxFit.contain,
                        ),
                      ),
                  ],
                ),
              ),
              //Skills
              Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                  gradient: navBarBackgroundGradient,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "What can I do",
                        style: GoogleFonts.julee(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      if (constraints.maxWidth < tabScreenSize) const SkillWidget(),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ConstrainedBox(
                            constraints: BoxConstraints(maxWidth: constraints.maxWidth > webPageSize ? 550 : 400),
                            child: Wrap(
                              children: [
                                for (int i = 0; i < skillsPlatform.length; i++)
                                  Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: Container(
                                      width: 250,
                                      decoration: BoxDecoration(
                                          gradient: backgroundGradientGrey, borderRadius: BorderRadius.circular(5)),
                                      child: ListTile(
                                        leading: SizedBox(
                                          height: 20,
                                          width: 20,
                                          child: skillsPlatform[i]["logo"],
                                        ),
                                        title: Text(
                                          skillsPlatform[i]["name"],
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          if (constraints.maxWidth > tabScreenSize) const SkillWidget(),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ),
              //Project
              SizedBox(
                height: 500,
                width: double.maxFinite,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Work Projects",
                      style: GoogleFonts.julee(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              //Project
              SizedBox(
                height: 500,
                width: double.maxFinite,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Personal Projects",
                      style: GoogleFonts.julee(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              //Footer
              Container(
                height: 500,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  gradient: navBarBackgroundGradient,
                ),
              ),
            ],
          ),
        );
      });
    });
  }
}

class SkillWidget extends StatelessWidget {
  const SkillWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 500),
        child: Wrap(
          runSpacing: 10,
          spacing: 10,
          children: [
            for (int i = 0; i < skills.length; i++)
              Padding(
                padding: const EdgeInsets.all(2),
                child: Chip(
                  backgroundColor: const Color.fromARGB(0, 189, 103, 103),
                  avatar: SizedBox(
                    height: 20,
                    width: 20,
                    child: skills[i]["logo"],
                  ),
                  label: Text(
                    skills[i]["name"],
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
