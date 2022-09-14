import 'package:cataas_app/presenter/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CsmLoading extends StatelessWidget {
  const CsmLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(color: AppColors.primary),
    );
  }
}
