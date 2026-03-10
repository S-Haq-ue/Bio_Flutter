import 'dart:ui';
import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/utils/responsive.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Work ",
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
                "Experience",
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
          
          // Timeline
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: Column(
              children: [
                _buildExperienceRow(
                  context: context,
                  isMobile: isMobile,
                  company: "Sugee Pvt limited, Mumbai",
                  duration: "Sep 2020 - July 2023",
                  role: "UI/UX Designer",
                  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis lacus nunc, posuere in justo vulputate, bibendum sodales.",
                  isActive: false,
                  isFirst: false,
                  isLast: false,
                ),
                _buildExperienceRow(
                  context: context,
                  isMobile: isMobile,
                  company: "Cinetstox, Mumbai",
                  duration: "Sep 2023 - Present",
                  role: "Lead UX Designer",
                  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis lacus nunc, posuere in justo vulputate, bibendum sodales.",
                  isActive: true, // Making the current/latest one active
                  isFirst: false,
                  isLast: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceRow({
    required BuildContext context,
    required bool isMobile,
    required String company,
    required String duration,
    required String role,
    required String description,
    required bool isActive,
    required bool isFirst,
    required bool isLast,
  }) {
    if (isMobile) {
      // Mobile Layout: Timeline on the left, content on the right
      return IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Timeline Column
            SizedBox(
              width: 50,
              child: CustomPaint(
                painter: TimelinePainter(
                  isActive: isActive,
                  isFirst: isFirst,
                  isLast: isLast,
                  isMobile: true,
                ),
              ),
            ),
            // Content Column
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      role,
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      company,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      duration,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.textSecondary,
                          ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      description,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.textSecondary,
                            height: 1.5,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    // Desktop/Tablet Layout: 3 Columns
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Left: Company & Duration
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 48.0, top: 4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    company,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    duration,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: AppColors.textSecondary,
                        ),
                  ),
                ],
              ),
            ),
          ),
          
          // Middle: Timeline Node
          SizedBox(
            width: 80,
            child: CustomPaint(
              painter: TimelinePainter(
                isActive: isActive,
                isFirst: isFirst,
                isLast: isLast,
                isMobile: false,
              ),
            ),
          ),

          // Right: Role & Description
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 48.0, bottom: 64.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    role,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: AppColors.textSecondary,
                          height: 1.5,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TimelinePainter extends CustomPainter {
  final bool isActive;
  final bool isFirst;
  final bool isLast;
  final bool isMobile;

  TimelinePainter({
    required this.isActive,
    required this.isFirst,
    required this.isLast,
    required this.isMobile,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double centerX = size.width / 2;
    // Align node vertically with text. Trial value; might need adjustment
    final double nodeY = isMobile ? 24.0 : 20.0; 
    
    final Paint linePaint = Paint()
      ..color = AppColors.textSecondary
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    final Paint nodePaint = Paint()
      ..color = isActive ? AppColors.primaryAccent : AppColors.textPrimary
      ..style = PaintingStyle.fill;
      
    final Paint dashedBorderPaint = Paint()
      ..color = AppColors.textSecondary
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    // 1. Draw connecting lines
    double dashWidth = 4, dashSpace = 4;

    // Top line (if not first)
    if (!isFirst) {
      double startY = 0;
      while (startY < nodeY - 20) {
        canvas.drawLine(Offset(centerX, startY), Offset(centerX, startY + dashWidth), linePaint);
        startY += dashWidth + dashSpace;
      }
    }

    // Bottom line (if not last)
    if (!isLast) {
      double startY = nodeY + 20;
      while (startY < size.height) {
        canvas.drawLine(Offset(centerX, startY), Offset(centerX, startY + dashWidth), linePaint);
        startY += dashWidth + dashSpace;
      }
    }

    // 2. Draw Node
    const double nodeRadius = 12.0; // Inner circle
    const double borderRadius = 18.0; // Outer dashed circle

    // Inner filled circle
    canvas.drawCircle(Offset(centerX, nodeY), nodeRadius, nodePaint);

    // Outer dashed circle
    final Path circlePath = Path()
      ..addOval(Rect.fromCircle(center: Offset(centerX, nodeY), radius: borderRadius));
    
    // Custom logic to dash a circle
    PathMetrics pathMetrics = circlePath.computeMetrics();
    for (PathMetric pathMetric in pathMetrics) {
      double distance = 0.0;
      while (distance < pathMetric.length) {
        Path extractPath = pathMetric.extractPath(distance, distance + dashWidth);
        canvas.drawPath(extractPath, dashedBorderPaint);
        distance += dashWidth + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(covariant TimelinePainter oldDelegate) {
    return oldDelegate.isActive != isActive ||
           oldDelegate.isFirst != isFirst ||
           oldDelegate.isLast != isLast ||
           oldDelegate.isMobile != isMobile;
  }
}
