import 'package:flutter/material.dart';
import 'package:haq_wt_u_nd_2_know/services/datas.dart';

class SkillWidget extends StatelessWidget {
  const SkillWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 500),
        child: Wrap(
          runSpacing: 10,
          spacing: 10,
          children: [
            for (int i = 0; i < skills.length; i++)
              Padding(
                padding: const EdgeInsets.all(2),
                child: Chip(
                  backgroundColor: const Color.fromARGB(0, 189, 103, 103),
                  avatar: SizedBox(
                    height: 20,
                    width: 20,
                    child: skills[i]["logo"],
                  ),
                  label: Text(
                    skills[i]["name"],
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
