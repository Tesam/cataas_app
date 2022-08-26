import 'package:cataas_app/presenter/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CSMCircularButton extends StatelessWidget {
  const CSMCircularButton({Key? key, required this.icon, required this.onPressed}) : super(key: key);
  final Icon icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(10),
        primary: AppColors.primary,
      ),
      child: icon,
    );
  }
}
