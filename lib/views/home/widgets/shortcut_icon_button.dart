import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';

class ShortcutIconButton extends StatelessWidget {
  final IconData tileIcon;
  final String tileName;
  final Color tileColor;
  final VoidCallback onPressed;

  const ShortcutIconButton({
    Key? key,
    required this.tileIcon,
    required this.tileName,
    required this.onPressed,
    this.tileColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: tileColor,
      elevation: 0,
      // minWidth: 64,
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(defaultMarginFactor * 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(tileIcon, color: Get.theme.primaryColor),
          const SizedBox(height: defaultMarginFactor),
          Text(
            tileName,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 10),
          ),
        ],
      ),
      onPressed: onPressed,
    );
  }
}
