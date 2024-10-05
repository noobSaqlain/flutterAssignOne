import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int currIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedFontSize: 20,
      unselectedFontSize: 14,
      backgroundColor: const Color(0xFFecf3f9),
      currentIndex: currIndex,
      onTap: (int index) {
        setState(
          () {
            currIndex = index;
          },
        );
      },
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: const Icon(Icons.work),
          label: 'Jobs',
          activeIcon:
              Icon(Icons.work, color: Theme.of(context).colorScheme.primary),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.person),
          label: 'Resume',
          activeIcon:
              Icon(Icons.person, color: Theme.of(context).colorScheme.primary),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.settings),
          label: 'Settings',
          activeIcon: Icon(Icons.settings,
              color: Theme.of(context).colorScheme.primary),
        ),
      ],
    );
  }
}
