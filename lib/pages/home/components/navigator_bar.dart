import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class NavigatorBar extends StatelessWidget {
  final int bottomNavIndex;
  final void Function(int idx) onTap;

  const NavigatorBar({
    super.key,
    required this.bottomNavIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final labels = ['New', 'Feedbacks'];
    final iconList = <IconData>[Icons.add_comment, Icons.chat_outlined];

    return AnimatedBottomNavigationBar.builder(
      itemCount: iconList.length,
      tabBuilder: (int index, bool isActive) {
        final color = isActive ? Theme.of(context).scaffoldBackgroundColor : Theme.of(context).primaryColor;

        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconList[index],
              size: 24,
              color: color,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                labels[index],
                maxLines: 1,
                style: TextStyle(color: color),
              ),
            )
          ],
        );
      },
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      activeIndex: bottomNavIndex,
      splashColor: Colors.white,
      splashSpeedInMilliseconds: 300,
      notchSmoothness: NotchSmoothness.defaultEdge,
      gapLocation: GapLocation.none,
      leftCornerRadius: 15,
      rightCornerRadius: 15,
      onTap: onTap,
      shadow: const BoxShadow(
        offset: Offset(0, 1),
        blurRadius: 12,
        spreadRadius: 0.5,
        color: Colors.black,
      ),
    );
  }
}
