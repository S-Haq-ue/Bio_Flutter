import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:haq_wt_u_nd_2_know/services/constant.dart';
import 'package:haq_wt_u_nd_2_know/services/projects.dart';
import 'package:haq_wt_u_nd_2_know/provider/project_card_animation_provider.dart';
import 'package:haq_wt_u_nd_2_know/widgets/contact_us.dart';
import 'package:icons_plus/icons_plus.dart';

class ProjectCard extends StatelessWidget {
  final bool personal;
  final double screenSize;
  final List<ProjectModel> projectModel;

  const ProjectCard({
    super.key,
    required this.screenSize,
    required this.projectModel,
    this.personal = false,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProjectCardAnimationProvider(
        cardCount: projectModel.length,
        vsync: _TickerProviderImpl(),
      ),
      child: _ProjectCardContent(
        personal: personal,
        screenSize: screenSize,
        projectModel: projectModel,
      ),
    );
  }
}

class _ProjectCardContent extends StatelessWidget {
  final bool personal;
  final double screenSize;
  final List<ProjectModel> projectModel;

  const _ProjectCardContent({
    required this.personal,
    required this.screenSize,
    required this.projectModel,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: screenSize * 0.75),
      child: Consumer<ProjectCardAnimationProvider>(
        builder: (context, animationProvider, _) {
          return Wrap(
            spacing: 25,
            runSpacing: 25,
            children: [
              for (int i = 0; i < projectModel.length; i++)
                VisibilityDetector(
                  key: Key('project_card_$i'),
                  onVisibilityChanged: (visibilityInfo) {
                    animationProvider.onVisibilityChanged(i, visibilityInfo.visibleFraction);
                  },
                  child: AnimatedBuilder(
                    animation: Listenable.merge([
                      animationProvider.forwardAnimations[i],
                      animationProvider.reverseAnimations[i],
                    ]),
                    builder: (context, child) {
                      double scale = animationProvider.currentAnimationState[i] == 1
                          ? animationProvider.forwardAnimations[i].value
                          : animationProvider.reverseAnimations[i].value;
                      return ScaleTransition(
                        scale: AlwaysStoppedAnimation(scale),
                        child: child,
                      );
                    },
                    child: Container(
                      height: 400,
                      width: 250,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: navBarBackgroundGradient,
                          border: Border.all(color: Colors.transparent, width: 5)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 220,
                            child: Image.asset(
                              projectModel[i].image!,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              projectModel[i].title!,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(projectModel[i].subtitle!),
                          ),
                          const Spacer(),
                          if (personal)
                            Container(
                              height: 30,
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                gradient: backgroundGradientGrey,
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                    child: Text(
                                      "Source code:",
                                      style: TextStyle(color: Colors.white54),
                                    ),
                                  ),
                                  const Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: InkWell(
                                      onTap: () {
                                        ContactUs.launchWebsite(projectModel[i].gitLink!);
                                      },
                                      child: const SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: Image(
                                          image: AssetImage('assets/images/github.png'),
                                          color: Colors.white54,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          if (projectModel[i].isPublished)
                            Container(
                              height: 30,
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                gradient: backgroundGradientGrey,
                                borderRadius: BorderRadius.circular(7),
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
                                      onTap: () {
                                        ContactUs.launchWebsite(projectModel[i].iosLink!);
                                      },
                                      child: const Icon(Bootstrap.apple, size: 15, color: Colors.white54),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: InkWell(
                                      onTap: () {
                                        ContactUs.launchWebsite(projectModel[i].androidLink!);
                                      },
                                      child: const Icon(Bootstrap.android2, size: 15, color: Colors.white54),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          const SizedBox(
                            height: 3,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

// Ticker provider for animations in stateless widget
class _TickerProviderImpl extends TickerProvider {
  @override
  Ticker createTicker(TickerCallback onTick) {
    return Ticker(onTick);
  }
}
