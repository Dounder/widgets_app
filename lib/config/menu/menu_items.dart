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
];
