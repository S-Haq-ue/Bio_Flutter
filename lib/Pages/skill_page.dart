import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haq_wt_u_nd_2_know/provider/common_provider.dart';
import 'package:haq_wt_u_nd_2_know/services/constant.dart';
import 'package:haq_wt_u_nd_2_know/services/datas.dart';

class SkillPage extends StatelessWidget {
  final double screenWidth;
  final CommonProvider commonProvider;
  const SkillPage({super.key, required this.screenWidth, required this.commonProvider});

  @override
  Widget build(BuildContext context) {
    return Container(
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
            if (screenWidth < tabScreenSize) const SkillWidget(),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: screenWidth > webPageSize ? 550 : 400),
                  child: Wrap(
                    children: [
                      for (int i = 0; i < skillsPlatform.length; i++)
                        Padding(
                          padding: const EdgeInsets.all(2),
                          child: Container(
                            width: 250,
                            decoration:
                                BoxDecoration(gradient: backgroundGradientGrey, borderRadius: BorderRadius.circular(5)),
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
                if (screenWidth > tabScreenSize) const SkillWidget(),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
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
