import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/theme/app_colors.dart';

class AnimatedBackground extends StatelessWidget {
  const AnimatedBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: AppColors.backgroundDark,
      child: Stack(
        children: [
          // Moving Purple Orb
          Positioned(
            top: MediaQuery.of(context).size.height * 0.1,
            left: MediaQuery.of(context).size.width * 0.1,
            child: Container(
              width: 400,
              height: 400,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.secondaryAccent, // Deep Purple
              ),
            ).animate(onPlay: (controller) => controller.repeat(reverse: true))
             .moveY(begin: 0, end: 150, duration: 15.seconds),
          ),
          // Moving Cyan Orb
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.1,
            right: MediaQuery.of(context).size.width * 0.2,
            child: Container(
              width: 300,
              height: 300,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primaryAccent, // Cyberpunk Cyan
              ),
            ).animate(onPlay: (controller) => controller.repeat(reverse: true))
             .move(begin: Offset.zero, end: const Offset(50, -100), duration: 15.seconds),
          ),
          // Glass Blur Layer
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
              child: Container(
                color: AppColors.backgroundDark.withValues(alpha:0.85), // Heavier cream tint
              ),
            ),
          ),
        ],
      ),
    );
  }
}
