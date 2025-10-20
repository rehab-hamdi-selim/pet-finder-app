import 'package:flutter/material.dart';
import '../../../../../../core/theme/app_palette.dart';
import '../../../data/models/nav_item_data.dart';

BottomNavigationBarItem buildNavItem(
  NavItemData item,
  int index,
  int currentIndex,
) {
  final bool isSelected = currentIndex == index;

  return BottomNavigationBarItem(
    icon: ImageIcon(
      AssetImage(item.iconPath),
      color: isSelected ? AppPalette.primaryColor : Colors.grey,
      size: 26,
    ),
    label: item.label,
  );
}
