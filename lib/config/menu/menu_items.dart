import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem({required this.title, required this.subTitle, required this.link, required this.icon});
}

const appMenuItems = <MenuItem>[
  MenuItem(
    title: 'Counter',
    subTitle: 'Riverpod counter example',
    link: '/counter',
    icon: Icons.add_circle_outline_rounded,
  ),
  MenuItem(
    title: 'Buttons',
    subTitle: 'Multiple buttons in Flutter',
    link: '/buttons',
    icon: Icons.smart_button,
  ),
  MenuItem(
    title: 'Cards',
    subTitle: 'Stylized container',
    link: '/cards',
    icon: Icons.credit_card,
  ),
  MenuItem(
    title: 'Progress Indicators',
    subTitle: 'Generals and controlled',
    link: '/progress',
    icon: Icons.refresh_rounded,
  ),
  MenuItem(
    title: 'Dialogs and snackbars',
    subTitle: 'Screen messages or popups',
    link: '/snackbars',
    icon: Icons.info_outline,
  ),
  MenuItem(
    title: 'Animated Container',
    subTitle: 'Stateful widget animated',
    link: '/animated',
    icon: Icons.check_box_outlined,
  ),
  MenuItem(
    title: 'UI Controls + Tiles',
    subTitle: 'Flutter ui controls',
    link: '/ui-controls',
    icon: Icons.car_rental_outlined,
  ),
  MenuItem(
    title: 'App Tutorial',
    subTitle: 'A little tutorial for the app',
    link: '/tutorial',
    icon: Icons.accessibility_new_rounded,
  ),
  MenuItem(
    title: 'Infinitive Scroll & Pull to Refresh',
    subTitle: 'Infinite scroll with pull to refresh',
    link: '/infinite',
    icon: Icons.list_alt_rounded,
  ),
  MenuItem(
    title: 'Theme Changer',
    subTitle: 'Change the app theme',
    link: '/theme-changer',
    icon: Icons.color_lens_outlined,
  ),
];
