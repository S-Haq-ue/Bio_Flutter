import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/theme/app_colors.dart';
import '../widgets/datas.dart';
import '../../core/utils/responsive.dart';
import '../../core/providers/contact_card_provider.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24.0 : 48.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Get in ",
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      color: AppColors.textPrimary.withValues(alpha: 0.5),
                      blurRadius: 10,
                    )
                  ],
                ),
              ),
              Text(
                "Touch",
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  color: AppColors.primaryAccent,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      color: AppColors.primaryAccent.withValues(alpha: 0.5),
                      blurRadius: 10,
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 64),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: Wrap(
              spacing: 24,
              runSpacing: 24,
              alignment: WrapAlignment.center,
              children: contact.map((item) {
                return _ContactCard(item: item);
              }).toList(),
            ),
          ),
          const SizedBox(height: 50),
          // Footer
          Container(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Text(
              "Made with Flutter",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.textSecondary,
                    letterSpacing: 1.2,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactCard extends StatelessWidget {
  final Map item;

  const _ContactCard({required this.item});

  Future<void> _launchUrl(String urlString) async {
    final Uri url = Uri.parse(urlString.contains('@') ? 'mailto:$urlString' : urlString);
    if (!await launchUrl(url)) {
      debugPrint('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ContactCardProvider(),
      child: Consumer<ContactCardProvider>(
        builder: (context, provider, child) {
          final isHovered = provider.isHovered;

          return MouseRegion(
            onEnter: (_) => provider.setHovered(true),
            onExit: (_) => provider.setHovered(false),
            child: GestureDetector(
              onTap: () => _launchUrl(item['url']),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
                transform: isHovered ? Matrix4.translationValues(0, -5, 0) : Matrix4.identity(),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                decoration: BoxDecoration(
                  color: isHovered ? AppColors.glassBackgroundDark : AppColors.glassBackground,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: isHovered ? AppColors.primaryAccent : AppColors.glassBorder,
                    width: isHovered ? 1.5 : 1.0,
                  ),
                  boxShadow: isHovered
                      ? [
                          BoxShadow(
                            color: AppColors.primaryAccent.withValues(alpha: 0.2),
                            blurRadius: 15,
                            offset: const Offset(0, 8),
                          )
                        ]
                      : [],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 24,
                      height: 24,
                      child: item['logo'],
                    ),
                    const SizedBox(width: 12),
                    Text(
                      item['id'],
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: isHovered ? AppColors.secondaryAccent : AppColors.textPrimary,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
