import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class KnowunityBottomNavigationBar extends StatelessWidget {
  const KnowunityBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      iconSize: 25,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.dashboard),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.search),
          label: 'Favorites',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.add_circled),
          label: 'Add',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.profile_circled),
          label: 'Add',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.bookmark),
          label: 'Settings',
        ),
      ],
    );
  }
}
