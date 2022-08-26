import 'package:cataas_app/presenter/constants/app_colors.dart';
import 'package:cataas_app/presenter/constants/app_enums.dart';
import 'package:flutter/material.dart';

class CSMChip extends StatelessWidget {
  const CSMChip({
    Key? key,
    required this.widgetType,
    required this.selectedType,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final FilterType widgetType;
  final FilterType selectedType;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Chip(
        label: Text(
          title,
          style: TextStyle(
              color: (widgetType == selectedType)
                  ? Colors.white
                  : AppColors.textColor),
        ),
        backgroundColor: (widgetType == selectedType)
            ? AppColors.primary
            : AppColors.unSelectedColor,
      ),
    );
  }
}
