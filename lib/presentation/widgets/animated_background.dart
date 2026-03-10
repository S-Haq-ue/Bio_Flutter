import 'dart:ui';
import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class AnimatedBackground extends StatefulWidget {
  const AnimatedBackground({super.key});

  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(seconds: 15))..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: AppColors.backgroundDark,
      child: Stack(
        children: [
          // Moving Purple Orb
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Positioned(
                top: MediaQuery.of(context).size.height * 0.1 + (150 * _controller.value),
                left: MediaQuery.of(context).size.width * 0.1,
                child: Container(
                  width: 400,
                  height: 400,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.secondaryAccent, // Deep Purple
                  ),
                ),
              );
            },
          ),
          // Moving Cyan Orb
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Positioned(
                bottom: MediaQuery.of(context).size.height * 0.1 + (100 * _controller.value),
                right: MediaQuery.of(context).size.width * 0.2 - (50 * _controller.value),
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primaryAccent, // Cyberpunk Cyan
                  ),
                ),
              );
            },
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
