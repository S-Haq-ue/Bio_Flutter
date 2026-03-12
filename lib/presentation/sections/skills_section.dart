import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/theme/app_colors.dart';
import '../widgets/datas.dart';
import '../../core/utils/responsive.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24.0 : 48.0,
        vertical: 100.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Wrap(
            alignment: WrapAlignment.center,
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
                "Stack",
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
          const SizedBox(height: 64),

          // Platforms / Roles Grid
          _buildCategoryTitle("Roles I'm good at", context, isMobile),
          const SizedBox(height: 24),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: isMobile ? (4 * 140.0) + (3 * 24.0) : (5 * 180.0) + (4 * 24.0),
            ),
            child: Wrap(
              spacing: 24,
              runSpacing: 24,
              alignment: WrapAlignment.center,
              children: List.generate(skillsPlatform.length, (index) {
                final platform = skillsPlatform[index];
                return _buildSkillCard(
                  platform['name'] as String,
                  platform['logo'] as Widget,
                  index,
                  skillsPlatform.length,
                  isMobile,
                  context,
                );
              }),
            ),
          ),

          const SizedBox(height: 64),

          // Core Technologies Grid
          _buildCategoryTitle("Tools in my arsenal", context, isMobile),
          const SizedBox(height: 24),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: isMobile ? (4 * 140.0) + (3 * 24.0) : (5 * 180.0) + (4 * 24.0),
            ),
            child: Wrap(
              spacing: 24,
              runSpacing: 24,
              alignment: WrapAlignment.center,
              children: List.generate(skills.length, (index) {
                final skill = skills[index];
                return _buildSkillCard(
                  skill['name'] as String,
                  skill['logo'] as Widget,
                  index + skillsPlatform.length,
                  skills.length + skillsPlatform.length,
                  isMobile,
                  context,
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryTitle(String title, BuildContext context, bool isMobile) {
    return Text(
      title,
      style: Theme.of(context).textTheme.displayMedium?.copyWith(
            fontSize: isMobile ? 24 : 32,
            color: AppColors.textPrimary,
          ),
    );
  }

  Widget _buildSkillCard(String name, Widget logo, int index, int totalItems, bool isMobile, BuildContext context, {double? customWidth}) {
    // Staggered delay based on index
    final int delayMs = (index * 100);

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          width: customWidth ?? (isMobile ? 140 : 180),
          height: isMobile ? 140 : 180,
          decoration: BoxDecoration(
            color: AppColors.glassBackground,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.glassBorder, width: 1.5),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha:0.05),
                blurRadius: 20,
                spreadRadius: 2,
              )
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: isMobile ? 50 : 70,
                width: isMobile ? 50 : 70,
                child: logo,
              ),
              const SizedBox(height: 16),
              Text(
                name,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w600,
                      fontSize: isMobile ? 14 : 16,
                    ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    ).animate(delay: delayMs.ms)
     .scale(duration: 800.ms, curve: Curves.easeOutBack, begin: const Offset(0, 0), end: const Offset(1, 1))
     .fade(duration: 500.ms);
  }
}

