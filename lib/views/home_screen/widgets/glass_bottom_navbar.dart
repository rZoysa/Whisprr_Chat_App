import 'dart:ui';
import 'package:flutter/material.dart';

class GlassBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const GlassBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Container(
            decoration: BoxDecoration(
              color: colorScheme.surface.withAlpha(153),
              border: Border(
                top: BorderSide(color: Colors.grey.withAlpha(51), width: 1),
              ),
            ),
            child: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: onTap,
              elevation: 0,
              selectedItemColor: Theme.of(context).primaryColor,
              backgroundColor: Colors.transparent,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.chat_bubble_outline),
                  activeIcon: Icon(Icons.chat_bubble),
                  label: 'Chats',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings_outlined),
                  activeIcon: Icon(Icons.settings),
                  label: 'Settings',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
