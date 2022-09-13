import 'package:cataas_app/presenter/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CsmButton extends StatelessWidget {
  const CsmButton({Key? key, required this.onPressed, required this.title}) : super(key: key);
  final VoidCallback onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius:
          BorderRadius.circular(20),
        ),
        elevation: 0,
        padding: const EdgeInsets.symmetric(
            horizontal: 40, vertical: 14),
        primary: AppColors.primary,
      ),
      child: Text(
        title,
        style: const TextStyle(
            color: AppColors.primary90),
      ),
    );
  }
}
