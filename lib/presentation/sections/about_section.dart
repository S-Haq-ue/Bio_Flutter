import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/theme/app_colors.dart';
import '../../core/utils/responsive.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

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
                "About ",
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
                "Me",
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
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: Container(
                width: isMobile ? double.infinity : MediaQuery.of(context).size.width * 0.65,
                padding: EdgeInsets.all(isMobile ? 32.0 : 64.0),
                decoration: BoxDecoration(
                    color: AppColors.glassBackground,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: AppColors.glassBorder, width: 1.5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha:0.05),
                        blurRadius: 30,
                        spreadRadius: 5,
                      )
                    ]),
                child: Column(
                  children: [
                    Text(
                      "SHAMEEMUL HAQUE P",
                      style: Theme.of(context).textTheme.displayMedium?.copyWith(
                            fontSize: isMobile ? 28 : 42,
                            color: AppColors.textPrimary,
                            letterSpacing: 2.0,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      decoration: BoxDecoration(
                        color: AppColors.secondaryAccent.withValues(alpha:0.15),
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: AppColors.secondaryAccent.withValues(alpha:0.5), width: 1.5),
                      ),
                      child: Text(
                        "Flutter Developer • 2 Years Experience",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: AppColors.secondaryAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: isMobile ? 14 : 18,
                            ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 40),
                    Text(
                      "I am a passionate Flutter Developer dedicated to crafting high-performance, visually stunning mobile and web applications. With a strong focus on clean architecture, modern aesthetics, and seamless user experiences, I strive to build digital products that leave a lasting impression. Let's build something extraordinary.",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: isMobile ? 16 : 20,
                            height: 1.8,
                            color: AppColors.textSecondary,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ).animate()
           .fade(duration: 1200.ms, curve: Curves.easeOut)
           .slideY(begin: 0.3, end: 0, duration: 1200.ms, curve: Curves.easeOutCubic),
        ],
      ),
    );
  }
}
