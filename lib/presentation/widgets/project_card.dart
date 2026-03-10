import 'dart:math';
import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../data/models/project.dart';

class ProjectCard extends StatefulWidget {
  final Project project;

  const ProjectCard({
    super.key,
    required this.project,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;
  bool _isInfoHovered = false;

  @override
  Widget build(BuildContext context) {
    final bool isCardActive = _isHovered || _isInfoHovered;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        MouseRegion(
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          child: ClipPath(
            clipper: CardNotchClipper(),
            child: CustomPaint(
              foregroundPainter: CardNotchPainter(isHovered: isCardActive),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                width: 350,
                height: 480,
                // Transparent by default, theme purple on hover
                color: isCardActive ? AppColors.primaryAccent.withValues(alpha: 0.7) : Colors.transparent,
                child: Stack(
                  children: [
                    // Content Area (Top text)
                    Positioned(
                      top: 24,
                      left: 24,
                      right: 110, // Leave space for the notch
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.project.title,
                            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                  color: AppColors.textPrimary,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            widget.project.category,
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  color: AppColors.textSecondary,
                                ),
                          ),
                        ],
                      ),
                    ),

                    // Description Box (Fades in on hover)
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 300),
                        opacity: isCardActive ? 1.0 : 0.0,
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          height: 80,
                          decoration: const BoxDecoration(
                            color: AppColors.glassBackgroundDark,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(16),
                              bottomRight: Radius.circular(16),
                            ),
                          ),
                          child: Text(
                            widget.project.description,
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: AppColors.textPrimary,
                                  height: 1.4,
                                ),
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ),

                    // Project Image / Preview Area
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      top: isCardActive ? 150 : 206, // Moves up on hover
                      left: 24,
                      right: 24,
                      height: 250,
                      child: TweenAnimationBuilder(
                        tween: Tween<double>(begin: 0, end: _isInfoHovered ? pi : 0),
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                        builder: (context, value, child) {
                          bool isBack = value >= pi / 2;
                          return Transform(
                            transform: Matrix4.identity()
                              ..setEntry(3, 2, 0.001)
                              ..rotateY(value),
                            alignment: Alignment.center,
                            child: isBack
                                ? Transform(
                                    alignment: Alignment.center,
                                    transform: Matrix4.identity()..rotateY(pi),
                                    child: _buildToolsContainer(_isInfoHovered),
                                  )
                                : _buildImageContainer(_isHovered),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 16,
          right: 16,
          child: MouseRegion(
            onEnter: (_) => setState(() => _isInfoHovered = true),
            onExit: (_) => setState(() => _isInfoHovered = false),
            child: Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: _isInfoHovered
                    ? LinearGradient(
                        colors: [AppColors.primaryAccent.withValues(alpha: 0.5), AppColors.primaryAccent],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      )
                    : null,
                boxShadow: _isInfoHovered
                    ? [
                        BoxShadow(
                          color: AppColors.primaryAccent.withValues(alpha: _isInfoHovered ? 0.6 : 0.3),
                          blurRadius: _isInfoHovered ? 16 : 10,
                          offset: Offset(0, _isInfoHovered ? 6 : 4),
                        ),
                      ]
                    : null,
              ),
              child: Icon(
                Icons.info_outline, // Arrow exactly matching the user's reference image
                color: AppColors.glassBorder,
                size: 28,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildImageContainer(bool isHovered) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundLight,
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(20),
          topRight: const Radius.circular(20),
          bottomLeft: Radius.circular(isHovered ? 0 : 20),
          bottomRight: Radius.circular(isHovered ? 0 : 20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: widget.project.imageUrl != null
          ? Image.asset(
              widget.project.imageUrl!,
              fit: BoxFit.cover,
            )
          : const Center(
              child: Icon(
                Icons.image_not_supported_outlined,
                size: 40,
                color: Colors.grey,
              ),
            ),
    );
  }

  Widget _buildToolsContainer(bool isHovered) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.glassBackgroundLight.withValues(alpha: 0.2),
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(20),
          topRight: const Radius.circular(20),
          bottomLeft: Radius.circular(isHovered ? 0 : 20),
          bottomRight: Radius.circular(isHovered ? 0 : 20),
        ),
        border: Border(
          top: BorderSide(color: AppColors.glassBorder),
          left: BorderSide(color: AppColors.glassBorder),
          right: BorderSide(color: AppColors.glassBorder),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Tools Used",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: SingleChildScrollView(
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: widget.project.tools
                    .map((tool) => Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: AppColors.glassBackground,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: AppColors.glassBorder),
                          ),
                          child: Text(
                            tool,
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: AppColors.textPrimary,
                                ),
                          ),
                        ))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CardNotchPath {
  static Path getPath(Size size, double radius) {
    var path = Path();

    // Configurations for the "realist" notch matching the button
    const double buttonSize = 56.0;
    const double buttonOffset = 16.0; // Distance of button from top & right
    const double gap = 12.0; // Gap between button and card
    const double filletR = 24.0; // Outer rounding curve

    const double buttonR = buttonSize / 2;
    const double arcR = buttonR + gap;

    // Center of the button circle
    final double cx = size.width - buttonR - buttonOffset;
    const double cy = buttonR + buttonOffset;

    const double dist1 = arcR + filletR;

    // Calculate first fillet center (Top edge)
    const double dy1 = cy - filletR;
    final double dx1 = sqrt(max(0, dist1 * dist1 - dy1 * dy1));
    final double xf1 = cx - dx1;

    // Calculate second fillet center (Right edge)
    final double dx2 = size.width - filletR - cx;
    final double dy2 = sqrt(max(0, dist1 * dist1 - dx2 * dx2));
    final double yf2 = cy + dy2;

    // Tangent points where fillets meet the main notch
    final double t1x = xf1 + (cx - xf1) * (filletR / dist1);
    const double t1y = filletR + (cy - filletR) * (filletR / dist1);

    final double t2x = cx + (size.width - filletR - cx) * (arcR / dist1);
    final double t2y = cy + (yf2 - cy) * (arcR / dist1);

    path.moveTo(radius, 0);
    path.lineTo(xf1, 0);

    // First Fillet (turns inward)
    path.arcToPoint(
      Offset(t1x, t1y),
      radius: const Radius.circular(filletR),
      clockwise: true,
    );

    // The Notch (wraps the button)
    path.arcToPoint(
      Offset(t2x, t2y),
      radius: const Radius.circular(arcR),
      clockwise: false,
    );

    // Second Fillet (turns outward to join right edge)
    path.arcToPoint(
      Offset(size.width, yf2),
      radius: const Radius.circular(filletR),
      clockwise: true,
    );

    // Rest of the card path
    path.lineTo(size.width, size.height - radius);
    path.quadraticBezierTo(size.width, size.height, size.width - radius, size.height);
    path.lineTo(radius, size.height);
    path.quadraticBezierTo(0, size.height, 0, size.height - radius);
    path.lineTo(0, radius);
    path.quadraticBezierTo(0, 0, radius, 0);
    path.close();

    return path;
  }
}

class CardNotchClipper extends CustomClipper<Path> {
  final double radius;
  CardNotchClipper({this.radius = 20});

  @override
  Path getClip(Size size) => CardNotchPath.getPath(size, radius);

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class CardNotchPainter extends CustomPainter {
  final bool isHovered;

  CardNotchPainter({required this.isHovered});

  @override
  void paint(Canvas canvas, Size size) {
    if (isHovered) return; // Only draw border when not hovered

    final path = CardNotchPath.getPath(size, 20.0);

    final paint = Paint()
      ..color = AppColors.glassBorder
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CardNotchPainter oldDelegate) => oldDelegate.isHovered != isHovered;
}
