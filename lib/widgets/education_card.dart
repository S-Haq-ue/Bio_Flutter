import 'package:flutter/material.dart';
import 'package:haq_wt_u_nd_2_know/services/constant.dart';
import 'package:haq_wt_u_nd_2_know/services/education.dart';

class EducationCard extends StatelessWidget {
  final double screenSize;
  const EducationCard({
    super.key,
    required this.screenSize,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: screenSize * 0.75),
      child: Wrap(
        spacing: 25,
        runSpacing: 25,
        children: [
          for (int i = 0; i < educationData.length; i++)
            Container(
              decoration: const BoxDecoration(
                  border: Border(
                      left: BorderSide(
                color: backGroundColor,
                width: 10,
              ))),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      educationData[i].course,
                      style: const TextStyle(color: Colors.white),
                    ),
                    Text(
                      educationData[i].location,
                      style: const TextStyle(color: Colors.white),
                    ),
                    Text(
                      educationData[i].gPA ?? "",
                      style: const TextStyle(color: Colors.white),
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
