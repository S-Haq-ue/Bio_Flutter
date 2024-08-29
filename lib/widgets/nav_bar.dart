// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:haq_wt_u_nd_2_know/provider/common_provider.dart';
import 'package:haq_wt_u_nd_2_know/services/constant.dart';
import 'package:haq_wt_u_nd_2_know/services/datas.dart';

class NavBar extends StatelessWidget {
  final double screenWidth;
  final CommonProvider commonProvider;
  final Function(int) navBarFunction;
  const NavBar({
    super.key,
    required this.screenWidth,
    required this.commonProvider,
    required this.navBarFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.all(16),
      width: double.maxFinite,
      decoration: BoxDecoration(gradient: navBarBackgroundGradient, borderRadius: BorderRadius.circular(16),border: Border.all(color: backGroundColor,)),
      child: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Row(
          children: [
            const Spacer(),
            if (screenWidth > webPageSize)
              for (int i = 0; i < navBarItems.length; i++)
                InkWell(
                  onHover: (value) {
                    if (value) {
                      commonProvider.hoverIndex = i;
                    } else {
                      commonProvider.hoverIndex = -1;
                    }
                  },
                  onTap: () {
                    navBarFunction(i);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      navBarItems[i],
                      style: TextStyle(
                        color: commonProvider.hoverIndex != i ? Colors.white54 : backGroundColor,
                        fontWeight: FontWeight.w600,
                      ),
                      textScaler: TextScaler.linear(commonProvider.hoverIndex == i ? 1.1 : 1),
                    ),
                  ),
                )
            else
              IconButton(
                onPressed: () => commonProvider.scaffoldKey.currentState!.openEndDrawer(),
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white54,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
