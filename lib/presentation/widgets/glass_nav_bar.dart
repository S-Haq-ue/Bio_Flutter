import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/theme/app_colors.dart';
import '../../core/providers/nav_bar_item_provider.dart';

class GlassNavBar extends StatelessWidget {
  final Function(String) onNavSelected;

  const GlassNavBar({super.key, required this.onNavSelected});

  @override
  Widget build(BuildContext context) {
    final navItems = ['Home', 'About', 'Experience', 'Skills', 'Projects', 'Education', 'Contact'];

    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.glassBackground,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: AppColors.glassBorder, width: 1.5),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 20,
                spreadRadius: 5,
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: navItems.map((item) {
              return _NavBarItem(
                item: item,
                onTap: () => onNavSelected(item),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final String item;
  final VoidCallback onTap;

  const _NavBarItem({
    required this.item,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NavBarItemProvider(),
      child: Consumer<NavBarItemProvider>(
        builder: (context, provider, child) {
          return MouseRegion(
            onEnter: (_) => provider.setHovered(true),
            onExit: (_) => provider.setHovered(false),
            child: InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(16),
              hoverColor: Colors.transparent,
              splashColor: AppColors.primaryAccent.withValues(alpha: 0.1),
              highlightColor: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: provider.isHovered
                            ? HSLColor.fromColor(AppColors.primaryAccent).withLightness(0.50).toColor()
                            : AppColors.textPrimary,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                        shadows: provider.isHovered
                            ? [
                                Shadow(
                                  color: AppColors.secondaryAccent.withValues(alpha: 0.6),
                                  blurRadius: 10,
                                )
                              ]
                            : [],
                      ),
                  child: Text(item),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
