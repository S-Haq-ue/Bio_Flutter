import 'package:flutter/material.dart';
import 'package:haq_wt_u_nd_2_know/services/constant.dart';
import 'package:haq_wt_u_nd_2_know/services/projects.dart';
import 'package:icons_plus/icons_plus.dart';

class ProjectCard extends StatelessWidget {
  final double screenSize;
  final List<ProjectModel> projectModel;
  const ProjectCard({
    super.key,
    required this.screenSize,
    required this.projectModel,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: screenSize * 0.75),
      child: Wrap(
        spacing: 25,
        runSpacing: 25,
        children: [
          for (int i = 0; i < projectModel.length; i++)
            Container(
              height: 300,
              width: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: navBarBackgroundGradient,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(projectModel[i].image!),
                  Text(
                    projectModel[i].title!,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(projectModel[i].subtitle!),
                  const Spacer(),
                  projectModel[i].isPublished
                      ? Container(
                          height: 30,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            gradient: backgroundGradientGrey,
                          ),
                          child: Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                child: Text(
                                  "Available On:",
                                  style: TextStyle(color: Colors.white54),
                                ),
                              ),
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: InkWell(
                                  onTap: () {},
                                  child: const Icon(Bootstrap.apple, size: 15, color: Colors.white54),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: InkWell(
                                  onTap: () {},
                                  child: const Icon(Bootstrap.android2, size: 15, color: Colors.white54),
                                ),
                              )
                            ],
                          ),
                        )
                      : const SizedBox(),
                  const SizedBox(
                    height: 3,
                  )
                ],
              ),
            ),
        ],
      ),
    );
  }
}
