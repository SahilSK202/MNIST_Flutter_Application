import 'package:flutter/material.dart';

class MenuItem {
  final String text;
  final IconData icon;

  const MenuItem({
    required this.text,
    required this.icon,
  });
}

class MenuItems {
  static const List<MenuItem> itemsone = [itemAbout, itemSettings, itemShare];

  static const itemAbout = MenuItem(text: 'About Us', icon: Icons.people_alt);
  static const itemSettings = MenuItem(text: 'Settings', icon: Icons.settings);
  static const itemShare = MenuItem(text: 'Share', icon: Icons.share);
}
