import 'package:cataas_app/presenter/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CSMCircularButton extends StatelessWidget {
  const CSMCircularButton({Key? key, required this.icon}) : super(key: key);
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(10),
        primary: AppColors.primary,
      ),
      child: icon,
    );
  }
}
