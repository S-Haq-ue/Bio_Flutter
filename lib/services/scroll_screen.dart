// import 'package:flutter/material.dart';
// import 'package:flutter_animate/flutter_animate.dart';
// import 'package:haq_wt_u_nd_2_know/services/projects.dart';

// class ProjectPage extends StatefulWidget {
//   final ScrollController pageScrollController;
//   const ProjectPage({super.key, required this.pageScrollController});

//   @override
//   State<ProjectPage> createState() => _ProjectPageState();
// }

// class _ProjectPageState extends State<ProjectPage> {
//   int _visibleCardsCount = 0;
//   double _sectionStartOffset = 0;
//   bool _sectionLocked = false;
//   bool _sectionCompleted = false;
//   final double _scrollPerCard = 50.0; // Pixels to scroll to reveal each card
//   final GlobalKey _sectionKey = GlobalKey();
//   double _sectionTop = 0;

//   @override
//   void initState() {
//     super.initState();
//     widget.pageScrollController.addListener(_handleMainScroll);
//     // Calculate section position after first frame
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _calculateSectionPosition();
//     });
//   }

//   void _calculateSectionPosition() {
//     final RenderBox? renderBox = _sectionKey.currentContext?.findRenderObject() as RenderBox?;
//     if (renderBox != null) {
//       // Get the global position and convert to scroll offset
//       final globalPos = renderBox.localToGlobal(Offset.zero);
//       _sectionTop = globalPos.dy + widget.pageScrollController.offset;
//     }
//   }

//   @override
//   void dispose() {
//     widget.pageScrollController.removeListener(_handleMainScroll);
//     super.dispose();
//   }

//   void _handleMainScroll() {
//     final currentOffset = widget.pageScrollController.offset;
//     final totalCardScrollHeight = workProjects.length * _scrollPerCard;

//     // Only activate lock when scrolling into the section
//     if (!_sectionCompleted && currentOffset >= _sectionTop - 100) {
//       if (!_sectionLocked) {
//         _sectionStartOffset = currentOffset;
//         _sectionLocked = true;
//       }

//       // Calculate scroll distance within this section
//       final scrollProgress = currentOffset - _sectionStartOffset;
//       final cardsToShow = (scrollProgress / _scrollPerCard).floor() + 1;

//       setState(() {
//         _visibleCardsCount = cardsToShow.clamp(0, workProjects.length);
//       });

//       // Lock scroll while revealing cards
//       if (_visibleCardsCount < workProjects.length) {
//         // Use jumpTo to prevent further scrolling
//         widget.pageScrollController.jumpTo(_sectionStartOffset);
//       } else {
//         // All cards shown, prepare to move to next section
//         _sectionCompleted = true;
//         _sectionLocked = false;
        
//         // Auto-scroll to next section
//         Future.delayed(const Duration(milliseconds: 500), () {
//           if (mounted) {
//             widget.pageScrollController.animateTo(
//               _sectionStartOffset + totalCardScrollHeight + 300,
//               duration: const Duration(milliseconds: 1000),
//               curve: Curves.easeInOut,
//             );
//           }
//         });
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final double screenWidth = MediaQuery.of(context).size.width;

//     int crossAxisCount = screenWidth < 700 ? 1 : (screenWidth < 1100 ? 2 : 3);
//     final double horizontalPadding = screenWidth * 0.08;
//     const double spacing = 30.0;
//     final double cardWidth =
//         (screenWidth - (horizontalPadding * 2) - (spacing * (crossAxisCount - 1))) / crossAxisCount;

//     return Container(
//       key: _sectionKey,
//       color: const Color(0xFFF9F6F1),
//       child: Column(
//         children: [
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 40),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                   'Projects',
//                   style: TextStyle(fontSize: 56, fontWeight: FontWeight.w300, fontFamily: 'Serif'),
//                 ).animate().fadeIn(duration: 400.ms).slideX(begin: -0.1, end: 0),

//                 const SizedBox(height: 50),

//                 // Responsive Grid - show cards one by one
//                 Wrap(
//                   spacing: spacing,
//                   runSpacing: spacing,
//                   children: List.generate(_visibleCardsCount, (index) {
//                     return _EventCard(
//                       index: index,
//                       width: cardWidth,
//                     )
//                         .animate()
//                         .fadeIn(duration: 500.ms, curve: Curves.easeOut)
//                         .slideY(begin: 0.3, end: 0, curve: Curves.easeOutCubic);
//                   }),
//                 ),

//                 // Add spacing while cards are being revealed
//                 if (_visibleCardsCount < workProjects.length)
//                   SizedBox(
//                     height: _scrollPerCard * 0.5,
//                   ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _EventCard extends StatelessWidget {
//   final int index;
//   final double width;
//   const _EventCard({required this.index, required this.width});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: width,
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.black, width: 1.1),
//         color: Colors.white,
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           AspectRatio(
//             aspectRatio: 16 / 11,
//             child: Image.network(
//               workProjects[index].image ?? 'https://via.placeholder.com/150',
//               fit: BoxFit.cover,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(18.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text("August 30, 2030", style: TextStyle(color: Colors.black45, fontSize: 13)),
//                 const Divider(height: 24),
//                 Text("Event ${index + 1}", style: const TextStyle(fontSize: 21, fontWeight: FontWeight.w500)),
//                 const SizedBox(height: 8),
//                 const Text("Harmonious Park", style: TextStyle(fontSize: 14, color: Colors.black38)),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
