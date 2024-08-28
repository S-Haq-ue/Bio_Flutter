import 'package:flutter/material.dart';
import 'package:haq_wt_u_nd_2_know/provider/common_provider.dart';
import 'package:haq_wt_u_nd_2_know/services/constant.dart';
import 'package:haq_wt_u_nd_2_know/services/datas.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: backGroundColor,
      width: 200,
      shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(// Top right corner radius
              bottomLeft: Radius.circular(10.0), // Bottom right corner radius
            ),
          ),
      child: Consumer<CommonProvider>(builder: (context, commonProvider, child) {
        return ListView.builder(
          itemCount: navBarItems.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(gradient: navBarBackgroundGradient,borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Text(navBarItems[index])),
                  ),
                  // leading: index >= draweIcons.length ? const SizedBox(width: 10,) : draweIcons[index],
                  // title: Text(navBarItems[index]),
                ),
                const SizedBox(
                  height: 5,
                )
              ],
            );
          },
        );
      }),
    );
  }
}
