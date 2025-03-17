// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class GradientContainer extends StatelessWidget {
  final List<Widget> children;
  const GradientContainer({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        height: screenSize.height,
        width: screenSize.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              AppColors.black,
              AppColors.secondaryBlack,
              AppColors.secondaryBlack
                  .withAlpha((AppColors.secondaryBlack.alpha * .99).toInt()),
              AppColors.secondaryBlack
                  .withAlpha((AppColors.secondaryBlack.alpha * .98).toInt()),
              AppColors.secondaryBlack
                  .withAlpha((AppColors.secondaryBlack.alpha * .97).toInt()),
              AppColors.secondaryBlack
                  .withAlpha((AppColors.secondaryBlack.alpha * .96).toInt()),
              AppColors.secondaryBlack
                  .withAlpha((AppColors.secondaryBlack.alpha * .95).toInt()),
              AppColors.secondaryBlack
                  .withAlpha((AppColors.secondaryBlack.alpha * .94).toInt()),
              AppColors.secondaryBlack
                  .withAlpha((AppColors.secondaryBlack.alpha * .93).toInt()),
              AppColors.secondaryBlack
                  .withAlpha((AppColors.secondaryBlack.alpha * .92).toInt()),
              AppColors.secondaryBlack
                  .withAlpha((AppColors.secondaryBlack.alpha * .91).toInt()),
              AppColors.secondaryBlack
                  .withAlpha((AppColors.secondaryBlack.alpha * .90).toInt()),
              AppColors.darkBlue,
              AppColors.accentBlue,
              AppColors.blueGrey,
            ],
          ),
        ),
        padding: const EdgeInsets.only(
          // top: 36.0,
          left: 24.0,
          right: 24.0,
        ),
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                children,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
