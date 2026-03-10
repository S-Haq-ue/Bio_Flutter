import 'dart:ui';
import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../widgets/datas.dart';

class SkillsSection extends StatefulWidget {
  const SkillsSection({super.key});

  @override
  State<SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    // Staggered animation controller
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 1500));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_isVisible && mounted) {
        setState(() {
          _isVisible = true;
          _controller.forward();
        });
      }
    });

    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24.0 : 48.0,
        vertical: 100.0,
      ),
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
          // Text(
          //   "My Stack",
          //   style: Theme.of(context).textTheme.displayLarge?.copyWith(
          //     fontSize: isMobile ? 36 : 48,
          //     color: AppColors.secondaryAccent,
          //     shadows: [
          //       Shadow(
          //         color: AppColors.secondaryAccent.withOpacity(0.5),
          //         blurRadius: 10,
          //       )
          //     ],
          //   ),
          // ),
          // const SizedBox(height: 16),
          // Text(
          //   "Technologies & Platforms I have mapped out",
          //   style: Theme.of(context).textTheme.bodyLarge?.copyWith(
          //         fontSize: isMobile ? 16 : 20,
          //         color: AppColors.textSecondary,
          //       ),
          //   textAlign: TextAlign.center,
          // ),
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

  Widget _buildSkillCard(String name, Widget logo, int index, int totalItems, bool isMobile, {double? customWidth}) {
    // Calculate a staggered delay for each item
    final delay = index / totalItems;
    final curve = CurvedAnimation(
      parent: _controller,
      curve: Interval(delay, 1.0, curve: Curves.easeOutBack),
    );

    final scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(curve);
    final fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(curve);

    return ScaleTransition(
      scale: scaleAnimation,
      child: FadeTransition(
        opacity: fadeAnimation,
        child: ClipRRect(
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
        ),
      ),
    );
  }
}
