import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../data/models/project.dart';
import '../widgets/project_card.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  final List<Project> _projects = const [
    Project(
      title: 'Hipay Payment Solutions',
      category: 'Recharge Application',
      description: 'A recharge application for indian and internation mobile,d2h and card recharge.',
      tools: ['Flutter', 'dart', 'provider', 'fcm', 'Api'],
      imageUrl: 'assets/images/public_service.jpeg',
      // androidLink: "https://play.google.com/store/apps/details?id=ae.hipay",
      // iosLink: "https://apps.apple.com/in/app/hipay-payment-services/id6498886922",
    ),
    Project(
      title: '"I Gold"',
      category: 'Finance Application',
      description: "An application providing real-time currency, bullion, and commodity rates.",
      tools: ['Flutter', 'dart', 'provider', 'Api'],
      imageUrl: 'assets/images/igold.jpeg',
    ),
    Project(
      title: 'Pay In Pay',
      category: 'Recharge Application',
      description: 'A recharge application for indian and internation mobile,d2h and card recharge.',
      tools: ['Flutter', 'dart', 'provider', 'fcm', 'Api'],
      imageUrl: 'assets/images/payinpay.jpeg',
    ),
    Project(
      title: 'Hipay Payment Solutions',
      category: 'Recharge Application',
      description: 'A recharge application for indian and internation mobile,d2h and card recharge.',
      tools: ['Flutter', 'dart', 'provider', 'fcm', 'Api'],
    ),
    Project(
      title: 'Hipay Payment Solutions',
      category: 'Recharge Application',
      description: 'A recharge application for indian and internation mobile,d2h and card recharge.',
      tools: ['Flutter', 'dart', 'provider', 'fcm', 'Api'],
    ),
    Project(
      title: 'Hipay Payment Solutions',
      category: 'Recharge Application',
      description: 'A recharge application for indian and internation mobile,d2h and card recharge.',
      tools: ['Flutter', 'dart', 'provider', 'fcm', 'Api'],
    ),
    Project(
      title: 'Hipay Payment Solutions',
      category: 'Recharge Application',
      description: 'A recharge application for indian and internation mobile,d2h and card recharge.',
      tools: ['Flutter', 'dart', 'provider', 'fcm', 'Api'],
    ),
    Project(
      title: 'Hipay Payment Solutions',
      category: 'Recharge Application',
      description: 'A recharge application for indian and internation mobile,d2h and card recharge.',
      tools: ['Flutter', 'dart', 'provider', 'fcm', 'Api'],
    ),
    Project(
      title: 'Hipay Payment Solutions',
      category: 'Recharge Application',
      description: 'A recharge application for indian and internation mobile,d2h and card recharge.',
      tools: ['Flutter', 'dart', 'provider', 'fcm', 'Api'],
    ),
    Project(
      title: 'Hipay Payment Solutions',
      category: 'Recharge Application',
      description: 'A recharge application for indian and internation mobile,d2h and card recharge.',
      tools: ['Flutter', 'dart', 'provider', 'fcm', 'Api'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "My ",
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      color: AppColors.textPrimary.withValues(alpha:0.5),
                      blurRadius: 10,
                    )
                  ],
                ),
              ),
              Text(
                "Projects",
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  color: AppColors.primaryAccent,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      color: AppColors.primaryAccent.withValues(alpha:0.5),
                      blurRadius: 10,
                    )
                  ],
                ),
              ),
            ],
          ),
          // const SizedBox(height: 16),
          // Text(
          //   "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis\nlacus nunc, posuere in justo vulputate, bibendum sodales",
          //   style: Theme.of(context).textTheme.bodyLarge?.copyWith(
          //         color: AppColors.textSecondary,
          //       ),
          // ),
          const SizedBox(height: 64),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100),
            child: Wrap(
              spacing: 32,
              runSpacing: 32,
              alignment: WrapAlignment.center,
              children: _projects.map((project) => ProjectCard(project: project)).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
