import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haq_wt_u_nd_2_know/Pages/skill_page.dart';
import 'package:haq_wt_u_nd_2_know/widgets/custom_drawer.dart';
import 'package:haq_wt_u_nd_2_know/widgets/nav_bar.dart';
import 'package:haq_wt_u_nd_2_know/provider/common_provider.dart';
import 'package:haq_wt_u_nd_2_know/services/constant.dart';
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
              SkillPage(screenWidth: constraints.maxWidth, commonProvider: commonProvider),
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
